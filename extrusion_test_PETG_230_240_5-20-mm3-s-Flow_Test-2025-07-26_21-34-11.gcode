; *** FlowTestGenerator.js (v0.4.6) by iFallUpHill
; *** https://github.com/iFallUpHill/flow-calculator
; *** Based on CNCKitchen's ExtrusionSystemBenchmark by Stefan Hermann
; *** https://github.com/CNCKitchen/ExtrusionSystemBenchmark

;####### Settings
; bedWidth = 140
; bedLength = 140
; bedMargin = 0
; safeZPark = 50
; filamentDiameter = 1.75
; travelSpeed = 50
; dwellTime = 20
; bedTemp = 70
; fanSpeed = 0
; primeLength = 25
; primeAmount = 20
; primeSpeed = 5
; wipeLength = 15
; retractionDistance = 2.5
; retractionSpeed = 60
; blobHeight = 20
; extrusionAmount = 500
; direction = 1
; flowSpacing = 28
; tempSpacing = 56
; flowStart = 5
; flowOffset = 3
; flowSteps = 6
; flowEnd = 20
; tempStart = 230
; tempOffset = 10
; tempSteps = 2
; tempEnd = 240

;####### Start Gcode
M104 S230 ; Set Nozzle Temperature
M140 S70 ; Set Bed Temperature
G90 ; Absolute positioning
G28 ; Move to home position

G0 X0 Y0 Z50 F600 ; Move to origin - do not adjust this
G92 X70 Y70 ; Apply gcode offset - ADJUST THIS NUMBER TO MATCH YOUR PRINTER

G0 Z50 ; Lift nozzle
G21 ; unit in mm
G92 E0 ; reset extruder
M83 ; set extruder to relative mode
M190 S70 ; Wait for Bed Temperature
M106 S0 ; Set Fan Speed
; M203 I0.1 ; Uncomment for Duet/RRF (slow z-moves)
; PRINT_START
; PRINT_START EXTRUDER=230 BED=70

; [SAFETY] Force Relative Extrusion
M83 ; set extruder to relative mode

;####### 230°C
G4 S0; Dwell
M109 S230

;####### 230°C // 5mm3/s
M117 230C // 5mm3/s
G0 X0 Y0 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F4.99 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y0 F3000
G92 E0 ; Reset Extruder

;####### 230°C // 8mm3/s
M117 230C // 8mm3/s
G0 X0 Y28 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F7.98 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y28 F3000
G92 E0 ; Reset Extruder

;####### 230°C // 11mm3/s
M117 230C // 11mm3/s
G0 X0 Y56 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F10.98 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y56 F3000
G92 E0 ; Reset Extruder

;####### 230°C // 14mm3/s
M117 230C // 14mm3/s
G0 X0 Y84 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F13.97 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y84 F3000
G92 E0 ; Reset Extruder

;####### 230°C // 17mm3/s
M117 230C // 17mm3/s
G0 X0 Y112 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F16.96 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y112 F3000
G92 E0 ; Reset Extruder

;####### 230°C // 20mm3/s
M117 230C // 20mm3/s
G0 X0 Y140 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X25 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X40 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F19.96 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X0 Y140 F3000
G92 E0 ; Reset Extruder

;####### 240°C
G4 S0; Dwell
M109 S240

;####### 240°C // 5mm3/s
M117 240C // 5mm3/s
G0 X96 Y0 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F4.99 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y0 F3000
G92 E0 ; Reset Extruder

;####### 240°C // 8mm3/s
M117 240C // 8mm3/s
G0 X96 Y28 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F7.98 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y28 F3000
G92 E0 ; Reset Extruder

;####### 240°C // 11mm3/s
M117 240C // 11mm3/s
G0 X96 Y56 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F10.98 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y56 F3000
G92 E0 ; Reset Extruder

;####### 240°C // 14mm3/s
M117 240C // 14mm3/s
G0 X96 Y84 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F13.97 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y84 F3000
G92 E0 ; Reset Extruder

;####### 240°C // 17mm3/s
M117 240C // 17mm3/s
G0 X96 Y112 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F16.96 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y112 F3000
G92 E0 ; Reset Extruder

;####### 240°C // 20mm3/s
M117 240C // 20mm3/s
G0 X96 Y140 Z25.5 F3000
G4 S20 ; Dwell
G0 Z0.3 ; Drop down
G1 X121 E20 F300 ; Prime
G1 E-2.5 F3600 ; Retract
G0 X136 F3000 ; Wipe
G0 Z0.5 ; Lift
G1 E2.5 F3600 ; Undo Retract
G1 Z20.5 E500 F19.96 ; Extrude
G1 E-2.5 F3600 ; Retract
G0 Z25.5; Lift
G0 X96 Y140 F3000
G92 E0 ; Reset Extruder

;####### End Gcode
G4 ; Wait for buffer to clear
G28 ; Move to home position
M104 S0 T0 ; Turn Off Hotend
M140 S0 ; Turn Off Bed
M84 ; Disable Steppers
; PRINT_END