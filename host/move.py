#/*
# This file is part of ddprint - a direct drive 3D printer firmware.
# 
# Copyright 2015 erwin.rieger@ibrieger.de
# 
# ddprint is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# ddprint is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with ddprint.  If not, see <http://www.gnu.org/licenses/>.
#*/

import math, struct

import ddprintcommands

# from ddprintconstants import DEFAULT_MAX_ACCELERATION, DEFAULT_ACCELERATION, fTimer, maxTimerValue16, maxTimerValue24
from ddprintconstants import maxTimerValue16, maxTimerValue24, dimNames, DEFAULT_ACCELERATION, DEFAULT_MAX_ACCELERATION, fTimer
from ddprintutil import A_AXIS, B_AXIS,vectorLength, vectorMul, vectorSub, circaf
from ddprintcommands import CommandNames

##################################################

class VVector(object):

    def __init__(self, v=None):
        if v:
            self.vv = v
        else:
            self.vv = 5 * [0.0]

    def __setitem__(self, dim, v):
        self.vv[dim] = v

    def __getitem__(self, dim):
        return self.vv[dim]

    def __getattr__(self, dim):
        return self.vv["XYZAB".index(dim.upper())]

    def __len__(self):
        return len(self.vv)

    def __repr__(self):
        return self.printSpeedVector(self.vv)

    def printSpeedVector(self, v):
        return "[%8.3f, %8.3f, %8.3f, %8.3f, %8.3f]" % tuple(v)

    def __abs__(self):
        return VVector((abs(self.x), abs(self.y), abs(self.z), abs(self.a), abs(self.b)))

    def __eq__(self, other):

        if other == None:
            return False

        for dim in range(5):
            if not circaf(self[dim] - other[dim], 0, 0.000001):
                return False
        return True

    def __ne__(self, other):
        return not self == other

    def checkJerk(self, other, jerk, selfName="", otherName=""):
        # xxx add __sub__

        for dim in range(5):
            j = abs(other[dim] - self[dim])
            if (j / jerk[dim]) > 1.1:
                print "Join '%s' <-> '%s': dimension %d %f verletzt max jerk %f" % (selfName, otherName, dim, j, jerk[dim])
                print "V1: ", self
                print "V2: ", other
                assert(0)

    def len3(self):
        return vectorLength(self.vv[:3])

    def len5(self):
        return vectorLength(self.vv)

    def feedrate3(self):
        f = self.len3()
        if circaf(f, 0, 0.000001):
            print "emove"
            assert(0)
        return f

    def _setLength(self, length):
        return self.normalized().mul(length)

    # def setFeedrate(self, v):
        # self.vv = v

    def cosAngle(self, other):
        #
        #            V1 * V2
        # cos a = ----------------
        #           |V1| + |V2|
        #
        scalarProduct = sum(multiply_vector(self.vv, other.vv))
        lenProduct = calculate_vector_magnitude(self.vv) * calculate_vector_magnitude(other.vv)
        return scalarProduct / lenProduct

    def angleBetween(self, other):
        cos = self.cosAngle(other)

        if cos >= 1:
            return 0

        return math.degrees(math.acos(cos))

    def addVVector(self, other):
        self.vv = vectorAdd(self.vv, other.vv)

    def subVVector(self, other):
        return VVector(vectorSub(self.vv, other.vv))

    def scale(self, scale):
        return VVector(vectorMul(self.vv, 5*[scale]))

    mul = scale

    def normalized(self):
        length = self.len5()
        assert(length)
        if length != 0:
            return self.scale(1.0 / length)

        # xxx not reached
        return Vec3d(self)
 
    def constrain(self, jerkVector):

        speedScale = 1.0
        for dim in range(5):
            if abs(self.vv[dim]) > jerkVector[dim]:
                speedScale = min(speedScale, jerkVector[dim] / abs(self.vv[dim]))

        # print "speedScale: ", speedScale

        if abs(1-speedScale) < 0.001:
            return None

        assert(speedScale < 1)

        return self.scale(speedScale)
  
    def constrain3(self, jerkVector):

        speedScale = 1.0
        for dim in range(3):
            if abs(self.vv[dim]) > jerkVector[dim]:
                speedScale = min(speedScale, jerkVector[dim] / abs(self.vv[dim]))

        # print "speedScale: ", speedScale

        assert(speedScale <= 1.0)
        return self.scale(speedScale)
  
    def isDisjointV(self, other, delta=0.000001):

        for dim in range(5):
            if abs(self.vv[dim]) > delta and abs(other.vv[dim]) > delta:
                return False
        return True
  
