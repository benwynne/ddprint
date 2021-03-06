
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


/*
 * ADNS9800:
 * This guy uses fixed frame rate for "robotics use": https://github.com/svofski/ADNS-9800-Energia/blob/master/ADNS-9800-Energia.ino.
 * Don't know if this leads to better results here.
 */

#include <Arduino.h>

#include "ddprint.h"
#include "filsensor.h"
#include "stepper.h"
#include "temperature.h"
#include "fastio.h"
#include "ddserial.h"
#include "ddcommands.h"
#include "ddlcd.h"
#include "ddmacro.h"

#if defined(ADNSFS)
    // #include "adns9800fwa4.h"
    // #include "adns9800fwa5.h"
    #include "adns9800fwa6.h"
#endif

/*
 * Estimate Polling rate:
 *
 * Max extrusion: 50mm³/s, with 1.75mm filament: 20.8 mm/s filament speed
 *
 *  -> estepper runs at ca. 3000 steps/s 
 *  -> filsensor::run() is called every 100ms -> ca. 300 steps per call
 */

// Factor to compute Extruder steps from filament sensor count
// #define ASTEPS_PER_COUNT (25.4*141/1000.0)

#define FilSensorDebug 1

#if defined(ADNSFS) || defined(PMWFS)
    SPISettings spiSettingsFS(4000000, MSBFIRST, SPI_MODE3);
#endif

#if defined(PMWFS)

#include "pmw3360fw.h"

FilamentSensorPMW3360 filamentSensor;

FilamentSensorPMW3360::FilamentSensorPMW3360() {

    feedrateLimiterEnabled = true;
    filSensorCalibration= 1.397;

    init();
}

void FilamentSensorPMW3360::init() {

    slippage.reset(1.0);
    grip = 1.0;

    lastASteps = current_pos_steps[E_AXIS];
}

uint8_t FilamentSensorPMW3360::readLoc(uint8_t addr){

  WRITE(FILSENSNCS, LOW);
  dDPrintSpi.transfer(addr);
  delayMicroseconds(100); // Tsrad

  uint8_t ret = dDPrintSpi.transfer(0);
  delayMicroseconds(1); // tSCLK-NCS for read operation is 120ns

  WRITE(FILSENSNCS, HIGH);
  delayMicroseconds(19); // tSRW/tSRR (=20us) minus tSCLK-NCS 
  return ret;
}

void FilamentSensorPMW3360::writeLoc(uint8_t addr, uint8_t value) {

  WRITE(FILSENSNCS, LOW);
  dDPrintSpi.transfer(addr | 0x80);

  dDPrintSpi.transfer(value);

  delayMicroseconds(20); // tSCLK-NCS for write operation
  WRITE(FILSENSNCS, HIGH);
  delayMicroseconds(100); // tSWW/tSWR (=120us) minus tSCLK-NCS. Could be shortened, but is looks like a safe lower bound 
}

int16_t FilamentSensorPMW3360::getDY() {

    //write 0x01 to Motion register and read from it to freeze the motion values and make them available
    writeLoc(Motion, 0x01);
    uint8_t mot = readLoc(Motion);

    if (mot & 0x80) { // Motion register

#if !defined(burst)
        // XXX x_delta must be read also?!
        readLoc(Delta_X_L); // X_L
        readLoc(Delta_X_H); // X_H

        uint8_t y = readLoc(Delta_Y_L); // Y_L
        int8_t yh = readLoc(Delta_Y_H);
#endif

        int16_t dy = ((int16_t)yh << 8) | y;

        // lcd.setCursor(0, 1); lcd.print("          ");
        // lcd.setCursor(0, 1); lcd.print(y);

        return dy;
    }

    return 0;
}

