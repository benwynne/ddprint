/*
* This file is part of ddprint - a direct drive 3D printer firmware.
* 
* Copyright 2015 erwin.rieger@ibrieger.de
* 
* ddprint is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* ddprint is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with ddprint.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#include <stdio.h>
#include <math.h>

#include <stdlib.h>

#include "config.h"
#include "Configuration.h"
#include "pins.h"
#include "mdebug.h"
#include "fastio.h"
#include "swapdev.h"
#include "stepper.h"

#if defined(DDSim)
    #include <unistd.h>
    #include <fcntl.h>
    #include <sys/stat.h>
    #include <assert.h>
#endif

#if 0
#define MSG_FREE_MEMORY " Free Memory: "
#define MSG_ERR_STOPPED "Printer stopped due to errors. Fix the error and use M999 to restart. (Temperature is reset. Set it after restarting)"
#define MSG_STOPPED "STOPPED. "
#define MSG_SD_FILE_OPENED "File opened: "
#define MSG_SD_SIZE " Size: "
#define MSG_SD_FILE_SELECTED "File selected"
#define MSG_SD_OPEN_FILE_FAIL "open failed, File: "
#define MSG_SD_WRITE_TO_FILE "Writing to file: "
#define MSG_ERR_KILLED "Printer halted. kill() called, msg: "
#define MSG_KILLED "KILLED. "
#endif

// #define LCD_MESSAGEPGM(x) SERIAL_PROTOCOLLNPGM(x)
// #define lcd_setstatus(message) SERIAL_PROTOCOLLN(message)
// #if defined(MarlinFw)
    // #define LCD_ALERTMESSAGEPGM(s) SERIAL_PROTOCOLLNPGM(s)
// #endif

// Number of entries in ExtrusionRateLimit table, this must match the value
// in the host (ddprintconstants.py).
#define NExtrusionLimit 100
extern uint16_t tempExtrusionRateTable[];
extern uint16_t extrusionLimitBaseTemp;

extern uint8_t errorFlags;

void kill();
// void kill(const char* msg);
// void killPGM(const char* msg);

// bool IsStopped();
// void Stop(uint8_t reasonNr);
extern void watchdog_reset();
void setup();

class Printer {

        bool eotReceived;
        uint8_t homed[3];
        // We erase entire swapdev (sdcard) to speed up writes.
        bool swapErased;

    public:

        // State enum
        // XXX can we combind the StateIdle and StateInit states?
        enum {
            StateIdle,       // 
            StateInit,       // 
            StateStart,      //
            StateDwell       //
            } printerState;

        typedef enum {
            MoveTypeNone,
            MoveTypeHoming,
            MoveTypeNormal,
            // notused MoveTypeForced
            } MoveType;

        MoveType moveType;

        // long z_max_pos_steps;
        int16_t bufferLow;

        Printer();
        void printerInit();
        void cmdMove(MoveType);
        void cmdEot();
        void cmdHome();
        void setHomePos( int32_t x, int32_t y, int32_t z /*, int32_t a, int32_t b*/);
        void cmdSetTargetTemp(uint8_t heater, uint16_t temp);
        void checkMoveFinished();
        void disableSteppers();
        void cmdDisableSteppers();
        void cmdDisableStepperIsr();
        void cmdGetDirBits();
        void cmdGetHomed();
        void cmdGetEndstops();
        void cmdGetPos();
        void cmdFanSpeed(uint8_t speed);
        void cmdContinuousE(uint16_t timerValue);
        void cmdStopMove();
        void cmdGetTargetTemps();
        void cmdGetCurrentTemps();
        void cmdGetStatus();
        void cmdGetFilSensor();
        void cmdGetTempTable();
        void cmdSetTempTable();
        void dwellStart();
        void dwellEnd();
};

extern Printer printer;


class FillBufferTask : public Protothread {

        uint16_t flags;
        uint8_t timerLoop;
        uint16_t lastTimer;

        uint16_t nAccel;
        uint8_t leadAxis;
        uint16_t tLin;
        uint16_t nDecel;
        int32_t absSteps[5];

        // Bresenham factors
        int32_t d_axis[5];
        int32_t d1_axis[5];
        int32_t d2_axis[5];

        int32_t deltaLead, step;

        // Hotend target temp for CmdSyncTargetTemp
        uint8_t targetHeater;
        uint16_t targetTemp;

        unsigned long dwellEnd;

        bool cmdSync;

#if defined(USEExtrusionRateTable)
        // Scaling factor for timerValues to implement temperature speed limit 
        float timerScale;
#endif

        stepData sd;

    public:
        FillBufferTask() {
            sd.dirBits = 0;
            cmdSync = false;
        }

        bool Run();

        void sync() {
            cmdSync = false;
        }

        bool synced() {
            return cmdSync;
        }

        // Flush/init swap, swapreader, fillbuffer task and stepbuffer
        void flush();

        //
        // Compute stepper bits, bresenham
        //
        FWINLINE void computeStepBits() {

            sd.stepBits = 1 << leadAxis;

            for (uint8_t i=0; i<5; i++) {

                if (i == leadAxis)
                    continue;

                if (d_axis[i] < 0) {
                    //  d_axis[a] = d + 2 * abs_displacement_vector_steps[a]
                    d_axis[i] += d1_axis[i];
                }
                else {
                    //  d_axis[a] = d + 2 * (abs_displacement_vector_steps[a] - deltaLead)
                    d_axis[i] += d2_axis[i];
                    sd.stepBits |= 1 << i;
                }
            }
        }

};

extern FillBufferTask fillBufferTask;