class AccelData:
    def __init__(self):
        # Erreichbare geschwindigkeit falls kein plateu [xx/min]
        # self.accelData.reachedFeedrate_xx_min = None
        # Erreichbare geschwindigkeit falls kein plateu [mm/s]
        # self.accelData.reachedFeedrate_mm_sec = None
        self.reachedovNominalVVector = None

    def __repr__(self):
        if self.reachedovNominalVVector:
            s = "AccelData:"
            s += "\n  Nom. speed not reached, Vreach: " + str(self.reachedovNominalVVector)
            return s

        return ""


class StepData:

    def __init__(self):
        # self.direction = None
        self.accelPulses = []
        self.linearTimer = None
        # self.lineaPulses = []
        self.deccelPulses = []
        self.setDirBits = False
        self.dirBits = 0
        self.leadAxis = 0
        self.abs_vector_steps = None

        # Sum of timer clocks to estimate time for move
        self.clocks = 0

    def checkTimerValue(self, timer, limit=maxTimerValue24):

        if timer < 50:
            print "timervalue %d to low, > 40kHz!" % timer
            assert(0)

        if timer > limit:
            print "timervalue %d to high, counter overflow!" % timer
            assert(0)

    def addAccelPulse(self, timer):
        self.checkTimerValue(timer)
        self.accelPulses.append(timer)
        self.clocks += timer

    def setLinTimer(self, timer):
        self.checkTimerValue(timer, maxTimerValue16)
        self.linearTimer = timer
    
    # def addLinPulse(self, bits):
        # assert(bits > 0)
        # self.linearPulses.append(bits)

    def addDeccelPulse(self, timer):
        self.checkTimerValue(timer)
        self.deccelPulses.append(timer)
        self.clocks += timer

    def setBresenhamParameters(self, leadAxis, abs_vector_steps):
        self.leadAxis = leadAxis
        self.abs_vector_steps = abs_vector_steps

    def __repr__(self):
        return "StepData:" + \
           "\n  Direction bits: 0x%x" % self.dirBits + \
           "\n  # leadAxis: %d" % self.leadAxis + \
           "\n  # abs_vector_steps: %s" % `self.abs_vector_steps` + \
           "\n  # accelPulses: %d" % len(self.accelPulses) + \
           "\n  # linearPulses: %d" % (self.abs_vector_steps[self.leadAxis] - (len(self.accelPulses) + len(self.deccelPulses))) + \
           "\n  # deccelPulses: %d" % len(self.deccelPulses)

    def checkLen(self, deltaLead):
        # assert((len(self.accelPulses) + len(self.linearPulses) + len(self.deccelPulses)) == deltaLead)
        assert(self.abs_vector_steps[self.leadAxis] - (len(self.accelPulses) + len(self.deccelPulses)) >= 0)

    def getTime(self):
        # Estimate typ by using the sum of the timer values
        return (self.clocks + (self.abs_vector_steps[self.leadAxis] * self.linearTimer)) / fTimer

##################################################