void FilamentSensorPMW3360::run() {

    // Berechne soll flowrate, filamentsensor ist sehr ungenau bei kleiner geschwindigkeit.

    CRITICAL_SECTION_START
    long astep = current_pos_steps[E_AXIS];
    CRITICAL_SECTION_END

    float deltaStepperSteps = astep - lastASteps; // Requested extruded length

    if (fabs(deltaStepperSteps) > 40.0) {

        dDPrintSpi.beginTransaction(spiSettingsFS);
        int16_t deltaSensorSteps = getDY(); // read distance delta from filament sensor

        //
        // Compute the amount of "feeder slippage"
        //
        // Slippage is 1.0 if the feeder does not slip, then the amount of feed filament is
        // exactly the amount that should be extruded.
        //
        // Normally slippage is greater 1.0 since there is always some back-pressure in the
        // filament and therefore the amount of filamnet fed is lower than it should be.
        //
        if (deltaSensorSteps != 0) {

            float slip = (deltaStepperSteps * filSensorCalibration) / deltaSensorSteps;
            slippage.addValue(fabs(slip));
        }
        else {

            // No measurement from filament sensor:
            //   * no filament
            //   * filament grinding
            //   * some hardware failure
            if (deltaStepperSteps > 1000.0) {

                slippage.addValue(10);
            }
            return;
        }

        float s = slippage.value();

        if (feedrateLimiterEnabled && (s > 0.0)) {

            float allowedSlippage = s * 0.90; // allow for 10% slip before we slow down
            float g = max(1.0, pow(allowedSlippage - 1.0, 2)*25);
            grip = STD min((float)3.0, g);
        }

        /*
        lcd.setCursor(0, 0); lcd.print("DS:"); lcd.print(deltaStepperSteps); lcd.print("     ");
        lcd.setCursor(0, 1); lcd.print("DY:"); lcd.print(deltaSensorSteps); lcd.print("     ");
        lcd.setCursor(0, 2); lcd.print("RA:"); lcd.print(ratio); lcd.print("     ");
        lcd.setCursor(0, 3); lcd.print("RA:"); lcd.print(s); lcd.print(" "); lcd.print(grip); lcd.print("     ");
        */

        lastASteps = astep;
    }
}

void FilamentSensorPMW3360::reset(){

    // return;

    dDPrintSpi.beginTransaction(spiSettingsFS);

    WRITE(FILSENSNCS, HIGH); // adns_com_end(); // ensure that the serial port is reset
    WRITE(FILSENSNCS, LOW); // adns_com_begin(); // ensure that the serial port is reset
    WRITE(FILSENSNCS, HIGH); // adns_com_end(); // ensure that the serial port is reset

    writeLoc(Power_Up_Reset, 0x5a); // force reset
    delay(50); // wait for it to reboot

    // read registers 0x02 to 0x06 (and discard the data)
    readLoc(Motion);
    readLoc(Delta_X_L);
    readLoc(Delta_X_H);
    readLoc(Delta_Y_L);
    readLoc(Delta_Y_H);

    /////////////////////////////////////////////////////////////
    // send the firmware to the chip, cf p.18 of the datasheet

    //Write 0 to Rest_En bit of Config2 register to disable Rest mode.
    writeLoc(Config2, 0x20);
  
    // write 0x1d in SROM_enable reg for initializing
    writeLoc(SROM_Enable, 0x1d); 
  
    // wait for more than one frame period
    delay(10); // assume that the frame rate is as low as 100fps... even if it should never be that low
  
    // write 0x18 to SROM_enable to start SROM download
    writeLoc(SROM_Enable, 0x18); 
  
    // write the SROM file (=firmware data) 
    WRITE(FILSENSNCS, LOW); // adns_com_begin();
    dDPrintSpi.transfer(SROM_Load_Burst | 0x80); // write burst destination adress
    delayMicroseconds(15);
  
    // send all bytes of the firmware
    unsigned char c;
    for(uint16_t i = 0; i < sizeof(firmware_data); i++){ 
        c = (unsigned char)pgm_read_byte(firmware_data + i);
        dDPrintSpi.transfer(c);
        delayMicroseconds(15);
    }

    WRITE(FILSENSNCS, HIGH); // adns_com_end();

    delay(1);

    //Read the SROM_ID register to verify the ID before any other register reads or writes.
    uint8_t srom_id = readLoc(SROM_ID);

    //
    // Write 0x00 to Config2 register for wired mouse or 0x20 for wireless mouse design.
    // Wireless mode is powersaving mode (REST MODE).
    //
    writeLoc(Config2, 0x00);

    // set initial CPI resolution, 5000 cpi is default cpi
    // writeLoc(Config1, 0x15);
  
    // WRITE(FILSENSNCS, HIGH); // adns_com_end();

    uint8_t snap = readLoc(Angle_Snap);
        writeLoc(Angle_Snap, snap | 0x80);

    /////////////////////////////////////////////////////////////
    // delay(10);

    if (srom_id != SROMVER) {
        LCDMSGKILL(RespKilled, "srom_id != SROMVER", srom_id);
        txBuffer.sendSimpleResponse(RespKilled, RespFilsensorInit);
        kill();
    }
}

