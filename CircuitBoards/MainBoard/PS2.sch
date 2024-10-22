EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 18
Title "My68k - MainBoard, PS/2"
Date "2021-08-27"
Rev "1.0"
Comp ""
Comment1 "Kenneth Keeley"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L My68k:8242 U901
U 1 1 611C47D5
P 4450 3850
AR Path="/611C47D5" Ref="U901"  Part="1" 
AR Path="/611C4559/611C47D5" Ref="U901"  Part="1" 
F 0 "U901" H 4000 5200 60  0000 C CNN
F 1 "8242" H 4450 3850 60  0000 C CNN
F 2 "My68k:DIP-40_600" H 4450 3850 60  0001 C CNN
F 3 "" H 4450 3850 60  0000 C CNN
	1    4450 3850
	1    0    0    -1  
$EndComp
$Comp
L My68k:DualMiniDin6 J901
U 1 1 611C6123
P 7600 2550
F 0 "J901" H 7600 3073 50  0000 C CNN
F 1 "DualMiniDin6" H 7600 3074 50  0001 C CNN
F 2 "My68k:KMDGX-6S-6S-S4N" H 7600 2600 50  0001 C CNN
F 3 "" H 7600 2450 60  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
$Comp
L My68k:DualMiniDin6 J901
U 2 1 611C8D81
P 7600 4650
F 0 "J901" H 7600 5173 50  0000 C CNN
F 1 "DualMiniDin6" H 7600 5174 50  0001 C CNN
F 2 "My68k:KMDGX-6S-6S-S4N" H 7600 4700 50  0001 C CNN
F 3 "" H 7600 4550 60  0001 C CNN
	2    7600 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0151
U 1 1 611CC0B4
P 4450 2150
F 0 "#PWR0151" H 4450 2000 50  0001 C CNN
F 1 "+5V" H 4465 2323 50  0000 C CNN
F 2 "" H 4450 2150 50  0001 C CNN
F 3 "" H 4450 2150 50  0001 C CNN
	1    4450 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 611CCE01
P 4450 5600
F 0 "#PWR0152" H 4450 5350 50  0001 C CNN
F 1 "GND" H 4455 5427 50  0001 C CNN
F 2 "" H 4450 5600 50  0001 C CNN
F 3 "" H 4450 5600 50  0001 C CNN
	1    4450 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 611CE542
P 7600 3150
F 0 "#PWR0153" H 7600 2900 50  0001 C CNN
F 1 "GND" H 7605 2977 50  0001 C CNN
F 2 "" H 7600 3150 50  0001 C CNN
F 3 "" H 7600 3150 50  0001 C CNN
	1    7600 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2150 4450 2250
Wire Wire Line
	5250 4900 5350 4900
Wire Wire Line
	4450 5500 4450 5600
$Comp
L power:GND #PWR0154
U 1 1 611D7231
P 8500 2550
F 0 "#PWR0154" H 8500 2300 50  0001 C CNN
F 1 "GND" H 8505 2377 50  0001 C CNN
F 2 "" H 8500 2550 50  0001 C CNN
F 3 "" H 8500 2550 50  0001 C CNN
	1    8500 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0155
U 1 1 611D88D2
P 8500 4650
F 0 "#PWR0155" H 8500 4400 50  0001 C CNN
F 1 "GND" H 8505 4477 50  0001 C CNN
F 2 "" H 8500 4650 50  0001 C CNN
F 3 "" H 8500 4650 50  0001 C CNN
	1    8500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2500 8500 2500
Wire Wire Line
	8500 2500 8500 2550
Wire Wire Line
	8200 4600 8500 4600
Wire Wire Line
	8500 4600 8500 4650
$Comp
L power:GND #PWR0156
U 1 1 611E79C7
P 3550 5150
F 0 "#PWR0156" H 3550 4900 50  0001 C CNN
F 1 "GND" V 3555 5022 50  0001 R CNN
F 2 "" H 3550 5150 50  0001 C CNN
F 3 "" H 3550 5150 50  0001 C CNN
	1    3550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5050 3650 5050
Wire Wire Line
	3550 4950 3650 4950
