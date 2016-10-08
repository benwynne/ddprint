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


############################################################################
# Maximum acceleration of each axis X, Y, Z, (A/B/E)
#define DEFAULT_MAX_ACCELERATION      {9000,9000,100,10000}
MAX_AXIS_ACCELERATION_NOADV = [9000, 9000, 100, 10000, 10000] # [ mm/s^s ]

# Maximum combined acceleration of the X, Y, Z and E axes 
#define DEFAULT_ACCELERATION          3000
_MAX_ACCELERATION =         3000    # [ mm/s^s ]

#define DEFAULT_RETRACT_ACCELERATION  3000   // E max acceleration in mm/s^2 for retracts

# const unsigned int dropsegments=5; //everything with less than this number of steps will be ignored as move and joined with the next movement
DropSegments = 5          # steps

############################################################################
#
# Stepdata types
#
StepDataTypeBresenham = 0
StepDataTypeRaw       = 1


############################################################################
#
# Priming
#
#// number of mm^3 of plastic to extrude when priming
#// (Ultimaker 2 hot end capacity is approx 80 mm^3)
# PRIMING_MM3	= 50
PRIMING_MM3	= 60 # increased because of end-of-print retraction

#// Rate at which to prime head (in mm^3/s)
#// (Ultimaker 2 upper limit is 8-10)
PRIMING_MM3_PER_SEC = 5

#// Height at which to perform the priming extrusions
PRIMING_HEIGHT = 20


############################################################################
#
# Board config, move to printer-profile ?
#
fTimer = 2000000.0 # Hz
maxTimerValue16 = pow(2, 16)
maxTimerValue24 = pow(2, 24)

############################################################################
#
# Axes
#
X_AXIS = 0
Y_AXIS = 1
Z_AXIS = 2
A_AXIS = 3
B_AXIS = 4

dimNames = ["X", "Y", "Z", "A", "B"]

dimIndex = { "X": X_AXIS, "Y": Y_AXIS, "Z": Z_AXIS, "A": A_AXIS, "B": B_AXIS }

############################################################################
#
# Cobs encoding
#
SOH = 0x0 # COBS encoding

############################################################################
#
# Extrusion limit, tempTable
#
NExtrusionLimit = 40
# ExtrusionLimitBaseTemp = 190


############################################################################
#
# Extruder advance
#
# Threshold value, if the difference of the extrusion rate of two moves
# is below this value, we assume they have the same extrusion rate.
# AdvanceEThreshold=0.01 # [mm/s]
# AdvanceEThreshold=0.00000001 # [mm/s]
AdvanceEThreshold=0.001 # [mm/s]

#
# Minimum extrusion rate difference between two moves for advance.
# AdvanceMinERate = 0.1 # [mm/s]
# Minimum duration of accel- and decel-ramps to apply advance.
##AdvanceMinRamp = 0.001 # [s]
##AdvanceMinRamp = 0.002 # [s]
##AdvanceMinRamp = 0.0025 # [s]
##AdvanceMinRamp = 0.01 # [s]

# Minimum len in steps of acceleration- or deceleration ramp to apply advance
AdvanceMinRamp = 2
AdvanceMinRamp = 7
AdvanceMinRamp = 5