#endif // #if defined(PMWFS)

#if defined(ADNSFS)

FilamentSensorADNS9800 filamentSensor;

FilamentSensorADNS9800::FilamentSensorADNS9800() {

    feedrateLimiterEnabled = true;

    init();
}

void FilamentSensorADNS9800::init() {

    // yPos = 0;

    slippage.reset(1.0);
    grip = 1.0;

    lastASteps = current_pos_steps[E_AXIS];
    lastTSs = micros();
    // lastTSf = micros();

    // targetSpeed = 0;
    // targetSpeed.reset();

    // actualSpeed = 0;
    // actualSpeed.reset();

    // iRAvg = 0;
    // nRAvg = 0;

    // grip = 200;
}

uint8_t FilamentSensorADNS9800::readLoc(uint8_t addr){

  WRITE(FILSENSNCS, LOW);
  dDPrintSpi.transfer(addr);
  delayMicroseconds(100); // Tsrad

  uint8_t ret = dDPrintSpi.transfer(0);
  WRITE(FILSENSNCS, HIGH);
  delayMicroseconds(20); // Tsrw/Tsrr
  return ret;
}

void FilamentSensorADNS9800::writeLoc(uint8_t addr, uint8_t value) {

  WRITE(FILSENSNCS, LOW);
  dDPrintSpi.transfer(addr | 0x80);

  dDPrintSpi.transfer(value);
  delayMicroseconds(100); // Tsww/Tswr 
  WRITE(FILSENSNCS, HIGH);
}

int16_t FilamentSensorADNS9800::getDY() {

    uint8_t mot = readLoc(REG_Motion); // this freezes the X/Y registers until they are read

    if (mot & 0x80) { // Motion register

#if !defined(burst)
        // XXX x_delta must be read also?!
        readLoc(REG_Delta_X_L); // X_L
        readLoc(REG_Delta_X_H); // X_H

        uint8_t y = readLoc(REG_Delta_Y_L); // Y_L
        int8_t yh = readLoc(REG_Delta_Y_H);
#endif

        int16_t dy = ((int16_t)yh << 8) | y;

        return dy;
    }

    return 0;
}

#define kLimit 2.0

void FilamentSensorADNS9800::run() {

    // Berechne soll flowrate, filamentsensor ist sehr ungenau bei kleiner geschwindigkeit.

    CRITICAL_SECTION_START
    long astep = current_pos_steps[E_AXIS];
    CRITICAL_SECTION_END

    float ds = astep - lastASteps; // Requested extruded length

    if (ds > 50) {

        dDPrintSpi.beginTransaction(spiSettingsFS);
        int16_t dy = getDY(); // read distance delta from filament sensor

        uint32_t ts = micros();
        int32_t dt = ts - lastTSs;  // time delta

        float ratio = dy / ds;

        if (ratio > 0)
            slippage.addValue(ratio);
        else {
            // dy is 0
            slippage.addValue(10.0);
        }

        if (feedrateLimiterEnabled) {

            // float g = max(1.0, (cal / slippage.value() - 1) * kLimit + 1);
            float allowedSlippage = slippage.value() * 0.90; // allow for 10% slip
            float g = max(1.0, (allowedSlippage - 1.0) * kLimit + 1.0);
            grip = STD min((float)3.0, g);
        }

        /*
        lcd.setCursor(0, 0); lcd.print("DS:"); lcd.print(ds); lcd.print("     ");
        lcd.setCursor(0, 1); lcd.print("DY:"); lcd.print(dy); lcd.print("     ");
        lcd.setCursor(0, 2); lcd.print("RA:"); lcd.print(ratio); lcd.print("     ");
        lcd.setCursor(0, 3); lcd.print("RA:"); lcd.print(slippage.value()); lcd.print(" "); lcd.print(grip); lcd.print("     ");
        */

        lastTSs = ts;
        lastASteps = astep;
    }
}

