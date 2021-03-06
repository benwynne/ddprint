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

import ddprintutil as util, logging

# from __future__ import print_function

#
# Dumb console tui interface
#
class DumbGui:

    def log(self, *args):
        # print(*args)
        logging.info(util.stringFromArgs(*args))

    def logRecv(self, *args):
        # print(*args)
        logging.info("REPLY: %s", util.stringFromArgs(*args))

    def logSend(self, *args):
        # print(*args)
        logging.info("SEND: %s", util.stringFromArgs(*args))

    def logError(self, *args):
        # print(*args)
        logging.error(util.stringFromArgs(*args))

    def tempCb(self, t0=None, t1=None, targetT1=None):
        # print("tempCb: ", t0, t1)
        logging.info("tempCb: %s %s/%s", str(t0), str(t1), str(targetT1))

    def statusCb(self, status):
        print "statusCb: ", status