$Comp
L My68k:74LS06 U902
U 1 1 611F747B
P 5700 2650
AR Path="/611F747B" Ref="U902"  Part="1" 
AR Path="/611C4559/611F747B" Ref="U902"  Part="1" 
F 0 "U902" H 5800 2800 50  0000 C CNN
F 1 "74LS06" H 5700 2450 50  0000 C CNN
F 2 "My68k:SOIC-14" H 5700 2650 50  0001 C CNN
F 3 "" H 5700 2650 50  0001 C CNN
	1    5700 2650
	1    0    0    -1  
$EndComp
$Comp
L My68k:74LS06 U902
U 2 1 611F839C
P 5700 3250
AR Path="/611F839C" Ref="U902"  Part="2" 
AR Path="/611C4559/611F839C" Ref="U902"  Part="2" 
F 0 "U902" H 5800 3400 50  0000 C CNN
F 1 "74LS06" H 5700 3050 50  0000 C CNN
F 2 "My68k:SOIC-14" H 5700 3250 50  0001 C CNN
F 3 "" H 5700 3250 50  0001 C CNN
	2    5700 3250
	1    0    0    -1  
$EndComp
$Comp
L My68k:74LS06 U902
U 3 1 611F8BE6
P 5700 3950
AR Path="/611F8BE6" Ref="U902"  Part="3" 
AR Path="/611C4559/611F8BE6" Ref="U902"  Part="3" 
F 0 "U902" H 5800 4100 50  0000 C CNN
F 1 "74LS06" H 5700 3750 50  0000 C CNN
F 2 "My68k:SOIC-14" H 5700 3950 50  0001 C CNN
F 3 "" H 5700 3950 50  0001 C CNN
	3    5700 3950
	1    0    0    -1  
$EndComp
$Comp
L My68k:74LS06 U902
U 4 1 611F9A22
P 5700 4550
AR Path="/611F9A22" Ref="U902"  Part="4" 
AR Path="/611C4559/611F9A22" Ref="U902"  Part="4" 
F 0 "U902" H 5800 4700 50  0000 C CNN
F 1 "74LS06" H 5700 4350 50  0000 C CNN
F 2 "My68k:SOIC-14" H 5700 4550 50  0001 C CNN
F 3 "" H 5700 4550 50  0001 C CNN
	4    5700 4550
	1    0    0    -1  
$EndComp
$Comp
L My68k:FUSE F901
U 1 1 611FABC0
P 6850 2150
F 0 "F901" H 6850 2340 50  0000 C CNN
F 1 "0.5A" H 6850 2249 50  0000 C CNN
F 2 "My68k:Fuse_Pico" H 6850 2300 50  0001 C CNN
F 3 "" H 6850 2150 50  0001 C CNN
	1    6850 2150
	0    -1   1    0   
$EndComp
$Comp
L My68k:C C901
U 1 1 611FB80B
P 8550 3700
F 0 "C901" H 8642 3746 50  0000 L CNN
F 1 "47pF" H 8642 3655 50  0000 L CNN
F 2 "My68k:C_0805" H 8550 3700 50  0001 C CNN
F 3 "" H 8550 3700 50  0001 C CNN
	1    8550 3700
	1    0    0    -1  
$EndComp
$Comp
L My68k:C C902
U 1 1 611FC61A
P 8850 3700
F 0 "C902" H 8942 3746 50  0000 L CNN
F 1 "47pF" H 8942 3655 50  0000 L CNN
F 2 "My68k:C_0805" H 8850 3700 50  0001 C CNN
F 3 "" H 8850 3700 50  0001 C CNN
	1    8850 3700
	1    0    0    -1  
$EndComp
$Comp
L My68k:C C903
U 1 1 611FCF63
P 8550 5750
F 0 "C903" H 8642 5796 50  0000 L CNN
F 1 "47pF" H 8642 5705 50  0000 L CNN
F 2 "My68k:C_0805" H 8550 5750 50  0001 C CNN
F 3 "" H 8550 5750 50  0001 C CNN
	1    8550 5750
	1    0    0    -1  
$EndComp
$Comp
L My68k:C C904
U 1 1 611FD8DA
P 8850 5750
F 0 "C904" H 8942 5796 50  0000 L CNN
F 1 "47pF" H 8942 5705 50  0000 L CNN
F 2 "My68k:C_0805" H 8850 5750 50  0001 C CNN
F 3 "" H 8850 5750 50  0001 C CNN
	1    8850 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 611FF5E3
P 8550 5900
F 0 "#PWR0157" H 8550 5650 50  0001 C CNN
F 1 "GND" H 8555 5727 50  0001 C CNN
F 2 "" H 8550 5900 50  0001 C CNN
F 3 "" H 8550 5900 50  0001 C CNN
	1    8550 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 611FFFBF