void FilamentSensorADNS9800::reset(){

    dDPrintSpi.beginTransaction(spiSettingsFS);

#if 0
    uint8_t productId = readLoc(REG_Product_ID); // Product
    SERIAL_ECHOPGM("Filament sensor Prod: 0x");
    MSerial.println(productId, HEX);

    // Check inverse product id:
    uint8_t invProductId = readLoc(REG_Inverse_Product_ID);
    SERIAL_ECHOPGM("REG_Inverse_Product_ID: 0x");
    MSerial.println(invProductId, HEX);

    SERIAL_ECHOPGM("Filament sensor Rev: 0x");
    MSerial.println(readLoc(REG_Revision_ID), HEX); // Rev

    uint8_t configReg1 = readLoc(REG_Configuration_I);
    SERIAL_ECHOPGM("Filament sensor config1: 0x");
    MSerial.println(configReg1, HEX);
#endif

    // ensure that the serial port is reset
    WRITE(FILSENSNCS, HIGH);
    WRITE(FILSENSNCS, LOW);
    WRITE(FILSENSNCS, HIGH);

    writeLoc(REG_Power_Up_Reset, 0x5a); // force reset
    delay(50); // wait for it to reboot

    // read registers 0x02 to 0x06 (and discard the data)
    readLoc(REG_Motion);
    readLoc(REG_Delta_X_L);
    readLoc(REG_Delta_X_H);
    readLoc(REG_Delta_Y_L);
    readLoc(REG_Delta_Y_H);

    // upload the firmware
    // send the firmware to the chip, cf p.18 of the datasheet
    // SERIAL_ECHOPGM("Uploading firmware, # of bytes: ");
    // SERIAL_ECHOLN(sizeof(sromData));

    // set the configuration_IV register in 3k firmware mode
    writeLoc(REG_Configuration_IV, 0x02); // bit 1 = 1 for 3k mode, other bits are reserved 
  
    // write 0x1d in SROM_enable reg for initializing
    writeLoc(REG_SROM_Enable, 0x1d); 
  
    // wait for more than one frame period
    delay(10); // assume that the frame rate is as low as 100fps... even if it should never be that low
  
    // write 0x18 to SROM_enable to start SROM download
    writeLoc(REG_SROM_Enable, 0x18); 
  
    // write the SROM file (=firmware data) 
    WRITE(FILSENSNCS, LOW);
    dDPrintSpi.transfer(REG_SROM_Load_Burst | 0x80); // write burst destination adress
    delayMicroseconds(15);

    // send all bytes of the firmware
    unsigned char c;
    for(uint16_t i = 0; i < sizeof(sromData); i++) { 
        c = (unsigned char)pgm_read_byte(sromData + i);
        dDPrintSpi.transfer(c);
        delayMicroseconds(15);
    }
    WRITE(FILSENSNCS, HIGH);

    delay(1);
    
    uint8_t srom_id = readLoc(REG_SROM_ID);
    // SERIAL_ECHOPGM("SROM ID: ");
    // MSerial.println(srom_id, HEX );
    
    if (srom_id != SROMVER) {
        LCDMSGKILL(RespKilled, "srom_id != SROMVER", "");
        txBuffer.sendSimpleResponse(RespKilled, RespFilsensorInit);
        kill();
    }

    // end upload

    // fixed frame rate
    // uint8_t conf = readLoc(REG_Configuration_II);
    // writeLoc(REG_Configuration_II, conf & 0x08 );

    // writeLoc(REG_Frame_Period_Max_Bound_Lower, 0xa0 );
    // writeLoc(REG_Frame_Period_Max_Bound_Upper, 0x0f );
    // delay(100);

    //enable laser(bit 0 = 0b), in normal mode (bits 3,2,1 = 000b)
    // reading the actual value of the register is important because the real
    // default value is different from what is said in the datasheet, and if you
    // change the reserved bytes (like by writing 0x00...) it would not work.
    uint8_t laser_ctrl0 = readLoc(REG_LASER_CTRL0);
    // MarlinSerial.print("laser vorher : 0x");
    // MarlinSerial.println(laser_ctrl0, HEX );
    // writeLoc(REG_LASER_CTRL0, laser_ctrl0 & 0xf0 );
    writeLoc(REG_LASER_CTRL0, laser_ctrl0 & ~0x1 );
  
    // laser_ctrl0 = readLoc(REG_LASER_CTRL0);
    // MarlinSerial.print("laser nachher : 0x");
    // MarlinSerial.println(laser_ctrl0, HEX );

    // uint8_t b = readLoc(REG_Motion);
    // if ((b & 0x60) != 0x20) {
        // MarlinSerial.print("Motion error !: 0x");
        // MarlinSerial.println(b, HEX );
    // kill();
    // }

    uint8_t configReg1 = readLoc(REG_Configuration_I);
    // writeLoc(REG_Configuration_I, (configReg1 & 0xC0) | 18); // resolution: 3600
    // writeLoc(REG_Configuration_I, (configReg1 & 0xC0) | 22); // resolution: 4400
    writeLoc(REG_Configuration_I, (configReg1 & 0xC0) | 41); // resolution: 8200

#if 0
    configReg1 = readLoc(REG_Configuration_I);
    SERIAL_ECHOPGM("Filament sensor config1: 0x");
    MSerial.println(configReg1, HEX);

    uint8_t resbits = configReg1 & 0x3f;
    SERIAL_ECHOPGM("Filament sensor resolution: ");
    MSerial.println((uint16_t)resbits * 200);

    uint8_t configReg2 = readLoc(REG_Configuration_II);
    SERIAL_ECHOPGM("Filament sensor config2: 0x");
    MSerial.println(configReg2, HEX);
#endif

    uint8_t snap = readLoc(REG_Snap_Angle);
    writeLoc(REG_Snap_Angle, snap | 0x80);

    // SERIAL_ECHOPGM("Snap angle register: 0x");
    // MSerial.println(readLoc(REG_Snap_Angle), HEX);

    // fixed frame rate
    // writeLoc(REG_Configuration_II, configReg2 & 0x08 );
    // writeLoc(REG_Frame_Period_Max_Bound_Lower, 0xa0 );
    // writeLoc(REG_Frame_Period_Max_Bound_Upper, 0x0f );
    // delay(10);

    uint8_t productId = readLoc(REG_Product_ID); // Product
    // SERIAL_ECHOPGM("Filament sensor Prod: 0x");
    // MSerial.println(productId, HEX);

    // Check inverse product id:
    uint8_t invProductId = readLoc(REG_Inverse_Product_ID);
    // SERIAL_ECHOPGM("REG_Inverse_Product_ID: 0x");
    // MSerial.println(invProductId, HEX);
    massert((uint8_t)(~productId) == invProductId);

    // SERIAL_ECHOLNPGM("Optical Chip Initialized");
}