class Move(object):

    StartMove = 1
    NormalMove = 2
    IsolationMove = 4
    EndMove = 8

    def __init__(self,
                 comment,
                 # stepped_point,
                 displacement_vector,
                 displacement_vector_steps,
                 move_distance,
                 feedrate, # mm/s
                 longest_axis):

        self.comment=comment
        # self.stepped_point=stepped_point
        self.displacement_vector=displacement_vector
        self.displacement_vector_steps=displacement_vector_steps

        #
        # Move distance in XYZ plane OR extrude distance
        #
        self.move_distance=move_distance
        self.distance = displacement_vector.len5()

        self.feedrateS = feedrate # mm/s
        self.longest_axis=longest_axis

        # self.gcodeState = state
        # move_seconds = e_distance / feedrate
        # self.nominalVVector = VVector(self.displacement_vector).scale(1.0 / move_seconds)

        # 'joindata'
        # self.joinData = JoinData()

        self.trueStartSpeed = self.nominalStartSpeed = None
        self.trueEndSpeed = self.nominalEndSpeed = None

        # End 'joindata'

        self.accelData = AccelData()

        self.stepData = StepData()

        self.lastMove = None
        self.nextMove = None

        self.eOnly = self.displacement_vector[:3] == 3*[0]

        self.moveNumber = 0

        # debug
        self.state = 0 # 1: joined, 2: accel planned, 3: steps planned
        self.typ = None # 0: StartMove, 1: NormalMove, 2: IsolationMove, 3: EndMove
        self.streamed = False

    # [mm/s]
    def getFeedrateV(self, feedrateS = None):

        if feedrateS == None:
            feedrateS = self.feedrateS
        
        assert(feedrateS)

        move_seconds = self.distance / feedrateS
        return self.displacement_vector.scale(1.0 / move_seconds)

    # [mm/s]
    def _vDim(self, axis):
        return self.vVector()[axis]

    def notused_addMove(self, move):


        # assert(abs(self.dda_speed - move.dda_speed) < 0.001)
        # self.dda_speed = None # dda_speed is not used

        self.displacement_vector.addVVector(move.displacement_vector)
        self.displacement_vector_steps = vectorAdd(self.displacement_vector_steps, move.displacement_vector_steps)
        # self.e_distance += move.e_distance
        # self.stepped_point = vectorAdd(self.stepped_point, move.stepped_point)

        self.move_distance = calculate_vector_magnitude(self.displacement_vector)
        #If that distance is 0, get e_distance for A/B axis
        if self.move_distance == 0:
            assert(0)

            assert(eOnlyByGcode)

            movee_distance = max(
                makerbot_driver.Gcode.Utils.calculate_euclidean_distance([curRealPos[3]], [newRealPos[3]]),
                makerbot_driver.Gcode.Utils.calculate_euclidean_distance([curRealPos[4]], [newRealPos[4]]),
            )

        self.distance = self.displacement_vector.len5()

        # Recalculate 

        self.longest_axis = None
        longestAxisStep = 0
        for dim in range(5):
            if abs(self.displacement_vector_steps[dim]) > longestAxisStep:
                self.longest_axis = dim
                longestAxisStep = abs(self.displacement_vector_steps[dim])

        # return

        if abs(self.feedrateS - move.feedrateS) > 0.001:

            self.feedrateS = makerbot_driver.Gcode.get_safe_feedrate(
                self.displacement_vector,
                self.gcodeState.get_axes_values('max_feedrate'),
                max(self.feedrateS, move.feedrateS)
            )

        # move_seconds = self.e_distance / self.feedrate
        # self.nominalVVector = VVector(self.displacement_vector).scale(1.0 / move_seconds)

        
    def getAllowedAccelVector(self):

        # accelVector = self.vVector().setLength(DEFAULT_ACCELERATION)
        accelVector = self.displacement_vector._setLength(DEFAULT_ACCELERATION)
        return accelVector.constrain(DEFAULT_MAX_ACCELERATION) or accelVector

    def getAllowedAccel(self):

        accelVector = self.getAllowedAccelVector()
        allowedAccel = accelVector.len5() # always positive

        # print "allowedAccel:", allowedAccel, DEFAULT_ACCELERATION
        # assert(allowedAccel > 0)

        return allowedAccel

    def sanityCheck(self, jerk):

        if self.typ == self.StartMove:
            pass
        elif self.typ == self.NormalMove:
            pass
        elif self.typ == self.StartMove | self.EndMove:
            pass
        elif self.typ == self.NormalMove | self.EndMove:
             pass
        elif self.typ == self.IsolationMove | self.StartMove:
            pass
        elif self.typ == self.IsolationMove | self.EndMove:
            pass
        elif self.typ == self.IsolationMove | self.NormalMove:
            pass
        else:
            print "sanityCheck(): unknown type: 0x%x" % self.typ
            # assert()

        # self.joinData.sanityCheck()

        nextMove = self.nextMove
        dirVS = self.getFeedrateV(self.getStartFr())
        dirVE = self.getFeedrateV(self.getEndFr())
        nullV = VVector((0, 0, 0, 0, 0))

        if nextMove:
            nextDirVS = nextMove.getFeedrateV(nextMove.getStartFr())
            dirVE.checkJerk(nextDirVS, jerk, "#: %d" % self.moveNumber, "#: %d" % nextMove.moveNumber)

        else:

            # Last move
            assert(self.typ & Move.EndMove)
            dirVE.checkJerk(nullV, jerk)

        if not self.lastMove:

            # First move
            assert(self.typ & Move.StartMove)
            nullV.checkJerk(dirVS, jerk, "start 0", "#: %d" % self.moveNumber)

    def pprint(self, title):
        # assert(0)
        print "\n------ Move %s, #: %d, '%s' ------" % (title, self.moveNumber, self.comment)

        if self.eOnly:
            print "E-Only move, distance: %.2f, move_distance: %.2f, longest_axis: %s" % (self.distance, self.move_distance, dimNames[self.longest_axis])
        else:
            print "XYZ move, distance: %.2f, move_distance: %.2f, longest_axis: %s" % (self.distance, self.move_distance, dimNames[self.longest_axis])

        print "displacement_vector:", self.displacement_vector, "_steps:", self.displacement_vector_steps
        print "feedrate:", self.feedrateS, "[mm/s], nominalVVector:", self.getFeedrateV(), "[mm/s]"
        print ""

        # s = self.joinData.__repr__()
        # if s:
            # print ""
            # print s

        if self.trueStartSpeed or self.nominalStartSpeed:
            print "\n  Startspeed: ",
            if self.trueStartSpeed != None:
                print "True: %.3f <= " % self.trueStartSpeed,
            if self.nominalStartSpeed != None:
                print "Nominal: %.3f" % self.nominalStartSpeed

        if self.trueEndSpeed or self.nominalEndSpeed:
            print "\n  Endspeed: ",
            if self.trueEndSpeed != None:
                print "True: %.3f <= " % self.trueEndSpeed,
            if self.nominalEndSpeed!= None:
                print "Nominal: %.3f" % self.nominalEndSpeed,


        if self.state > 1:
            print ""
            print self.accelData

        if self.state > 2:
            print ""
            print self.stepData
        print "---------------------"

    def printJoin(self):

        print "nominal v1: ", self.printSpeedVector(self.vVector())
        if self.joinData.endSpeed:
            print "    end v1: ", self.printSpeedVector(self.joinData.endSpeed)

        if self.nextMove:
            if self.nextMove.joinData.startSpeed:
                print "  start v2: ", self.printSpeedVector(self.nextMove.joinData.startSpeed)
            print "nominal v2: ", self.printSpeedVector(self.nextMove.vVector())

    def getStartFr(self):

        if self.trueStartSpeed:
            return self.trueStartSpeed

        assert(self.nominalStartSpeed != None)
        return self.nominalStartSpeed

    def getEndFr(self):

        if self.trueEndSpeed:
            return self.trueEndSpeed
        return self.nominalEndSpeed

    def setNominalStartFr(self, fr):

        # print "set nom start of move:", self.moveNumber, fr, self.nominalStartSpeed
        # assert(fr != None)

        self.nominalStartSpeed = fr

        # if debugMoves:
            # print "setNominalStartFr():", abs(self.getStartV()[self.longest_axis]), min_speeds[self.longest_axis]
            # print "setNominalStartFr():", self.getStartV()
            # assert( (abs(self.getStartV()[self.longest_axis]) - min_speeds[self.longest_axis]) > -0.01 )

    def setNominalEndFr(self, fr):

        self.nominalEndSpeed = fr

        # if debugMoves:
            # print "setNominalEndFr():", abs(self.getEndV()[self.longest_axis]), min_speeds[self.longest_axis]
            # print "setNominalEndFr():", self.getEndV()
            # assert( (abs(self.getEndV()[self.longest_axis]) - min_speeds[self.longest_axis]) > -0.01 )

    def setTrueStartFr(self, fr):

        self.trueStartSpeed = fr

        # if debugMoves:
            # assert( abs(self.getStartV()[self.longest_axis]) > min_speeds[self.longest_axis] )

    def setTrueEndFr(self, fr):
        
        self.trueEndSpeed = fr

        # if debugMoves:
            # assert( abs(self.getEndV()[self.longest_axis]) > min_speeds[self.longest_axis] )

    def getJerkSpeed(self, jerk):

        if self.eOnly:
            return min(self.feedrateS, jerk[A_AXIS])

        f = self.getFeedrateV().constrain3(jerk).feedrate3()
        return f

    def setNominalJerkStartSpeed(self, jerk):

        f = self.getJerkSpeed(jerk)
        self.setNominalStartFr(f)

    def setNominalJerkEndSpeed(self, jerk):

        f = self.getJerkSpeed(jerk)
        self.setNominalEndFr(f)

    def isExtrudingMove(self):
        return self.displacement_vector_steps[A_AXIS] or self.displacement_vector_steps[B_AXIS]

    def getTime(self):
        t = self.stepData.getTime()
        # print "AutoTemp: time for move %d:" % self.moveNumber, t
        return t

    # return a list of binary encoded commands, ready to be send over serial...
    def commands(self):

        cmds = []

        #if self.stepData.setDirBits:
            #cmdHex = ddprintcommands.CmdDirBits
            #cmds.append((chr(cmdHex), chr(self.stepData.dirBits)))

        # debug
        """
        struct.pack("<B", self.stepData.leadAxis)
        struct.pack("<HHHHH", *self.stepData.abs_vector_steps)
        struct.pack("<H", len(self.stepData.accelPulses))
        try:
            struct.pack("<H", self.stepData.linearTimer)
        except:
            print "error on: ", self.stepData.linearTimer
            raise
        struct.pack("<H", len(self.stepData.deccelPulses))
        """

        payLoad = ""
        cmdOfs = 0

        if self.stepData.setDirBits:
            payLoad += struct.pack("<B", self.stepData.dirBits | 0x80)
            cmdOfs = 1

        payLoad += struct.pack("<BIIIIIHHH", 
                self.stepData.leadAxis,
                self.stepData.abs_vector_steps[0],
                self.stepData.abs_vector_steps[1],
                self.stepData.abs_vector_steps[2],
                self.stepData.abs_vector_steps[3],
                self.stepData.abs_vector_steps[4],
                len(self.stepData.accelPulses),
                self.stepData.linearTimer,
                len(self.stepData.deccelPulses))

        if (self.stepData.accelPulses and self.stepData.accelPulses[0] > maxTimerValue16) or \
           (self.stepData.deccelPulses and self.stepData.deccelPulses[-1] > maxTimerValue16):

            cmdHex = ddprintcommands.CmdG1_24 + cmdOfs

            """
            for timer in self.stepData.accelPulses:
                payLoad += struct.pack("<I", timer)
            for timer in self.stepData.deccelPulses:
                payLoad += struct.pack("<I", timer)
            """

            for timer in self.stepData.accelPulses:
                timerCount = timer / 0xffff
                payLoad += struct.pack("<B", timerCount)

                rest = timer - (timerCount * 0xffff)
                payLoad += struct.pack("<H", max(50, rest))

            for timer in self.stepData.deccelPulses:
                timerCount = timer / 0xffff
                payLoad += struct.pack("<B", timerCount)

                rest = timer - (timerCount * 0xffff)
                payLoad += struct.pack("<H", max(50, rest))
        else:

            cmdHex = ddprintcommands.CmdG1 + cmdOfs

            for timer in self.stepData.accelPulses:
                payLoad += struct.pack("<H", timer)
            for timer in self.stepData.deccelPulses:
                payLoad += struct.pack("<H", timer)

        #
        # Create 256 byte blocks
        #
        payloadSize = len(payLoad)
        lenPayload = min(payloadSize, 256)

        cmds.append(( chr(cmdHex), payLoad ))

        pos = lenPayload
        payloadSize -= lenPayload

        while payloadSize:

            # print "payloadSize: ", len(payLoad), ", left: ", payloadSize
            lenPayload = min(payloadSize, 256)

            payloadBlock = payLoad[pos:pos+lenPayload]

            cmds.append(( chr(ddprintcommands.CmdBlock), payloadBlock ))

            pos += lenPayload
            payloadSize -= lenPayload

        return cmds

    def isDisjointSteps(self, other, delta=2):

        for dim in range(5):
            if abs(self.displacement_vector_steps[dim]) > delta and abs(other.displacement_vector_steps[dim]) > delta:
                return False
        return True