P 8850 5900
F 0 "#PWR0158" H 8850 5650 50  0001 C CNN
F 1 "GND" H 8855 5727 50  0001 C CNN
F 2 "" H 8850 5900 50  0001 C CNN
F 3 "" H 8850 5900 50  0001 C CNN
	1    8850 5900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0159
U 1 1 612009E2
P 6850 1950
F 0 "#PWR0159" H 6850 1800 50  0001 C CNN
F 1 "+5V" H 6865 2123 50  0000 C CNN
F 2 "" H 6850 1950 50  0001 C CNN
F 3 "" H 6850 1950 50  0001 C CNN
	1    6850 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0160
U 1 1 611CC844
P 5400 4900
F 0 "#PWR0160" H 5400 4750 50  0001 C CNN
F 1 "+5V" V 5415 5028 50  0000 L CNN
F 2 "" H 5400 4900 50  0001 C CNN
F 3 "" H 5400 4900 50  0001 C CNN
	1    5400 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 5100 5350 5100
Wire Wire Line
	5350 5100 5350 5000
Connection ~ 5350 4900
Wire Wire Line
	5350 4900 5400 4900
Wire Wire Line
	5250 5000 5350 5000
Connection ~ 5350 5000
Wire Wire Line
	5350 5000 5350 4900
Wire Wire Line
	3550 4950 3550 5050
Connection ~ 3550 5050
Wire Wire Line
	3550 5050 3550 5150
NoConn ~ 5250 2750
NoConn ~ 5250 2850
NoConn ~ 5250 3050
NoConn ~ 5250 3150
NoConn ~ 5250 3350
NoConn ~ 5250 3450
NoConn ~ 5250 3750
NoConn ~ 5250 3850
NoConn ~ 5250 4050
Wire Wire Line
	5250 2650 5400 2650
Wire Wire Line
	5250 3250 5400 3250
Wire Wire Line
	5250 2950 6650 2950
Wire Wire Line
	6650 2950 6650 2650
Wire Wire Line
	6650 2650 6000 2650
Wire Wire Line
	5250 3550 6550 3550
Wire Wire Line
	6550 3550 6550 3250
Wire Wire Line
	6550 3250 6000 3250
Wire Wire Line
	5250 3950 5400 3950
Wire Wire Line
	5250 3650 6550 3650
Wire Wire Line
	6550 3650 6550 3950
Wire Wire Line
	6550 3950 6000 3950
Wire Wire Line
	5250 4250 6450 4250
Wire Wire Line
	6450 4250 6450 4550
Wire Wire Line
	6450 4550 6000 4550
Wire Wire Line
	5250 4550 5400 4550
NoConn ~ 7000 2700
NoConn ~ 7000 2400
Wire Wire Line
	8250 2700 8200 2700
Connection ~ 6650 2950
Wire Wire Line
	8200 2400 8350 2400
Wire Wire Line
	6650 2950 6650 3450
Wire Wire Line
	7600 3150 7600 3100
Wire Wire Line
	6650 3450 8250 3450
Wire Wire Line
	8250 2700 8250 3450
Wire Wire Line
	6550 3550 8350 3550
Wire Wire Line
	8350 2400 8350 3550
Connection ~ 6550 3550
Wire Wire Line
	8200 4800 8250 4800
Wire Wire Line
	8250 4800 8250 5500
Wire Wire Line
	8250 5500 6550 5500
Wire Wire Line
	6550 5500 6550 3950
Connection ~ 6550 3950
Wire Wire Line
	6450 4550 6450 5600
Wire Wire Line
	6450 5600 8350 5600
Wire Wire Line
	8350 5600 8350 4500
Wire Wire Line
	8350 4500 8200 4500
Connection ~ 6450 4550
$Comp
L power:GND #PWR0161
U 1 1 611FEC23
P 8850 3850
F 0 "#PWR0161" H 8850 3600 50  0001 C CNN
F 1 "GND" H 8855 3677 50  0001 C CNN
F 2 "" H 8850 3850 50  0001 C CNN
F 3 "" H 8850 3850 50  0001 C CNN
	1    8850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 611FE27F