#endif // #if defined(ADNSFS)

#if defined(BournsEMS22AFS)

FilamentSensor filamentSensor;

FilamentSensor::FilamentSensor() {

    // feedrateLimiterEnabled = false;
    feedrateLimiterEnabled = true;

    // Pull high chip select of filament sensor to free the
    // SPI bus (for sdcard).
    WRITE(FILSENSNCS, HIGH);
    SET_OUTPUT(FILSENSNCS);

    init();
}

void FilamentSensor::init() {

    yPos = 0;
    lastASteps = current_pos_steps[E_AXIS];
    lastTS = millis();
    lastEncoderPos = readEncoderPos();
}

void FilamentSensor::spiInit(uint8_t spiRate) {
  // See avr processor documentation
  SPCR = (1 << SPE) | (1 << MSTR) | (spiRate >> 1) | (1<<CPHA); // Mode 1
  SPSR = spiRate & 1 || spiRate == 6 ? 0 : 1 << SPI2X;
}

uint16_t FilamentSensor::readEncoderPos() {

    //
    // Read rotary encoder pos (0...1023)
    //
    spiInit(3);

    digitalWrite(FILSENSNCS, LOW);
    delayMicroseconds(1); // Tclkfe

    uint8_t byte1 = spiRec();
    uint8_t byte2 = spiRec();

    digitalWrite(FILSENSNCS, HIGH);
  
    // uint16_t pos = (((uint16_t)byte1) << 2) | (byte2 & 0x3);
    uint16_t pos = (((uint16_t)byte1) << 2) | ((byte2 & 0xC0) >> 6);

    /* 
    MSerial.print("Pos: ");
    MSerial.print(pos, HEX);
    MSerial.print(" compens: ");  // should be set
    MSerial.print(byte2 & 0x20);
    MSerial.print(" overr: ");    // should be cleared
    MSerial.print(byte2 & 0x10);
    MSerial.print(" linalarm: "); // should be cleared
    MSerial.print(byte2 & 0x8);
    MSerial.print(" increase: "); // not used
    MSerial.print(byte2 & 0x4);
    MSerial.print(" decrease: "); // not used
    MSerial.print(byte2 & 0x2);
    MSerial.print(" parity: ");
    MSerial.println(byte2 & 0x1);
    MSerial.println("");
    */

    // MSerial.print("Status: ");
    // MSerial.println(byte2 & 0x3E, HEX);
    // massert((byte2 & 0x3E) == 0x20);
    if ((byte2 & 0x3E) != 0x20) {
        MSerial.print("Error Status: ");
        MSerial.println(byte2 & 0x3E, HEX);
    }
    
    // XXX use bitpattern to test all relevant bits at once here..

    uint16_t dataWord = (((uint16_t)byte1) << 8) | byte2;
    uint8_t p = __builtin_parity(dataWord);
    massert(p == 0);

    return pos;
}

