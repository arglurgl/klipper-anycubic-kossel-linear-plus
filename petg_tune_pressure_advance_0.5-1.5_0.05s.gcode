
; ### Ellis' Pressure Advance / Linear Advance Calibration Tool ###
;
; Original Marlin linear advance calibration tool by Sineos [https://github.com/Sineos]
; Heavily modified/rewritten by Andrew Ellis [https://github.com/AndrewEllis93]
;
; -------------------------------------------
; Generated: Thu Jul 24 2025 00:15:44 GMT+0200 (Central European Summer Time)
; -------------------------------------------
;
; Advanced Mode: false
;
; Printer:
;  - Firmware: klipper
;  - Bed Shape: Round
;  - Bed Diameter: 200 mm
;  - Origin Bed Center: true
;  - Travel Speed: 120 mm/s
;  - Nozzle Diameter: 0.4 mm
;  - Filament Diameter: 1.75 mm
;  - Extrusion Multiplier: 1
;
; Retraction / Z Hop:
;  - Retraction Distance: 2 mm
;  - Retract Speed: 60 mm/s
;  - Unretract Speed: 40 mm/s
;  - Z Hop Enable: true
;  - Z Hop Height: 0.1mm
;
; First Layer Settings:
;  - First Layer Height: 0.25 mm
;  - First Layer Printing Speed: 30 mm/s
;  - First Layer Fan Speed: 0%
;  - Anchor Option: anchor_frame
;
; Print Settings:
;  - Layer Height: 0.2 mm
;  - Print Speed: 100 mm/s
;  - Acceleration: 800 mm/s^2
;  - Fan Speed: 100%
;
; Pressure Advance Stepping:
;  - PA Start Value: 0.5
;  - PA End Value: 1.5
;  - PA Increment: 0.05
;
; Start / End G-code:
;  - Hotend Temp: 240C
;  - Bed Temp: 70C
;  - Don't Add G28: true
;  - Don't Add Heating G-Codes: true
;  - Entered Start G-code: 
;       G28 ; home
;       G1 X0.0 Y-100.0 Z100.0 ; make oozing happen at bed edge
;       M104 S240 ; set extruder temp
;       M140 S70 ; set bed temp
;       M190 S70 ; wait for bed temp
;       M109 S240 ; wait for extruder temp
;       G28 ; home
;       G1 X0.0 Y-100.0 Z100.0 ; start print from bed edge
;       G1 X0.0 Y-100.0 Z5.0 ; start print from bed edge
;  - Entered End G-code: 
;       M104 S0 ; turn off temperature
;       M140 S0 ; turn off heatbed
;       M107 ; turn off fan
;       G28 ; home
;       M84 ; disable motors
;       ; total layers count = [total_layer_count]
;
; Calculated Values:
;  - Print Size X: 99.12 mm
;  - Print Size Y: 50.99 mm
;  - Number of Patterns to Print: 21
;  - PA Values: 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1, 1.05, 1.1, 1.15, 1.2, 1.25, 1.3, 1.35, 1.4, 1.45, 1.5
;
; Prepare printing
;
G28 ; home
G1 X0.0 Y-100.0 Z100.0 ; make oozing happen at bed edge
M104 S240 ; set extruder temp
M140 S70 ; set bed temp
M190 S70 ; wait for bed temp
M109 S240 ; wait for extruder temp
G28 ; home
G1 X0.0 Y-100.0 Z100.0 ; start print from bed edge
G1 X0.0 Y-100.0 Z5.0 ; start print from bed edge
G21 ; Millimeter units
G90 ; Absolute XYZ
M83 ; Relative E
G92 E0 ; Reset extruder distance
;
;  Begin printing
;
M106 S0 ; Set fan speed
SET_VELOCITY_LIMIT ACCEL=800 ; Set printing acceleration
G1 E-2 F3600 ; Retract
G0 Z5 F7200 ; Z raise
G0 X-49.5611 Y-25.4932 F7200 ; Move to start position
G0 Z0.25 F7200 ; Move to start layer height
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance to start value
M117 PA 0.5
G1 X-49.5611 Y16.9332 E2.23286 F1800 ; Draw perimeter (up)
G1 X49.5611 Y16.9332 E5.21669 F1800 ; Draw perimeter (right)
G1 X49.5611 Y-25.4932 E2.23286 F1800 ; Draw perimeter (down)
G1 X-49.5611 Y-25.4932 E5.21669 F1800 ; Draw perimeter (left)
G0 X-49.0548 Y-24.9869 F7200 ; Step inwards to print next perimeter
G1 X-49.0548 Y16.4269 E2.17956 F1800 ; Draw perimeter (up)
G1 X49.0548 Y16.4269 E5.1634 F1800 ; Draw perimeter (right)
G1 X49.0548 Y-24.9869 E2.17956 F1800 ; Draw perimeter (down)
G1 X-49.0548 Y-24.9869 E5.1634 F1800 ; Draw perimeter (left)
G0 X-48.5484 Y-24.4805 F7200 ; Step inwards to print next perimeter
G1 X-48.5484 Y15.9205 E2.12626 F1800 ; Draw perimeter (up)
G1 X48.5484 Y15.9205 E5.1101 F1800 ; Draw perimeter (right)
G1 X48.5484 Y-24.4805 E2.12626 F1800 ; Draw perimeter (down)
G1 X-48.5484 Y-24.4805 E5.1101 F1800 ; Draw perimeter (left)
G0 X-48.0421 Y-23.9742 F7200 ; Step inwards to print next perimeter
G1 X-48.0421 Y15.4142 E2.07296 F1800 ; Draw perimeter (up)
G1 X48.0421 Y15.4142 E5.0568 F1800 ; Draw perimeter (right)
G1 X48.0421 Y-23.9742 E2.07296 F1800 ; Draw perimeter (down)
G1 X-48.0421 Y-23.9742 E5.0568 F1800 ; Draw perimeter (left)
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-49.5611 Y17.4396 F7200 ; Move to box start
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-49.5611 Y25.9459 E0.44768 F1800 ; Draw perimeter (up)
G1 X29.099 Y25.9459 E4.13979 F1800 ; Draw perimeter (right)
G1 X29.099 Y17.4396 E0.44768 F1800 ; Draw perimeter (down)
G1 X-49.5611 Y17.4396 E4.13979 F1800 ; Draw perimeter (left)
G0 X-49.0548 Y17.9459 F7200 ; Step inwards to print next perimeter
G1 X-49.0548 Y25.4396 E0.39438 F1800 ; Draw perimeter (up)
G1 X28.5926 Y25.4396 E4.0865 F1800 ; Draw perimeter (right)
G1 X28.5926 Y17.9459 E0.39438 F1800 ; Draw perimeter (down)
G1 X-49.0548 Y17.9459 E4.0865 F1800 ; Draw perimeter (left)
G0 X-48.5484 Y18.4523 F7200 ; Step inwards to print next perimeter
G1 X-48.5484 Y24.9332 E0.34109 F1800 ; Draw perimeter (up)
G1 X28.0863 Y24.9332 E4.0332 F1800 ; Draw perimeter (right)
G1 X28.0863 Y18.4523 E0.34109 F1800 ; Draw perimeter (down)
G1 X-48.5484 Y18.4523 E4.0332 F1800 ; Draw perimeter (left)
G0 X-48.0421 Y18.9586 F7200 ; Step inwards to print next perimeter
G1 X-48.0421 Y24.4269 E0.28779 F1800 ; Draw perimeter (up)
G1 X27.5799 Y24.4269 E3.9799 F1800 ; Draw perimeter (right)
G1 X27.5799 Y18.9586 E0.28779 F1800 ; Draw perimeter (down)
G1 X-48.0421 Y18.9586 E3.9799 F1800 ; Draw perimeter (left)
G0 X-47.6687 Y19.3319 F7200 ; Move to fill start
G0 X-46.9526 Y19.3319 F7200 ; Move
G1 X-47.6687 Y20.048 E0.0533 F1800 ; Fill
G0 X-47.6687 Y20.7641 F7200 ; Move
G1 X-46.2365 Y19.3319 E0.10659 F1800 ; Fill
G0 X-45.5205 Y19.3319 F7200 ; Move
G1 X-47.6687 Y21.4802 E0.15989 F1800 ; Fill
G0 X-47.6687 Y22.1963 F7200 ; Move
G1 X-44.8044 Y19.3319 E0.21319 F1800 ; Fill
G0 X-44.0883 Y19.3319 F7200 ; Move
G1 X-47.6687 Y22.9124 E0.26649 F1800 ; Fill
G0 X-47.6687 Y23.6285 F7200 ; Move
G1 X-43.3722 Y19.3319 E0.31978 F1800 ; Fill
G0 X-42.6561 Y19.3319 F7200 ; Move
G1 X-47.3777 Y24.0535 E0.35142 F1800 ; Fill
G0 X-46.6616 Y24.0535 F7200 ; Move
G1 X-41.94 Y19.3319 E0.35142 F1800 ; Fill
G0 X-41.2239 Y19.3319 F7200 ; Move
G1 X-45.9455 Y24.0535 E0.35142 F1800 ; Fill
G0 X-45.2294 Y24.0535 F7200 ; Move
G1 X-40.5079 Y19.3319 E0.35142 F1800 ; Fill
G0 X-39.7918 Y19.3319 F7200 ; Move
G1 X-44.5134 Y24.0535 E0.35142 F1800 ; Fill
G0 X-43.7973 Y24.0535 F7200 ; Move
G1 X-39.0757 Y19.3319 E0.35142 F1800 ; Fill
G0 X-38.3596 Y19.3319 F7200 ; Move
G1 X-43.0812 Y24.0535 E0.35142 F1800 ; Fill
G0 X-42.3651 Y24.0535 F7200 ; Move
G1 X-37.6435 Y19.3319 E0.35142 F1800 ; Fill
G0 X-36.9274 Y19.3319 F7200 ; Move
G1 X-41.649 Y24.0535 E0.35142 F1800 ; Fill
G0 X-40.9329 Y24.0535 F7200 ; Move
G1 X-36.2113 Y19.3319 E0.35142 F1800 ; Fill
G0 X-35.4952 Y19.3319 F7200 ; Move
G1 X-40.2168 Y24.0535 E0.35142 F1800 ; Fill
G0 X-39.5007 Y24.0535 F7200 ; Move
G1 X-34.7792 Y19.3319 E0.35142 F1800 ; Fill
G0 X-34.0631 Y19.3319 F7200 ; Move
G1 X-38.7847 Y24.0535 E0.35142 F1800 ; Fill
G0 X-38.0686 Y24.0535 F7200 ; Move
G1 X-33.347 Y19.3319 E0.35142 F1800 ; Fill
G0 X-32.6309 Y19.3319 F7200 ; Move
G1 X-37.3525 Y24.0535 E0.35142 F1800 ; Fill
G0 X-36.6364 Y24.0535 F7200 ; Move
G1 X-31.9148 Y19.3319 E0.35142 F1800 ; Fill
G0 X-31.1987 Y19.3319 F7200 ; Move
G1 X-35.9203 Y24.0535 E0.35142 F1800 ; Fill
G0 X-35.2042 Y24.0535 F7200 ; Move
G1 X-30.4826 Y19.3319 E0.35142 F1800 ; Fill
G0 X-29.7666 Y19.3319 F7200 ; Move
G1 X-34.4881 Y24.0535 E0.35142 F1800 ; Fill
G0 X-33.7721 Y24.0535 F7200 ; Move
G1 X-29.0505 Y19.3319 E0.35142 F1800 ; Fill
G0 X-28.3344 Y19.3319 F7200 ; Move
G1 X-33.056 Y24.0535 E0.35142 F1800 ; Fill
G0 X-32.3399 Y24.0535 F7200 ; Move
G1 X-27.6183 Y19.3319 E0.35142 F1800 ; Fill
G0 X-26.9022 Y19.3319 F7200 ; Move
G1 X-31.6238 Y24.0535 E0.35142 F1800 ; Fill
G0 X-30.9077 Y24.0535 F7200 ; Move
G1 X-26.1861 Y19.3319 E0.35142 F1800 ; Fill
G0 X-25.47 Y19.3319 F7200 ; Move
G1 X-30.1916 Y24.0535 E0.35142 F1800 ; Fill
G0 X-29.4755 Y24.0535 F7200 ; Move
G1 X-24.754 Y19.3319 E0.35142 F1800 ; Fill
G0 X-24.0379 Y19.3319 F7200 ; Move
G1 X-28.7595 Y24.0535 E0.35142 F1800 ; Fill
G0 X-28.0434 Y24.0535 F7200 ; Move
G1 X-23.3218 Y19.3319 E0.35142 F1800 ; Fill
G0 X-22.6057 Y19.3319 F7200 ; Move
G1 X-27.3273 Y24.0535 E0.35142 F1800 ; Fill
G0 X-26.6112 Y24.0535 F7200 ; Move
G1 X-21.8896 Y19.3319 E0.35142 F1800 ; Fill
G0 X-21.1735 Y19.3319 F7200 ; Move
G1 X-25.8951 Y24.0535 E0.35142 F1800 ; Fill
G0 X-25.179 Y24.0535 F7200 ; Move
G1 X-20.4574 Y19.3319 E0.35142 F1800 ; Fill
G0 X-19.7413 Y19.3319 F7200 ; Move
G1 X-24.4629 Y24.0535 E0.35142 F1800 ; Fill
G0 X-23.7468 Y24.0535 F7200 ; Move
G1 X-19.0253 Y19.3319 E0.35142 F1800 ; Fill
G0 X-18.3092 Y19.3319 F7200 ; Move
G1 X-23.0308 Y24.0535 E0.35142 F1800 ; Fill
G0 X-22.3147 Y24.0535 F7200 ; Move
G1 X-17.5931 Y19.3319 E0.35142 F1800 ; Fill
G0 X-16.877 Y19.3319 F7200 ; Move
G1 X-21.5986 Y24.0535 E0.35142 F1800 ; Fill
G0 X-20.8825 Y24.0535 F7200 ; Move
G1 X-16.1609 Y19.3319 E0.35142 F1800 ; Fill
G0 X-15.4448 Y19.3319 F7200 ; Move
G1 X-20.1664 Y24.0535 E0.35142 F1800 ; Fill
G0 X-19.4503 Y24.0535 F7200 ; Move
G1 X-14.7287 Y19.3319 E0.35142 F1800 ; Fill
G0 X-14.0127 Y19.3319 F7200 ; Move
G1 X-18.7342 Y24.0535 E0.35142 F1800 ; Fill
G0 X-18.0182 Y24.0535 F7200 ; Move
G1 X-13.2966 Y19.3319 E0.35142 F1800 ; Fill
G0 X-12.5805 Y19.3319 F7200 ; Move
G1 X-17.3021 Y24.0535 E0.35142 F1800 ; Fill
G0 X-16.586 Y24.0535 F7200 ; Move
G1 X-11.8644 Y19.3319 E0.35142 F1800 ; Fill
G0 X-11.1483 Y19.3319 F7200 ; Move
G1 X-15.8699 Y24.0535 E0.35142 F1800 ; Fill
G0 X-15.1538 Y24.0535 F7200 ; Move
G1 X-10.4322 Y19.3319 E0.35142 F1800 ; Fill
G0 X-9.7161 Y19.3319 F7200 ; Move
G1 X-14.4377 Y24.0535 E0.35142 F1800 ; Fill
G0 X-13.7216 Y24.0535 F7200 ; Move
G1 X-9.0001 Y19.3319 E0.35142 F1800 ; Fill
G0 X-8.284 Y19.3319 F7200 ; Move
G1 X-13.0056 Y24.0535 E0.35142 F1800 ; Fill
G0 X-12.2895 Y24.0535 F7200 ; Move
G1 X-7.5679 Y19.3319 E0.35142 F1800 ; Fill
G0 X-6.8518 Y19.3319 F7200 ; Move
G1 X-11.5734 Y24.0535 E0.35142 F1800 ; Fill
G0 X-10.8573 Y24.0535 F7200 ; Move
G1 X-6.1357 Y19.3319 E0.35142 F1800 ; Fill
G0 X-5.4196 Y19.3319 F7200 ; Move
G1 X-10.1412 Y24.0535 E0.35142 F1800 ; Fill
G0 X-9.4251 Y24.0535 F7200 ; Move
G1 X-4.7035 Y19.3319 E0.35142 F1800 ; Fill
G0 X-3.9874 Y19.3319 F7200 ; Move
G1 X-8.709 Y24.0535 E0.35142 F1800 ; Fill
G0 X-7.9929 Y24.0535 F7200 ; Move
G1 X-3.2714 Y19.3319 E0.35142 F1800 ; Fill
G0 X-2.5553 Y19.3319 F7200 ; Move
G1 X-7.2769 Y24.0535 E0.35142 F1800 ; Fill
G0 X-6.5608 Y24.0535 F7200 ; Move
G1 X-1.8392 Y19.3319 E0.35142 F1800 ; Fill
G0 X-1.1231 Y19.3319 F7200 ; Move
G1 X-5.8447 Y24.0535 E0.35142 F1800 ; Fill
G0 X-5.1286 Y24.0535 F7200 ; Move
G1 X-0.407 Y19.3319 E0.35142 F1800 ; Fill
G0 X0.3091 Y19.3319 F7200 ; Move
G1 X-4.4125 Y24.0535 E0.35142 F1800 ; Fill
G0 X-3.6964 Y24.0535 F7200 ; Move
G1 X1.0252 Y19.3319 E0.35142 F1800 ; Fill
G0 X1.7412 Y19.3319 F7200 ; Move
G1 X-2.9803 Y24.0535 E0.35142 F1800 ; Fill
G0 X-2.2643 Y24.0535 F7200 ; Move
G1 X2.4573 Y19.3319 E0.35142 F1800 ; Fill
G0 X3.1734 Y19.3319 F7200 ; Move
G1 X-1.5482 Y24.0535 E0.35142 F1800 ; Fill
G0 X-0.8321 Y24.0535 F7200 ; Move
G1 X3.8895 Y19.3319 E0.35142 F1800 ; Fill
G0 X4.6056 Y19.3319 F7200 ; Move
G1 X-0.116 Y24.0535 E0.35142 F1800 ; Fill
G0 X0.6001 Y24.0535 F7200 ; Move
G1 X5.3217 Y19.3319 E0.35142 F1800 ; Fill
G0 X6.0378 Y19.3319 F7200 ; Move
G1 X1.3162 Y24.0535 E0.35142 F1800 ; Fill
G0 X2.0323 Y24.0535 F7200 ; Move
G1 X6.7538 Y19.3319 E0.35142 F1800 ; Fill
G0 X7.4699 Y19.3319 F7200 ; Move
G1 X2.7483 Y24.0535 E0.35142 F1800 ; Fill
G0 X3.4644 Y24.0535 F7200 ; Move
G1 X8.186 Y19.3319 E0.35142 F1800 ; Fill
G0 X8.9021 Y19.3319 F7200 ; Move
G1 X4.1805 Y24.0535 E0.35142 F1800 ; Fill
G0 X4.8966 Y24.0535 F7200 ; Move
G1 X9.6182 Y19.3319 E0.35142 F1800 ; Fill
G0 X10.3343 Y19.3319 F7200 ; Move
G1 X5.6127 Y24.0535 E0.35142 F1800 ; Fill
G0 X6.3288 Y24.0535 F7200 ; Move
G1 X11.0504 Y19.3319 E0.35142 F1800 ; Fill
G0 X11.7665 Y19.3319 F7200 ; Move
G1 X7.0449 Y24.0535 E0.35142 F1800 ; Fill
G0 X7.761 Y24.0535 F7200 ; Move
G1 X12.4825 Y19.3319 E0.35142 F1800 ; Fill
G0 X13.1986 Y19.3319 F7200 ; Move
G1 X8.477 Y24.0535 E0.35142 F1800 ; Fill
G0 X9.1931 Y24.0535 F7200 ; Move
G1 X13.9147 Y19.3319 E0.35142 F1800 ; Fill
G0 X14.6308 Y19.3319 F7200 ; Move
G1 X9.9092 Y24.0535 E0.35142 F1800 ; Fill
G0 X10.6253 Y24.0535 F7200 ; Move
G1 X15.3469 Y19.3319 E0.35142 F1800 ; Fill
G0 X16.063 Y19.3319 F7200 ; Move
G1 X11.3414 Y24.0535 E0.35142 F1800 ; Fill
G0 X12.0575 Y24.0535 F7200 ; Move
G1 X16.7791 Y19.3319 E0.35142 F1800 ; Fill
G0 X17.4951 Y19.3319 F7200 ; Move
G1 X12.7736 Y24.0535 E0.35142 F1800 ; Fill
G0 X13.4896 Y24.0535 F7200 ; Move
G1 X18.2112 Y19.3319 E0.35142 F1800 ; Fill
G0 X18.9273 Y19.3319 F7200 ; Move
G1 X14.2057 Y24.0535 E0.35142 F1800 ; Fill
G0 X14.9218 Y24.0535 F7200 ; Move
G1 X19.6434 Y19.3319 E0.35142 F1800 ; Fill
G0 X20.3595 Y19.3319 F7200 ; Move
G1 X15.6379 Y24.0535 E0.35142 F1800 ; Fill
G0 X16.354 Y24.0535 F7200 ; Move
G1 X21.0756 Y19.3319 E0.35142 F1800 ; Fill
G0 X21.7917 Y19.3319 F7200 ; Move
G1 X17.0701 Y24.0535 E0.35142 F1800 ; Fill
G0 X17.7862 Y24.0535 F7200 ; Move
G1 X22.5077 Y19.3319 E0.35142 F1800 ; Fill
G0 X23.2238 Y19.3319 F7200 ; Move
G1 X18.5022 Y24.0535 E0.35142 F1800 ; Fill
G0 X19.2183 Y24.0535 F7200 ; Move
G1 X23.9399 Y19.3319 E0.35142 F1800 ; Fill
G0 X24.656 Y19.3319 F7200 ; Move
G1 X19.9344 Y24.0535 E0.35142 F1800 ; Fill
G0 X20.6505 Y24.0535 F7200 ; Move
G1 X25.3721 Y19.3319 E0.35142 F1800 ; Fill
G0 X26.0882 Y19.3319 F7200 ; Move
G1 X21.3666 Y24.0535 E0.35142 F1800 ; Fill
G0 X22.0827 Y24.0535 F7200 ; Move
G1 X26.8043 Y19.3319 E0.35142 F1800 ; Fill
G0 X27.2066 Y19.6457 F7200 ; Move
G1 X22.7988 Y24.0535 E0.32807 F1800 ; Fill
G0 X23.5149 Y24.0535 F7200 ; Move
G1 X27.2066 Y20.3618 E0.27477 F1800 ; Fill
G0 X27.2066 Y21.0779 F7200 ; Move
G1 X24.2309 Y24.0535 E0.22147 F1800 ; Fill
G0 X24.947 Y24.0535 F7200 ; Move
G1 X27.2066 Y21.794 E0.16817 F1800 ; Fill
G0 X27.2066 Y22.5101 F7200 ; Move
G1 X25.6631 Y24.0535 E0.11488 F1800 ; Fill
G0 X26.3792 Y24.0535 F7200 ; Move
G1 X27.2066 Y23.2262 E0.06158 F1800 ; Fill
G0 X27.2066 Y23.9422 F7200 ; Move
G1 X27.0953 Y24.0535 E0.00828 F1800 ; Fill
G0 Z0.25 F7200 ; Move to layer height
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-44.9644 Y-23.6008 F7200 ; Move to pattern start

G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance
M117 PA 0.5
G1 X-25.6436 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-44.9644 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-44.3887 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-25.0679 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-44.3887 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-43.813 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.4922 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-43.813 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-41.363 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.55 ; Set pressure advance
M117 PA 0.55
G1 X-22.0422 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-41.363 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-40.7873 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-21.4665 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-40.7873 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-40.2116 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-20.8908 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-40.2116 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-37.7616 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.6 ; Set pressure advance
M117 PA 0.6
G1 X-18.4408 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-37.7616 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-37.1859 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.8651 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-37.1859 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-36.6102 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.2894 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-36.6102 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-34.1602 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.65 ; Set pressure advance
M117 PA 0.65
G1 X-14.8394 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-34.1602 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-33.5845 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-14.2637 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-33.5845 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-33.0088 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-13.688 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-33.0088 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-30.5588 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.7 ; Set pressure advance
M117 PA 0.7
G1 X-11.238 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-30.5588 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-29.9831 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.6623 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-29.9831 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-29.4074 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.0866 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-29.4074 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-26.9574 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.75 ; Set pressure advance
M117 PA 0.75
G1 X-7.6366 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-26.9574 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-26.3817 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-7.0609 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-26.3817 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-25.806 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-6.4852 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-25.806 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-23.356 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.8 ; Set pressure advance
M117 PA 0.8
G1 X-4.0352 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-23.356 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-22.7803 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.4595 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-22.7803 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-22.2047 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-2.8838 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-22.2047 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-19.7547 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.85 ; Set pressure advance
M117 PA 0.85
G1 X-0.4338 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-19.7547 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-19.179 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.1419 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-19.179 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-18.6033 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.7176 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-18.6033 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-16.1533 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.9 ; Set pressure advance
M117 PA 0.9
G1 X3.1676 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-16.1533 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-15.5776 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X3.7433 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-15.5776 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-15.0019 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X4.319 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-15.0019 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-12.5519 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.95 ; Set pressure advance
M117 PA 0.95
G1 X6.769 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-12.5519 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-11.9762 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.3447 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-11.9762 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-11.4005 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.9204 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-11.4005 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-8.9505 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1 ; Set pressure advance
M117 PA 1
G1 X10.3704 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-8.9505 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-8.3748 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X10.9461 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-8.3748 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-7.7991 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X11.5218 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-7.7991 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-5.3491 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.05 ; Set pressure advance
M117 PA 1.05
G1 X13.9718 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-5.3491 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-4.7734 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X14.5474 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-4.7734 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-4.1977 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X15.1231 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-4.1977 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-1.7477 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.1 ; Set pressure advance
M117 PA 1.1
G1 X17.5731 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-1.7477 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-1.172 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.1488 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-1.172 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-0.5963 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.7245 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X-0.5963 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X1.8537 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.15 ; Set pressure advance
M117 PA 1.15
G1 X21.1745 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X1.8537 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X2.4294 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X21.7502 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X2.4294 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X3.0051 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X22.3259 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X3.0051 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X5.4551 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.2 ; Set pressure advance
M117 PA 1.2
G1 X24.7759 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X5.4551 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X6.0308 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.3516 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X6.0308 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X6.6065 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.9273 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X6.6065 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X9.0565 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.25 ; Set pressure advance
M117 PA 1.25
G1 X28.3773 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X9.0565 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X9.6322 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X28.953 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X9.6322 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X10.2079 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X29.5287 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X10.2079 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X12.6579 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.3 ; Set pressure advance
M117 PA 1.3
G1 X31.9787 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X12.6579 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X13.2336 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X32.5544 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X13.2336 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X13.8093 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X33.1301 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X13.8093 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X16.2593 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.35 ; Set pressure advance
M117 PA 1.35
G1 X35.5801 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X16.2593 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X16.835 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.1558 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X16.835 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X17.4107 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.7315 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X17.4107 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X19.8607 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.4 ; Set pressure advance
M117 PA 1.4
G1 X39.1815 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X19.8607 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X20.4364 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X39.7572 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X20.4364 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X21.0121 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X40.3329 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X21.0121 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X23.4621 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.45 ; Set pressure advance
M117 PA 1.45
G1 X42.7829 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X23.4621 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X24.0378 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.3586 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X24.0378 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X24.6135 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.9343 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X24.6135 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X27.0635 Y-23.6008 F7200 ; Move to next pattern
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.5 ; Set pressure advance
M117 PA 1.5
G1 X46.3843 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X27.0635 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X27.6392 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X46.96 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X27.6392 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X28.2149 Y-23.6008 F7200 ; Move to start next pattern wall
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X47.5357 Y-4.28 E1.12562 F1800 ; Print pattern wall
G1 X28.2149 Y15.0408 E1.12562 F1800 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.35 F7200 ; Z hop
G0 X-44.9644 Y-23.6008 F7200 ; Move back to start position
G1 Z0.25 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
M106 S255 ; Set fan speed
G0 Z0.45 F7200 ; Move to layer height
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance to start value for numbering
M117 PA 0.5
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-48.2811 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-46.2811 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-44.2811 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-44.2811 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-46.2811 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-48.2811 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-48.2811 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-44.2811 Y21.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-45.0311 Y21.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-48.2811 Y24.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-48.2811 Y22.3832 E0.0677 F1800 ; Glyph: 5
G1 X-46.2811 Y22.3832 E0.0677 F1800 ; Glyph: 5
G1 X-46.2811 Y24.3832 E0.0677 F1800 ; Glyph: 5
G1 X-44.2811 Y24.3832 E0.0677 F1800 ; Glyph: 5
G1 X-44.2811 Y22.3832 E0.0677 F1800 ; Glyph: 5
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-41.0783 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-39.0783 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-37.0783 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-37.0783 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-39.0783 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-41.0783 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-41.0783 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-37.0783 Y21.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-37.8283 Y21.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-41.0783 Y24.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-41.0783 Y22.3832 E0.0677 F1800 ; Glyph: 6
G1 X-39.0783 Y22.3832 E0.0677 F1800 ; Glyph: 6
G1 X-37.0783 Y22.3832 E0.0677 F1800 ; Glyph: 6
G1 X-37.0783 Y24.3832 E0.0677 F1800 ; Glyph: 6
G1 X-39.0783 Y24.3832 E0.0677 F1800 ; Glyph: 6
G1 X-39.0783 Y22.3832 E0.0677 F1800 ; Glyph: 6
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-33.8755 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-31.8755 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-29.8755 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-29.8755 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-31.8755 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-33.8755 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-33.8755 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-29.8755 Y21.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-30.6255 Y21.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-33.8755 Y22.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-33.8755 Y24.3832 E0.0677 F1800 ; Glyph: 7
G1 X-31.8755 Y24.3832 E0.0677 F1800 ; Glyph: 7
G1 X-29.8755 Y24.3832 E0.0677 F1800 ; Glyph: 7
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-26.6727 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.6727 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-22.6727 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-22.6727 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-24.6727 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-26.6727 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-26.6727 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-22.6727 Y21.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-23.4227 Y21.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-26.6727 Y22.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.6727 Y22.3832 E0.0677 F1800 ; Glyph: 8
G1 X-22.6727 Y22.3832 E0.0677 F1800 ; Glyph: 8
G1 X-22.6727 Y24.3832 E0.0677 F1800 ; Glyph: 8
G1 X-24.6727 Y24.3832 E0.0677 F1800 ; Glyph: 8
G1 X-26.6727 Y24.3832 E0.0677 F1800 ; Glyph: 8
G1 X-26.6727 Y22.3832 E0.0677 F1800 ; Glyph: 8
G0 X-24.6727 Y22.3832 F7200 ; Move
G1 X-24.6727 Y24.3832 E0.0677 F1800 ; Glyph: 8
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-19.4699 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.4699 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-15.4699 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 X-15.4699 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-17.4699 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-19.4699 Y20.3832 E0.0677 F1800 ; Glyph: 0
G1 X-19.4699 Y18.3832 E0.0677 F1800 ; Glyph: 0
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-15.4699 Y21.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-16.2199 Y21.3832 E0.02539 F1800 ; Glyph: .
G0 X-15.4699 Y22.3832 F7200 ; Move
G1 X-15.4699 Y24.3832 E0.0677 F1800 ; Glyph: 9
G1 X-17.4699 Y24.3832 E0.0677 F1800 ; Glyph: 9
G1 X-19.4699 Y24.3832 E0.0677 F1800 ; Glyph: 9
G1 X-19.4699 Y22.3832 E0.0677 F1800 ; Glyph: 9
G1 X-17.4699 Y22.3832 E0.0677 F1800 ; Glyph: 9
G1 X-17.4699 Y24.3832 E0.0677 F1800 ; Glyph: 9
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-12.2671 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.2671 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X-8.2671 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-5.0644 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.0644 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X-1.0644 Y18.3832 E0.0677 F1800 ; Glyph: 1
G0 X-1.0644 Y19.3832 F7200 ; Move
G1 X-1.8144 Y19.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-5.0644 Y20.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.0644 Y20.3832 E0.0677 F1800 ; Glyph: 1
G1 X-1.0644 Y20.3832 E0.0677 F1800 ; Glyph: 1
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X2.1384 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X4.1384 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X6.1384 Y18.3832 E0.0677 F1800 ; Glyph: 1
G0 X6.1384 Y19.3832 F7200 ; Move
G1 X5.3884 Y19.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X2.1384 Y20.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X2.1384 Y22.3832 E0.0677 F1800 ; Glyph: 2
G1 X4.1384 Y22.3832 E0.0677 F1800 ; Glyph: 2
G1 X4.1384 Y20.3832 E0.0677 F1800 ; Glyph: 2
G1 X6.1384 Y20.3832 E0.0677 F1800 ; Glyph: 2
G1 X6.1384 Y22.3832 E0.0677 F1800 ; Glyph: 2
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X9.3412 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X11.3412 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X13.3412 Y18.3832 E0.0677 F1800 ; Glyph: 1
G0 X13.3412 Y19.3832 F7200 ; Move
G1 X12.5912 Y19.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X9.3412 Y20.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X9.3412 Y22.3832 E0.0677 F1800 ; Glyph: 3
G1 X11.3412 Y22.3832 E0.0677 F1800 ; Glyph: 3
G1 X11.3412 Y20.3832 E0.0677 F1800 ; Glyph: 3
G0 X11.3412 Y22.3832 F7200 ; Move
G1 X13.3412 Y22.3832 E0.0677 F1800 ; Glyph: 3
G1 X13.3412 Y20.3832 E0.0677 F1800 ; Glyph: 3
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X16.544 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.544 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X20.544 Y18.3832 E0.0677 F1800 ; Glyph: 1
G0 X20.544 Y19.3832 F7200 ; Move
G1 X19.794 Y19.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X16.544 Y22.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.544 Y22.3832 E0.0677 F1800 ; Glyph: 4
G1 X20.544 Y22.3832 E0.0677 F1800 ; Glyph: 4
G0 X18.544 Y22.3832 F7200 ; Move
G1 X18.544 Y20.3832 E0.0677 F1800 ; Glyph: 4
G1 X16.544 Y20.3832 E0.0677 F1800 ; Glyph: 4
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X23.7468 Y18.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.7468 Y18.3832 E0.0677 F1800 ; Glyph: 1
G1 X27.7468 Y18.3832 E0.0677 F1800 ; Glyph: 1
G0 X27.7468 Y19.3832 F7200 ; Move
G1 X26.9968 Y19.3832 E0.02539 F1800 ; Glyph: .
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X23.7468 Y22.3832 F7200 ; Move
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X23.7468 Y20.3832 E0.0677 F1800 ; Glyph: 5
G1 X25.7468 Y20.3832 E0.0677 F1800 ; Glyph: 5
G1 X25.7468 Y22.3832 E0.0677 F1800 ; Glyph: 5
G1 X27.7468 Y22.3832 E0.0677 F1800 ; Glyph: 5
G1 X27.7468 Y20.3832 E0.0677 F1800 ; Glyph: 5
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-46.8568 Y-25.4932 F7200 ; Move to pattern start

G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance
M117 PA 0.5
G1 X-25.6436 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.8568 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-46.2811 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-25.0679 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.2811 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-45.7054 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.4922 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-45.7054 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-43.2554 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.55 ; Set pressure advance
M117 PA 0.55
G1 X-22.0422 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-43.2554 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-42.6797 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-21.4665 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.6797 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-42.104 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-20.8908 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.104 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-39.654 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.6 ; Set pressure advance
M117 PA 0.6
G1 X-18.4408 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.654 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-39.0783 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.8651 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.0783 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-38.5026 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.2894 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-38.5026 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-36.0526 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.65 ; Set pressure advance
M117 PA 0.65
G1 X-14.8394 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-36.0526 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-35.4769 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-14.2637 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-35.4769 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-34.9012 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-13.688 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-34.9012 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-32.4512 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.7 ; Set pressure advance
M117 PA 0.7
G1 X-11.238 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-32.4512 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-31.8755 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.6623 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.8755 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-31.2998 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.0866 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.2998 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-28.8498 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.75 ; Set pressure advance
M117 PA 0.75
G1 X-7.6366 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.8498 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-28.2741 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-7.0609 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.2741 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-27.6984 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-6.4852 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-27.6984 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-25.2484 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.8 ; Set pressure advance
M117 PA 0.8
G1 X-4.0352 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-25.2484 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-24.6727 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.4595 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.6727 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-24.097 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-2.8838 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.097 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-21.647 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.85 ; Set pressure advance
M117 PA 0.85
G1 X-0.4338 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.647 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-21.0713 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.1419 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.0713 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-20.4956 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.7176 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-20.4956 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-18.0456 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.9 ; Set pressure advance
M117 PA 0.9
G1 X3.1676 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-18.0456 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-17.4699 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X3.7433 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-17.4699 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-16.8942 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X4.319 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-16.8942 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-14.4442 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.95 ; Set pressure advance
M117 PA 0.95
G1 X6.769 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-14.4442 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-13.8685 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.3447 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.8685 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-13.2928 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.9204 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.2928 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-10.8428 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1 ; Set pressure advance
M117 PA 1
G1 X10.3704 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.8428 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-10.2671 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X10.9461 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.2671 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-9.6915 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X11.5218 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-9.6915 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-7.2415 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.05 ; Set pressure advance
M117 PA 1.05
G1 X13.9718 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-7.2415 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-6.6658 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X14.5474 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.6658 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-6.0901 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X15.1231 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.0901 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-3.6401 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.1 ; Set pressure advance
M117 PA 1.1
G1 X17.5731 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.6401 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-3.0644 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.1488 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.0644 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-2.4887 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.7245 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-2.4887 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-0.0387 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.15 ; Set pressure advance
M117 PA 1.15
G1 X21.1745 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-0.0387 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X0.537 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X21.7502 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X0.537 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X1.1127 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X22.3259 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X1.1127 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X3.5627 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.2 ; Set pressure advance
M117 PA 1.2
G1 X24.7759 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X3.5627 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X4.1384 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.3516 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.1384 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X4.7141 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.9273 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.7141 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X7.1641 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.25 ; Set pressure advance
M117 PA 1.25
G1 X28.3773 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.1641 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X7.7398 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X28.953 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.7398 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X8.3155 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X29.5287 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X8.3155 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X10.7655 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.3 ; Set pressure advance
M117 PA 1.3
G1 X31.9787 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X10.7655 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X11.3412 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X32.5544 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.3412 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X11.9169 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X33.1301 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.9169 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X14.3669 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.35 ; Set pressure advance
M117 PA 1.35
G1 X35.5801 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.3669 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X14.9426 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.1558 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.9426 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X15.5183 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.7315 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X15.5183 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X17.9683 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.4 ; Set pressure advance
M117 PA 1.4
G1 X39.1815 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X17.9683 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X18.544 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X39.7572 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X18.544 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X19.1197 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X40.3329 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X19.1197 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X21.5697 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.45 ; Set pressure advance
M117 PA 1.45
G1 X42.7829 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X21.5697 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X22.1454 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.3586 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.1454 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X22.7211 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.9343 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.7211 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X25.1711 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.5 ; Set pressure advance
M117 PA 1.5
G1 X46.3843 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.1711 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X25.7468 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X46.96 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.7468 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X26.3225 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X47.5357 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X26.3225 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.55 F7200 ; Z hop
G0 X-46.8568 Y-25.4932 F7200 ; Move back to start position
G1 Z0.45 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G0 Z0.65 F7200 ; Move to layer height
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance
M117 PA 0.5
G1 X-25.6436 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.8568 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-46.2811 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-25.0679 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.2811 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-45.7054 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.4922 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-45.7054 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-43.2554 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.55 ; Set pressure advance
M117 PA 0.55
G1 X-22.0422 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-43.2554 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-42.6797 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-21.4665 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.6797 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-42.104 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-20.8908 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.104 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-39.654 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.6 ; Set pressure advance
M117 PA 0.6
G1 X-18.4408 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.654 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-39.0783 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.8651 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.0783 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-38.5026 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.2894 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-38.5026 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-36.0526 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.65 ; Set pressure advance
M117 PA 0.65
G1 X-14.8394 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-36.0526 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-35.4769 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-14.2637 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-35.4769 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-34.9012 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-13.688 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-34.9012 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-32.4512 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.7 ; Set pressure advance
M117 PA 0.7
G1 X-11.238 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-32.4512 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-31.8755 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.6623 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.8755 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-31.2998 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.0866 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.2998 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-28.8498 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.75 ; Set pressure advance
M117 PA 0.75
G1 X-7.6366 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.8498 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-28.2741 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-7.0609 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.2741 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-27.6984 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-6.4852 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-27.6984 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-25.2484 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.8 ; Set pressure advance
M117 PA 0.8
G1 X-4.0352 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-25.2484 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-24.6727 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.4595 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.6727 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-24.097 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-2.8838 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.097 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-21.647 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.85 ; Set pressure advance
M117 PA 0.85
G1 X-0.4338 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.647 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-21.0713 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.1419 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.0713 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-20.4956 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.7176 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-20.4956 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-18.0456 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.9 ; Set pressure advance
M117 PA 0.9
G1 X3.1676 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-18.0456 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-17.4699 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X3.7433 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-17.4699 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-16.8942 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X4.319 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-16.8942 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-14.4442 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.95 ; Set pressure advance
M117 PA 0.95
G1 X6.769 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-14.4442 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-13.8685 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.3447 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.8685 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-13.2928 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.9204 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.2928 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-10.8428 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1 ; Set pressure advance
M117 PA 1
G1 X10.3704 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.8428 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-10.2671 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X10.9461 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.2671 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-9.6915 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X11.5218 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-9.6915 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-7.2415 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.05 ; Set pressure advance
M117 PA 1.05
G1 X13.9718 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-7.2415 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-6.6658 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X14.5474 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.6658 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-6.0901 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X15.1231 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.0901 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-3.6401 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.1 ; Set pressure advance
M117 PA 1.1
G1 X17.5731 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.6401 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-3.0644 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.1488 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.0644 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-2.4887 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.7245 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-2.4887 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-0.0387 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.15 ; Set pressure advance
M117 PA 1.15
G1 X21.1745 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-0.0387 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X0.537 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X21.7502 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X0.537 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X1.1127 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X22.3259 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X1.1127 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X3.5627 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.2 ; Set pressure advance
M117 PA 1.2
G1 X24.7759 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X3.5627 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X4.1384 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.3516 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.1384 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X4.7141 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.9273 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.7141 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X7.1641 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.25 ; Set pressure advance
M117 PA 1.25
G1 X28.3773 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.1641 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X7.7398 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X28.953 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.7398 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X8.3155 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X29.5287 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X8.3155 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X10.7655 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.3 ; Set pressure advance
M117 PA 1.3
G1 X31.9787 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X10.7655 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X11.3412 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X32.5544 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.3412 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X11.9169 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X33.1301 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.9169 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X14.3669 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.35 ; Set pressure advance
M117 PA 1.35
G1 X35.5801 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.3669 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X14.9426 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.1558 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.9426 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X15.5183 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.7315 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X15.5183 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X17.9683 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.4 ; Set pressure advance
M117 PA 1.4
G1 X39.1815 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X17.9683 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X18.544 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X39.7572 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X18.544 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X19.1197 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X40.3329 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X19.1197 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X21.5697 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.45 ; Set pressure advance
M117 PA 1.45
G1 X42.7829 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X21.5697 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X22.1454 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.3586 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.1454 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X22.7211 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.9343 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.7211 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X25.1711 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.5 ; Set pressure advance
M117 PA 1.5
G1 X46.3843 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.1711 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X25.7468 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X46.96 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.7468 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X26.3225 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X47.5357 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X26.3225 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.75 F7200 ; Z hop
G0 X-46.8568 Y-25.4932 F7200 ; Move back to start position
G1 Z0.65 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G0 Z0.85 F7200 ; Move to layer height
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance
M117 PA 0.5
G1 X-25.6436 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.8568 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-46.2811 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-25.0679 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-46.2811 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-45.7054 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-24.4922 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-45.7054 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-43.2554 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.55 ; Set pressure advance
M117 PA 0.55
G1 X-22.0422 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-43.2554 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-42.6797 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-21.4665 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.6797 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-42.104 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-20.8908 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-42.104 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-39.654 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.6 ; Set pressure advance
M117 PA 0.6
G1 X-18.4408 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.654 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-39.0783 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.8651 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-39.0783 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-38.5026 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-17.2894 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-38.5026 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-36.0526 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.65 ; Set pressure advance
M117 PA 0.65
G1 X-14.8394 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-36.0526 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-35.4769 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-14.2637 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-35.4769 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-34.9012 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-13.688 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-34.9012 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-32.4512 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.7 ; Set pressure advance
M117 PA 0.7
G1 X-11.238 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-32.4512 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-31.8755 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.6623 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.8755 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-31.2998 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-10.0866 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-31.2998 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-28.8498 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.75 ; Set pressure advance
M117 PA 0.75
G1 X-7.6366 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.8498 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-28.2741 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-7.0609 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-28.2741 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-27.6984 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-6.4852 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-27.6984 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-25.2484 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.8 ; Set pressure advance
M117 PA 0.8
G1 X-4.0352 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-25.2484 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-24.6727 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-3.4595 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.6727 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-24.097 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X-2.8838 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-24.097 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-21.647 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.85 ; Set pressure advance
M117 PA 0.85
G1 X-0.4338 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.647 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-21.0713 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.1419 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-21.0713 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-20.4956 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X0.7176 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-20.4956 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-18.0456 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.9 ; Set pressure advance
M117 PA 0.9
G1 X3.1676 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-18.0456 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-17.4699 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X3.7433 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-17.4699 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-16.8942 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X4.319 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-16.8942 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-14.4442 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=0.95 ; Set pressure advance
M117 PA 0.95
G1 X6.769 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-14.4442 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-13.8685 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.3447 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.8685 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-13.2928 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X7.9204 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-13.2928 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-10.8428 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1 ; Set pressure advance
M117 PA 1
G1 X10.3704 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.8428 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-10.2671 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X10.9461 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-10.2671 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-9.6915 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X11.5218 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-9.6915 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-7.2415 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.05 ; Set pressure advance
M117 PA 1.05
G1 X13.9718 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-7.2415 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-6.6658 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X14.5474 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.6658 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-6.0901 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X15.1231 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-6.0901 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-3.6401 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.1 ; Set pressure advance
M117 PA 1.1
G1 X17.5731 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.6401 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-3.0644 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.1488 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-3.0644 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-2.4887 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X18.7245 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-2.4887 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X-0.0387 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.15 ; Set pressure advance
M117 PA 1.15
G1 X21.1745 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X-0.0387 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X0.537 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X21.7502 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X0.537 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X1.1127 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X22.3259 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X1.1127 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X3.5627 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.2 ; Set pressure advance
M117 PA 1.2
G1 X24.7759 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X3.5627 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X4.1384 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.3516 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.1384 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X4.7141 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X25.9273 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X4.7141 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X7.1641 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.25 ; Set pressure advance
M117 PA 1.25
G1 X28.3773 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.1641 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X7.7398 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X28.953 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X7.7398 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X8.3155 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X29.5287 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X8.3155 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X10.7655 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.3 ; Set pressure advance
M117 PA 1.3
G1 X31.9787 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X10.7655 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X11.3412 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X32.5544 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.3412 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X11.9169 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X33.1301 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X11.9169 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X14.3669 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.35 ; Set pressure advance
M117 PA 1.35
G1 X35.5801 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.3669 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X14.9426 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.1558 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X14.9426 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X15.5183 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X36.7315 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X15.5183 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X17.9683 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.4 ; Set pressure advance
M117 PA 1.4
G1 X39.1815 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X17.9683 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X18.544 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X39.7572 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X18.544 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X19.1197 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X40.3329 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X19.1197 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X21.5697 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.45 ; Set pressure advance
M117 PA 1.45
G1 X42.7829 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X21.5697 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X22.1454 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.3586 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.1454 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X22.7211 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X43.9343 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X22.7211 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X25.1711 Y-25.4932 F7200 ; Move to next pattern
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
SET_PRESSURE_ADVANCE ADVANCE=1.5 ; Set pressure advance
M117 PA 1.5
G1 X46.3843 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.1711 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X25.7468 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X46.96 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X25.7468 Y16.9332 E1.01546 F6000 ; Print pattern wall
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 X26.3225 Y-25.4932 F7200 ; Move to start next pattern wall
G1 Z0.85 F7200 ; Z hop return
G1 E2 F2400 ; Un-retract
G1 X47.5357 Y-4.28 E1.01546 F6000 ; Print pattern wall
G1 X26.3225 Y16.9332 E1.01546 F6000 ; Print pattern wall
SET_PRESSURE_ADVANCE ADVANCE=0.5 ; Set pressure advance back to start value
M117 PA 0.5
G1 E-2 F3600 ; Retract
G1 Z0.95 F7200 ; Z hop
G0 Z5.85 F7200 ; Z raise
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
M107    ; Turn off fan
;
; End G-code
;
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
G28 ; home
M84 ; disable motors
; total layers count = [total_layer_count]
;
; FINISH
;
