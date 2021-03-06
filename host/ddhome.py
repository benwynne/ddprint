# -*- coding: utf-8 -*-
#
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

import struct

from ddprintcommands import *
from ddprintstates import *
from ddprintconstants import dimNames
from ddprofile import PrinterProfile

import ddprintutil as util

####################################################################################################

def homeMove(parser, dim, direction, dist, fakeHomingEndstops, feedRateFactor=1.0):

    planner = parser.planner
    printer = planner.printer

    printer.sendPrinterInit()

    parser.setPos(planner.zeroPos)

    print "---------------- send homing move, dim: %d, dist: %.2f" % (dim, dist*direction)

    cmd = "G0 F%f %s%f" % (
        planner.HOMING_FEEDRATE[dim]*60*feedRateFactor,
        dimNames[dim], dist * direction * planner.HOME_DIR[dim])

    print "homeMove: ", cmd

    parser.execute_line(cmd);

    planner.finishMoves()

    # Send homing command
    printer.sendCommandParamV(CmdMove, [MoveTypeHoming])
    printer.sendCommand(CmdEOT)

    printer.waitForState(StateIdle, wait=0.05)

    if direction > 0:
        # Move towards endstop
        # Check, if enstop was triggered
        if not printer.endStopTriggered(dim, fakeHomingEndstops):
            return False

    else:
        # Move away from endstop
        # Check, if enstop was released
        if printer.endStopTriggered(dim):
            return False

    return True

def homeBounce(parser, dim, fakeHomingEndstops):

    planner = parser.planner
    printer = planner.printer

    if not homeMove(parser, dim, -1, planner.HOME_RETRACT_MM, fakeHomingEndstops): # Back off
        return False

    if not homeMove(parser, dim, 1, planner.HOME_RETRACT_MM * 1.5, fakeHomingEndstops, 0.33): # Move towards endstop slowly
        return False

    return homeMove(parser, dim, -1, planner.HOME_RETRACT_MM * 1.5, fakeHomingEndstops, 0.33) # Back off


####################################################################################################

def home(parser, fakeHomingEndstops=False, force=False):

    planner = parser.planner
    printer = planner.printer

    print "*"
    print "* Start homing..."
    print "*"
    if printer.isHomed() and not force:
        print "Printer is homed already..."

        # Send init command
        printer.sendPrinterInit()

        # Get current pos from printer and set our virtual pos
        curPosMM = util.getVirtualPos(parser)

        (homePosMM, homePosStepped) = planner.getHomePos()

        # print "Printer should be at [mm]: ", homePosMM, ", [steps]: ", homePosStepped

        # Move to home
        if not curPosMM.equal(homePosMM, "XYZ"):

            #
            # Z Achse isoliert und als erstes bewegen, um zusammenstoss mit den klammern
            # der buildplatte oder mit objekten auf der druckplatte zu vermeiden.
            #
            if not curPosMM.equal(homePosMM, "Z"):

                parser.execute_line("G0 F%d Z%f" % (
                    PrinterProfile.getMaxFeedrate(util.Z_AXIS)*60, homePosMM.Z))

            if not curPosMM.equal(homePosMM, "XY"):

                parser.execute_line("G0 F%d X%f Y%f" % (
                    PrinterProfile.getMaxFeedrate(util.X_AXIS)*60, 
                    homePosMM.X, homePosMM.Y))

            planner.finishMoves()
            printer.sendCommandParamV(CmdMove, [MoveTypeNormal])
            printer.sendCommand(CmdEOT)

            printer.waitForState(StateIdle, wait=0.05)

        #
        # Set Virtual E-pos 0:
        #
        parser.setPos(homePosMM)

        print "*"
        print "* Done homing..."
        print "*"
        return

    #
    # Z Achse isoliert und als erstes bewegen, um zusammenstoss mit den klammern
    # der buildplatte oder mit einem modell zu vermeiden.
    #
    for dim in [util.Z_AXIS, util.X_AXIS, util.Y_AXIS]:

        # Try fast home if endstop is pressed
        if printer.endStopTriggered(dim, fakeHomingEndstops):

            print "Homing: endstop %d is triggered, trying fast home." % dim
            if homeBounce(parser, dim, fakeHomingEndstops):
                continue

        # Try fast home if head/bed is near the endstop
        print "Homing: doing short/fast home."
        if homeMove(parser, dim, 1, planner.MAX_POS[dim] / 10.0, fakeHomingEndstops): # Move towards endstop fast

            print "Homing: endstop %d is triggered, trying fast home." % dim
            if homeBounce(parser, dim, fakeHomingEndstops):
                continue

        # Do the full slow homing move
        print "Homing: doing full/slow home."
        if not homeMove(parser, dim, 1, planner.MAX_POS[dim] * 1.25, fakeHomingEndstops): # Move towards endstop fast
            print "Error, Endstop %d NOT hit!" % dim
            assert(0)

        if not homeBounce(parser, dim, fakeHomingEndstops):
            print "Error, Bounce %d!" % dim
            assert(0)


    #
    # Set position in steps on the printer side and set our 'virtual position':
    #
    # xxx set end-of-print retraction e-pos also here?
    #
    # parser.setPos(planner.homePosMM)
    # payload = struct.pack("<iiiii", *planner.homePosStepped)
    (homePosMM, homePosStepped) = planner.getHomePos()
    parser.setPos(homePosMM)

    # print "Tell printer its position [steps]:", homePosStepped
    payload = struct.pack("<iiiii", *homePosStepped)
    printer.sendCommand(CmdSetHomePos, binPayload=payload)

    print "*"
    print "* Done homing..."
    print "*"

####################################################################################################

