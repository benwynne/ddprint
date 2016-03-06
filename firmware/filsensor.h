
/*
 * Parts of this code come from https://github.com/mrjohnk/ADNS-9800
 */

#pragma once

#define ADNSFS 1

#if defined(ADNSFS)
//
// ADNS9800 stuff
//
// ADNS9800 Registers
#define REG_Product_ID                           0x00
#define REG_Revision_ID                          0x01
#define REG_Motion                               0x02
#define REG_Delta_X_L                            0x03
#define REG_Delta_X_H                            0x04
#define REG_Delta_Y_L                            0x05
#define REG_Delta_Y_H                            0x06
#define REG_SQUAL                                0x07
#define REG_Pixel_Sum                            0x08
#define REG_Maximum_Pixel                        0x09
#define REG_Minimum_Pixel                        0x0a
#define REG_Shutter_Lower                        0x0b
#define REG_Shutter_Upper                        0x0c
#define REG_Frame_Period_Lower                   0x0d
#define REG_Frame_Period_Upper                   0x0e
#define REG_Configuration_I                      0x0f
#define REG_Configuration_II                     0x10
#define REG_Frame_Capture                        0x12
#define REG_SROM_Enable                          0x13
#define REG_Run_Downshift                        0x14
#define REG_Rest1_Rate                           0x15
#define REG_Rest1_Downshift                      0x16
#define REG_Rest2_Rate                           0x17
#define REG_Rest2_Downshift                      0x18
#define REG_Rest3_Rate                           0x19
#define REG_Frame_Period_Max_Bound_Lower         0x1a
#define REG_Frame_Period_Max_Bound_Upper         0x1b
#define REG_Frame_Period_Min_Bound_Lower         0x1c
#define REG_Frame_Period_Min_Bound_Upper         0x1d
#define REG_Shutter_Max_Bound_Lower              0x1e
#define REG_Shutter_Max_Bound_Upper              0x1f
#define REG_LASER_CTRL0                          0x20
#define REG_Observation                          0x24
#define REG_Data_Out_Lower                       0x25
#define REG_Data_Out_Upper                       0x26
#define REG_SROM_ID                              0x2a
#define REG_Lift_Detection_Thr                   0x2e
#define REG_Configuration_V                      0x2f
#define REG_Configuration_IV                     0x39
#define REG_Power_Up_Reset                       0x3a
#define REG_Shutdown                             0x3b
#define REG_Inverse_Product_ID                   0x3f
#define REG_Snap_Angle                           0x42
#define REG_Motion_Burst                         0x50
#define REG_SROM_Load_Burst                      0x62
#define REG_Pixel_Burst                          0x64


// Window size running average filament speed
// #define RAVGWINDOW 3
#define RAVGWINDOW 5


/*
 * Inteface to a ADNS9800 'Mousesensor'
 */
class FilamentSensorADNS9800 {

        uint8_t readLoc(uint8_t addr);
        void writeLoc(uint8_t addr, uint8_t value);
        uint8_t pullbyte();
        int16_t getDY();

        int32_t lastASteps;
        // int32_t lastYPos;
        uint32_t lastTS;

        void spiInit(uint8_t spiRate);

#if 0
        // Running average of stepper
        float rAvgS[RAVGWINDOW];
        uint8_t iRAvgS; // index
        uint8_t nRAvgS; // # of values

        // Running average of filament sensor 
        float rAvg[RAVGWINDOW];
        uint8_t iRAvg; // index
        uint8_t nRAvg; // # of values
#endif

        // Running average of speed difference
        float rAvg[RAVGWINDOW];
        uint8_t iRAvg; // index
        uint8_t nRAvg; // # of values

    public:

        int32_t yPos;
        bool enabled;

        float slip;
        // xxx use a better name
        // uint16_t maxTempSpeed;

        FilamentSensorADNS9800();
        void init();
        void reset();
        // The polling method
        void run();
        void selfTest();
};

extern FilamentSensorADNS9800 filamentSensor;

#else

/*
 * Inteface to a ADNS9800 'Mousesensor'
 */
class FilamentSensor {

        int16_t getDY();

        int16_t lastEncoderPos;

        int32_t lastASteps;
        // int32_t lastYPos;
        uint32_t lastTS;

        void spiInit(uint8_t spiRate);
        uint16_t readEncoderPos();

    public:

        int32_t yPos;
        bool enabled;

        float slip;
        // xxx use a better name
        // uint16_t maxTempSpeed;

        FilamentSensor();
        void init();
        // The polling method
        void run();
        // void selfTest();
};

extern FilamentSensor filamentSensor;

#endif // #if defined(ADNSFS)