P 8550 3850
F 0 "#PWR0162" H 8550 3600 50  0001 C CNN
F 1 "GND" H 8555 3677 50  0001 C CNN
F 2 "" H 8550 3850 50  0001 C CNN
F 3 "" H 8550 3850 50  0001 C CNN
	1    8550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3800 8550 3850
Wire Wire Line
	8850 3800 8850 3850
Wire Wire Line
	8550 5850 8550 5900
Wire Wire Line
	8850 5850 8850 5900
Wire Wire Line
	8550 5650 8550 5600
Wire Wire Line
	8550 5600 8350 5600
Connection ~ 8350 5600
Wire Wire Line
	8250 5500 8850 5500
Wire Wire Line
	8850 5500 8850 5650
Connection ~ 8250 5500
Wire Wire Line
	8550 3600 8550 3550
Wire Wire Line
	8550 3550 8350 3550
Connection ~ 8350 3550
Wire Wire Line
	8250 3450 8850 3450
Wire Wire Line
	8850 3450 8850 3600
Connection ~ 8250 3450
Wire Wire Line
	6850 1950 6850 2050
Wire Wire Line
	6850 2250 6850 2500
Wire Wire Line
	6850 2500 7000 2500
Wire Wire Line
	6850 4600 7000 4600
NoConn ~ 7000 4800
NoConn ~ 7000 4500
Text Label 3400 2650 0    50   ~ 0
D24
Text Label 3400 2750 0    50   ~ 0
D25
Text Label 3400 2850 0    50   ~ 0
D26
Text Label 3400 2950 0    50   ~ 0
D27
Text Label 3400 3050 0    50   ~ 0
D28
Text Label 3400 3150 0    50   ~ 0
D29
Text Label 3400 3250 0    50   ~ 0
D30
Text Label 3400 3350 0    50   ~ 0
D31
Entry Wire Line
	3300 2550 3400 2650
Entry Wire Line
	3300 2650 3400 2750
Entry Wire Line
	3300 2750 3400 2850
Entry Wire Line
	3300 2850 3400 2950
Entry Wire Line
	3300 2950 3400 3050
Entry Wire Line
	3300 3050 3400 3150
Entry Wire Line
	3300 3150 3400 3250
Entry Wire Line
	3300 3250 3400 3350
Wire Wire Line
	3400 2650 3650 2650
Wire Wire Line
	3400 2750 3650 2750
Wire Wire Line
	3400 2850 3650 2850
Wire Wire Line
	3400 2950 3650 2950
Wire Wire Line
	3400 3050 3650 3050
Wire Wire Line
	3400 3150 3650 3150
Wire Wire Line
	3400 3250 3650 3250
Wire Wire Line
	3400 3350 3650 3350
Wire Wire Line
	3650 3550 3400 3550
Wire Wire Line
	3400 3750 3650 3750
Wire Wire Line
	3400 3850 3650 3850
Wire Wire Line
	3400 4050 3650 4050
Wire Wire Line
	3400 4150 3650 4150
Wire Wire Line
	3400 4250 3650 4250
Wire Wire Line
	3400 4450 3650 4450
Wire Wire Line
	3400 4650 3650 4650
Wire Bus Line
	3300 2500 3250 2450
Wire Bus Line
	3250 2450 3200 2450
Text GLabel 3200 2450 0    50   BiDi ~ 0
D[0..31]
Text GLabel 3150 3350 0    50   Input ~ 0
A[0..31]
Text GLabel 3400 4050 0    50   Input ~ 0
nCS_PS2
Text GLabel 3400 4150 0    50   Input ~ 0
nWR
Text GLabel 3400 4250 0    50   Input ~ 0
nRD
Text GLabel 3400 4450 0    50   Input ~ 0
nReset
Text GLabel 3400 4650 0    50   Input ~ 0
PS2_CLK
Text GLabel 3400 3750 0    50   Output ~ 0
IRQ_K
Text GLabel 3400 3850 0    50   Output ~ 0
IRQ_M
Entry Wire Line
	3300 3450 3400 3550
Wire Bus Line
	3300 3450 3300 3400
Wire Bus Line
	3300 3400 3250 3350
Wire Bus Line
	3250 3350 3150 3350
