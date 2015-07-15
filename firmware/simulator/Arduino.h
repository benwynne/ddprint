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

#if defined(DDSim)

    #include <stdint.h>

    #include <iostream>

    #define HIGH 1
    #define LOW 0

    #define ADEN 0
    #define MUX5 3
    #define ADSC 6
    #define REFS0 6
    #define CS50 0
    #define CS51 0
    #define CS52 0
    #define CS10 0
    #define WGM13 0
    #define WGM12 0
    #define WGM11 0
    #define WGM10 0
    #define COM1A0 0
    #define COM1B0 0
    #define OCIE1A 1
    #define OCIE1B 2
    #define OCIE3A 0

    #define LCD_ALERTMESSAGEPGM(s) printf(s"\n")

    #define PROGMEM /**/
    #define _BV(x) x

    #define ISR(x) void ISR##x()

    #define INPUT 0
    #define OUTPUT 1

    extern int DIDR0;
    extern int DIDR2;
    extern int ADCSRA;
    extern int ADCSRB;
    extern int ADMUX;
    extern int TCCR5B;
    extern int TCCR1B;
    extern int TCCR1A;
    extern int TCCR3B;
    extern int TCCR3A;
    extern int OCR1A;
    extern int OCR1B;
    extern int TCNT1;
    extern int TCNT3;
    extern int TIMSK0;
    extern int TIMSK1;
    extern int TIMSK3;
    extern int OCR3A;

    // For Sd2PinMap.h:
    extern uint8_t DDRA;
    extern uint8_t PINA;
    extern uint8_t PORTA;
    extern uint8_t DDRB;
    extern uint8_t PINB;
    extern uint8_t PORTB;
    extern uint8_t DDRC;
    extern uint8_t PINC;
    extern uint8_t PORTC;
    extern uint8_t DDRD;
    extern uint8_t PIND;
    extern uint8_t PORTD;
    extern uint8_t DDRE;
    extern uint8_t PINE;
    extern uint8_t PORTE;
    extern uint8_t DDRF;
    extern uint8_t PINF;
    extern uint8_t PORTF;
    extern uint8_t DDRG;
    extern uint8_t PING;
    extern uint8_t PORTG;
    extern uint8_t DDRH;
    extern uint8_t PINH;
    extern uint8_t PORTH;
    extern uint8_t DDRI;
    extern uint8_t PINI;
    extern uint8_t PORTI;
    extern uint8_t DDRJ;
    extern uint8_t PINJ;
    extern uint8_t PORTJ;
    extern uint8_t DDRK;
    extern uint8_t PINK;
    extern uint8_t PORTK;
    extern uint8_t DDRL;
    extern uint8_t PINL;
    extern uint8_t PORTL;


    //extern uint8_t MCUSR;

    // Temp 0
    extern int ADC;

    uint16_t pgm_read_word(const void* ptr);
    typedef std::string String;

    void SET_OUTPUT(int pin);

    void analogWrite(int pin, uint8_t m);
    void wdt_enable(uint8_t /* wdt_time */);


    void cli();
    void sei();
    void SET_INPUT(int pin);

    void pinMode(int pin, uint8_t m);

    unsigned long millis();

    // uint8_t eeprom_read_byte (const uint8_t *__p);

    // #include <hardware/arduino/cores/arduino/Arduino.h>
    int constrain(int v, int l, int u);
    float constrain(float v, float l, float u);

#endif

