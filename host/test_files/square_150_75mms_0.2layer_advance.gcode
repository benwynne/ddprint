; G-Code generated by Simplify3D(R) Version 3.0.2
; Aug. 18, 2016 at 1:13:50 NACHM.
; Settings Summary
;   processName,Process1
;   applyToModels,square_150
;   profileName,PLA-1.75mm-N80-advance
;   profileVersion,2016-05-01 10:03:38
;   baseProfile,PLA-1.75mm-N80
;   printMaterial,
;   printQuality,
;   printExtruders,
;   extruderName,Primary Extruder
;   extruderToolheadNumber,0
;   extruderDiameter,0.8
;   extruderAutoWidth,0
;   extruderWidth,0.8
;   extrusionMultiplier,1
;   extruderUseRetract,0
;   extruderRetractionDistance,4.5
;   extruderExtraRestartDistance,0
;   extruderRetractionZLift,0
;   extruderRetractionSpeed,2400
;   extruderUseCoasting,0
;   extruderCoastingDistance,1
;   extruderUseWipe,0
;   extruderWipeDistance,2
;   primaryExtruder,0
;   layerHeight,0.3
;   topSolidLayers,4
;   bottomSolidLayers,2
;   perimeterOutlines,2
;   printPerimetersInsideOut,1
;   startPointOption,3
;   startPointOriginX,0
;   startPointOriginY,0
;   startPointOriginZ,300
;   sequentialIslands,0
;   spiralVaseMode,0
;   firstLayerHeightPercentage,75
;   firstLayerWidthPercentage,100
;   firstLayerUnderspeed,0.3
;   useRaft,0
;   raftExtruder,0
;   raftLayers,1
;   raftOffset,3
;   raftSeparationDistance,0.14
;   raftInfill,50
;   disableRaftBaseLayers,1
;   useSkirt,1
;   skirtExtruder,0
;   skirtLayers,1
;   skirtOutlines,2
;   skirtOffset,3
;   usePrimePillar,0
;   primePillarExtruder,999
;   primePillarWidth,12
;   primePillarLocation,7
;   primePillarSpeedMultiplier,1
;   useOozeShield,0
;   oozeShieldExtruder,999
;   oozeShieldOffset,2
;   oozeShieldOutlines,1
;   oozeShieldSidewallShape,1
;   oozeShieldSidewallAngle,30
;   oozeShieldSpeedMultiplier,1
;   infillExtruder,0
;   internalInfillPattern,Rectilinear
;   externalInfillPattern,Rectilinear
;   infillPercentage,25
;   outlineOverlapPercentage,35
;   infillExtrusionWidthPercentage,100
;   minInfillLength,3
;   infillLayerInterval,1
;   infillAngles,45,-45
;   overlapInfillAngles,0
;   generateSupport,0
;   supportExtruder,0
;   supportInfillPercentage,30
;   supportExtraInflation,0
;   denseSupportLayers,0
;   denseSupportInfillPercentage,80
;   supportLayerInterval,1
;   supportHorizontalPartOffset,0.4
;   supportUpperSeparationLayers,1
;   supportLowerSeparationLayers,1
;   supportType,0
;   supportGridSpacing,2.5
;   maxOverhangAngle,45
;   supportAngles,45
;   temperatureName,Primary Extruder,Heated Build Platform
;   temperatureNumber,0,1
;   temperatureSetpointCount,1,1
;   temperatureSetpointLayers,1,1
;   temperatureSetpointTemperatures,205,60
;   temperatureStabilizeAtStartup,1,1
;   temperatureHeatedBed,0,1
;   temperatureRelayBetweenLayers,0,0
;   temperatureRelayBetweenLoops,0,0
;   fanLayers,1,2,3,4,5
;   fanSpeeds,0,25,50,75,100
;   blipFanToFullPower,1
;   adjustSpeedForCooling,1
;   minSpeedLayerTime,5
;   minCoolingSpeedSlowdown,10
;   increaseFanForCooling,0
;   minFanLayerTime,10
;   maxCoolingFanSpeed,30
;   increaseFanForBridging,0
;   bridgingFanSpeed,45
;   use5D,1
;   relativeEdistances,0
;   allowEaxisZeroing,1
;   independentExtruderAxes,0
;   includeM10123,0
;   stickySupport,1
;   applyToolheadOffsets,0
;   gcodeXoffset,0
;   gcodeYoffset,0
;   gcodeZoffset,0
;   overrideMachineDefinition,1
;   machineTypeOverride,0
;   strokeXoverride,225
;   strokeYoverride,225
;   strokeZoverride,212
;   originOffsetXoverride,0
;   originOffsetYoverride,0
;   originOffsetZoverride,0
;   homeXdirOverride,-1
;   homeYdirOverride,-1
;   homeZdirOverride,-1
;   flipXoverride,1
;   flipYoverride,-1
;   flipZoverride,1
;   toolheadOffsets,0,0|0,0|0,0|0,0|0,0|0,0
;   overrideFirmwareConfiguration,1
;   firmwareTypeOverride,RepRap (Marlin/Repetier/Sprinter)
;   GPXconfigOverride,r2
;   baudRateOverride,250000
;   overridePrinterModels,0
;   printerModelsOverride
;   startingGcode,M907 E1400 ; increase extruder current,G28 ; home all axes,;G1 X20 Y10 F3000 ; bring extruder to front,;G92 E0 ; zero the extruded length,;G1 Z10 ; lower,;G1 E19 F200 ; purge nozzle quickly,;G1 E26 F60 ; purge nozzle slowly,;G92 E0 ; zero the extruded length again,;G1 E-5.5 F400 ; retract,;G1 X190 Z0 F9000 ; pull away filament,;G1 X210 F9000 ; wipe,;G1 Y20 F9000 ; wipe,;G1 E0 ; feed filament back
;   layerChangeGcode,
;   retractionGcode,
;   toolChangeGcode,
;   endingGcode,G28 X0 ; home the X-axis,M104 S0 ; turn off heaters,M140 S0 ; turn off bed,M84 ; disable motors,M107 ; fan off
;   createX3G,0
;   celebration,0
;   celebrationSong,Random Song
;   createMB5G,0
;   postProcessing,
;   defaultSpeed,4500
;   outlineUnderspeed,1
;   solidInfillUnderspeed,0.5
;   supportUnderspeed,1
;   rapidXYspeed,15000
;   rapidZspeed,1998
;   minBridgingArea,5
;   bridgingExtraInflation,0
;   bridgingExtrusionMultiplier,1
;   bridgingSpeedMultiplier,0.5
;   filamentDiameter,1.75
;   filamentPricePerKg,25
;   filamentDensity,1.25
;   useMinPrintHeight,0
;   minPrintHeight,0
;   useMaxPrintHeight,0
;   maxPrintHeight,0
;   useDiaphragm,0
;   diaphragmLayerInterval,20
;   robustSlicing,1
;   mergeAllIntoSolid,0
;   onlyRetractWhenCrossingOutline,1
;   retractBetweenLayers,0
;   useRetractionMinTravel,1
;   retractionMinTravel,0.02
;   retractWhileWiping,0
;   onlyWipeOutlines,1
;   avoidCrossingOutline,0
;   maxMovementDetourFactor,3
;   toolChangeRetractionDistance,12
;   toolChangeExtraRestartDistance,-0.5
;   toolChangeRetractionSpeed,600
;   allowThinWallGapFill,1
;   thinWallAllowedOverlapPercentage,10
;   horizontalSizeCompensation,0
G90
M82
M106 S0
M140 S60
M190 S60
M104 S205 T0
M109 S205 T0
M907 E1400 ; increase extruder current
G28 ; home all axes
;G1 X20 Y10 F3000 ; bring extruder to front
;G92 E0 ; zero the extruded length
;G1 Z10 ; lower
;G1 E19 F200 ; purge nozzle quickly
;G1 E26 F60 ; purge nozzle slowly
;G92 E0 ; zero the extruded length again
;G1 E-5.5 F400 ; retract
;G1 X190 Z0 F9000 ; pull away filament
;G1 X210 F9000 ; wipe
;G1 Y20 F9000 ; wipe
;G1 E0 ; feed filament back
G92 E0
G1 E-4.5000 F2400
G1 Z0.225 F1998
; layer 1, Z = 0.225
T0
; tool H0.300 W0.800
; skirt
G1 X33.483 Y35.578 F15000
G1 E0.0000 F720
G92 E0
G1 X35.578 Y33.483 E0.2956 F1350
G1 X36.019 Y33.300 E0.3433
G1 X188.981 Y33.300 E15.6059
G1 X189.422 Y33.483 E15.6536
G1 X191.517 Y35.578 E15.9492
G1 X191.700 Y36.019 E15.9968
G1 X191.700 Y188.981 E31.2595
G1 X191.517 Y189.422 E31.3071
G1 X189.422 Y191.517 E31.6027
G1 X188.981 Y191.700 E31.6504
G1 X36.019 Y191.700 E46.9131
G1 X35.578 Y191.517 E46.9607
G1 X33.483 Y189.422 E47.2563
G1 X33.300 Y188.981 E47.3039
G1 X33.300 Y36.019 E62.5666
G1 X33.483 Y35.578 E62.6142
G1 X34.161 Y36.031 F15000
G92 E0
G1 X36.031 Y34.161 E0.2639 F1350
G1 X36.178 Y34.100 E0.2797
G1 X188.822 Y34.100 E15.5107
G1 X188.969 Y34.161 E15.5265
G1 X190.839 Y36.031 E15.7904
G1 X190.900 Y36.178 E15.8063
G1 X190.900 Y188.822 E31.0372
G1 X190.839 Y188.969 E31.0531
G1 X188.969 Y190.839 E31.3169
G1 X188.822 Y190.900 E31.3328
G1 X36.178 Y190.900 E46.5637
G1 X36.031 Y190.839 E46.5796
G1 X34.161 Y188.969 E46.8435
G1 X34.100 Y188.822 E46.8593
G1 X34.100 Y36.178 E62.0903
G1 X34.161 Y36.031 E62.1061
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G92 E0
G1 X37.900 Y37.900 E14.8872 F1350
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F1350
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 2, Z = 0.525
M106 S255
G4 P500
M106 S63
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z0.525 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 3, Z = 0.825
M106 S127
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z0.825 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 4, Z = 1.125
M106 S191
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z1.125 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 5, Z = 1.425
M106 S255
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z1.425 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 6, Z = 1.725
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z1.725 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 7, Z = 2.025
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z2.025 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 8, Z = 2.325
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z2.325 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 9, Z = 2.625
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z2.625 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 10, Z = 2.925
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z2.925 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 11, Z = 3.225
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z3.225 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 12, Z = 3.525
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z3.525 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 13, Z = 3.825
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z3.825 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer 14, Z = 4.125
; inner perimeter
; outer perimeter
G1 X37.900 Y187.100 F15000
G1 Z4.125 F1998
G92 E0
G1 X37.900 Y37.900 E14.8872 F4500
G1 X187.100 Y37.900 E29.7745
G1 X187.100 Y187.100 E44.6617
G1 X37.900 Y187.100 E59.5489
; inner perimeter
; outer perimeter
G1 X38.700 Y186.300 F15000
G92 E0
G1 X186.300 Y186.300 E14.7276 F4500
G1 X186.300 Y38.700 E29.4552
G1 X38.700 Y38.700 E44.1828
G1 X38.700 Y186.300 E58.9104
; layer end
G28 X0 ; home the X-axis
M104 S0 ; turn off heaters
M140 S0 ; turn off bed
M84 ; disable motors
M107 ; fan off
; Build Summary
;   Build time: 0 hours 5 minutes
;   Filament length: 1783.2 mm (1.78 m)
;   Plastic volume: 4288.98 mm^3 (4.29 cc)
;   Plastic weight: 5.36 g (0.01 lb)
;   Material cost: 0.13