int16_t FilamentSensor::getDY() {

    uint16_t pos = readEncoderPos();

    int16_t dy = pos - lastEncoderPos; 

    if (dy < -512) {
        // Überlauf in positiver richtung
        dy = (1024 - lastEncoderPos) + pos;
    }
    else if (dy > 512) {
        // Überlauf in negativer richtung
        dy = (pos - 1024) - lastEncoderPos;
    }

    yPos += dy;

#if 0
    if (dy) {
        SERIAL_ECHO(", dy: ");
        SERIAL_ECHO(dy);
        SERIAL_ECHO(", yPos: ");
        SERIAL_ECHO(yPos);
        SERIAL_ECHO(", estep: ");
        SERIAL_ECHOLN(current_pos_steps[E_AXIS]);
    }
#endif

    lastEncoderPos = pos;
    return dy;
}

void FilamentSensor::run() {

    // Berechne soll flowrate, filamentsensor ist sehr ungenau bei kleiner geschwindigkeit.
CRITICAL_SECTION_START
    uint32_t ts = millis();
    int16_t ds = current_pos_steps[E_AXIS] - lastASteps; // Requested extruded length
    int16_t dy = getDY(); // Real extruded length 
CRITICAL_SECTION_END

    if (ds < 0) {

        // Retraction, reset/sync values
        // yPos = 0;
        // lastEncoderPos = readEncoderPos();
        // lastASteps = current_pos_steps[E_AXIS];
        // lastTS = millis();

        init();
    }
    else {

      // if (ds > 72) {

        // int16_t dy = getDY(); // Real extruded length 

// #if 0
        SERIAL_ECHO("DS, DY: ");
        SERIAL_ECHO(ts);
        SERIAL_ECHO(" ");
        SERIAL_ECHO(ds);
        SERIAL_ECHO(" ");
        SERIAL_ECHOLN(dy);
// #endif

#if 0
        SERIAL_ECHO("DS, DY: ");
        SERIAL_ECHO(ts);
        SERIAL_ECHO(" ");
        SERIAL_ECHO(current_pos_steps[E_AXIS]);
        SERIAL_ECHO(" ");
        SERIAL_ECHOLN(yPos);
#endif

#if 0
        uint16_t dt = ts - lastTS;

        float speed = (ds * 1000.0) / (AXIS_STEPS_PER_MM_E * dt);

        // if (speed > 2) { // ca. 5mm³/s
            // Berechne ist-flowrate, anhand filamentsensor

            float actualSpeed = (dy * 1000.0) / (FS_STEPS_PER_MM * dt);

            SERIAL_ECHO("Flowrate_mm/s: ");
            SERIAL_ECHO(ts);
            SERIAL_ECHO(" ");
            SERIAL_ECHO(speed);
            SERIAL_ECHO(" ");
            SERIAL_ECHOLN(actualSpeed);
        // }
#endif
        lastTS = ts;
        lastASteps = current_pos_steps[E_AXIS];
      // }
    }
}

#endif // #if defined(BournsEMS22AFS)