Text Label 3400 3550 0    50   ~ 0
A0
$Comp
L My68k:FUSE F902
U 1 1 6120E21D
P 6850 4250
F 0 "F902" H 6850 4440 50  0000 C CNN
F 1 "0.5A" H 6850 4349 50  0000 C CNN
F 2 "My68k:Fuse_Pico" H 6850 4400 50  0001 C CNN
F 3 "" H 6850 4250 50  0001 C CNN
	1    6850 4250
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR0174
U 1 1 6120E583
P 6850 4050
F 0 "#PWR0174" H 6850 3900 50  0001 C CNN
F 1 "+5V" H 6865 4223 50  0000 C CNN
F 2 "" H 6850 4050 50  0001 C CNN
F 3 "" H 6850 4050 50  0001 C CNN
	1    6850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4050 6850 4150
Wire Wire Line
	6850 4350 6850 4600
$Comp
L My68k:R R901
U 1 1 61227C02
P 8550 3300
F 0 "R901" H 8609 3346 50  0000 L CNN
F 1 "4K7" H 8609 3255 50  0000 L CNN
F 2 "My68k:R_0805" H 8550 3300 50  0001 C CNN
F 3 "" H 8550 3300 50  0001 C CNN
	1    8550 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0175
U 1 1 61231AEA
P 8550 3100
F 0 "#PWR0175" H 8550 2950 50  0001 C CNN
F 1 "+5V" H 8565 3273 50  0000 C CNN
F 2 "" H 8550 3100 50  0001 C CNN
F 3 "" H 8550 3100 50  0001 C CNN
	1    8550 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3100 8550 3200
$Comp
L My68k:R R902
U 1 1 612470A8
P 8850 3300
F 0 "R902" H 8909 3346 50  0000 L CNN
F 1 "4K7" H 8909 3255 50  0000 L CNN
F 2 "My68k:R_0805" H 8850 3300 50  0001 C CNN
F 3 "" H 8850 3300 50  0001 C CNN
	1    8850 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0176
U 1 1 612473A2
P 8850 3100
F 0 "#PWR0176" H 8850 2950 50  0001 C CNN
F 1 "+5V" H 8865 3273 50  0000 C CNN
F 2 "" H 8850 3100 50  0001 C CNN
F 3 "" H 8850 3100 50  0001 C CNN
	1    8850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3100 8850 3200
$Comp
L My68k:R R903
U 1 1 61259CD2
P 8550 5350
F 0 "R903" H 8609 5396 50  0000 L CNN
F 1 "4K7" H 8609 5305 50  0000 L CNN
F 2 "My68k:R_0805" H 8550 5350 50  0001 C CNN
F 3 "" H 8550 5350 50  0001 C CNN
	1    8550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0177
U 1 1 61259FE6
P 8550 5150
F 0 "#PWR0177" H 8550 5000 50  0001 C CNN
F 1 "+5V" H 8565 5323 50  0000 C CNN
F 2 "" H 8550 5150 50  0001 C CNN
F 3 "" H 8550 5150 50  0001 C CNN
	1    8550 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 5150 8550 5250
$Comp
L My68k:R R904
U 1 1 61259FF1
P 8850 5350
F 0 "R904" H 8909 5396 50  0000 L CNN
F 1 "4K7" H 8909 5305 50  0000 L CNN
F 2 "My68k:R_0805" H 8850 5350 50  0001 C CNN
F 3 "" H 8850 5350 50  0001 C CNN
	1    8850 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0178
U 1 1 61259FFB
P 8850 5150
F 0 "#PWR0178" H 8850 5000 50  0001 C CNN
F 1 "+5V" H 8865 5323 50  0000 C CNN
F 2 "" H 8850 5150 50  0001 C CNN
F 3 "" H 8850 5150 50  0001 C CNN
	1    8850 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5150 8850 5250
Wire Wire Line
	8550 3550 8550 3400
Connection ~ 8550 3550
Wire Wire Line
	8850 3450 8850 3400
Connection ~ 8850 3450
Wire Wire Line
	8550 5600 8550 5450
Connection ~ 8550 5600
Wire Wire Line
	8850 5500 8850 5450
Connection ~ 8850 5500
$Comp
L power:+5V #PWR0179
U 1 1 61487B7A
P 5600 2250
F 0 "#PWR0179" H 5600 2100 50  0001 C CNN
F 1 "+5V" H 5615 2423 50  0000 C CNN
F 2 "" H 5600 2250 50  0001 C CNN
F 3 "" H 5600 2250 50  0001 C CNN
	1    5600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2250 5600 2350
Wire Bus Line
	3300 2500 3300 3250
$EndSCHEMATC
