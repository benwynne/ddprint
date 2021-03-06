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

#ifndef __mdebug_h__
#define __mdebug_h__

void mAssert(uint16_t line, const char* file);
void killMessage(uint8_t errorCode, uint8_t errorParam, const char *msg = "");
void killMessage(uint8_t errorCode, uint8_t errorParam1, uint8_t errorParam2, const char *msg = "");

//
// Add heavy and time consuming debugging
//
// #define HEAVYDEBUG 1

#if defined(AVR)

    extern void kill(const char*);
    #define  massert(expr) { \
        if (!(expr)) mAssert(__LINE__, __FILE__); }

    // Assertion that is only active in simulation
    #define simassert(x) 

    #define FWINLINE inline

    #define printf ERROR_PRINTF_USED
#else

    #include <assert.h>
    #define massert assert

    // Assertion that is only active in simulation
    #define simassert assert

    #define FWINLINE  /* */

#endif

#endif

