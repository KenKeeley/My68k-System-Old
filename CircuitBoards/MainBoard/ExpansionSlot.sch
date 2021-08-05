EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
Title "My68k - MainBoard, Expansion Slot"
Date "2021-08-06"
Rev "1.0"
Comp ""
Comment1 "Kenneth Keeley"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L My68k:DIN41612-C-96-F Slot1
U 1 1 5A84B935
P 2000 3950
AR Path="/61077BCB/5A84B935" Ref="Slot1"  Part="1" 
AR Path="/61077C81/5A84B935" Ref="Slot2"  Part="1" 
F 0 "Slot1" H 2000 5650 50  0000 C CNN
F 1 "DIN41612-C-96-F" V 1650 5150 50  0000 C CNN
F 2 "My68k:DIN41612-C-96-F" H 2000 3950 50  0001 C CNN
F 3 "" H 2000 3950 50  0000 C CNN
	1    2000 3950
	1    0    0    -1  
$EndComp
$Comp
L My68k:DIN41612-C-96-F Slot1
U 2 1 5A84B974
P 5200 3950
AR Path="/61077BCB/5A84B974" Ref="Slot1"  Part="2" 
AR Path="/61077C81/5A84B974" Ref="Slot2"  Part="2" 
F 0 "Slot1" H 5200 5650 50  0000 C CNN
F 1 "DIN41612-C-96-F" V 4850 5150 50  0000 C CNN
F 2 "My68k:DIN41612-C-96-F" H 5200 3950 50  0001 C CNN
F 3 "" H 5200 3950 50  0000 C CNN
	2    5200 3950
	1    0    0    -1  
$EndComp
$Comp
L My68k:DIN41612-C-96-F Slot1
U 3 1 5A84B9C3
P 8350 3950
AR Path="/61077BCB/5A84B9C3" Ref="Slot1"  Part="3" 
AR Path="/61077C81/5A84B9C3" Ref="Slot2"  Part="3" 
F 0 "Slot1" H 8350 5650 50  0000 C CNN
F 1 "DIN41612-C-96-F" V 8000 5150 50  0000 C CNN
F 2 "My68k:DIN41612-C-96-F" H 8350 3950 50  0001 C CNN
F 3 "" H 8350 3950 50  0000 C CNN
	3    8350 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5A84BA44
P 2600 5650
AR Path="/61077BCB/5A84BA44" Ref="#PWR0101"  Part="1" 
AR Path="/61077C81/5A84BA44" Ref="#PWR0201"  Part="1" 
F 0 "#PWR0101" H 2600 5650 30  0001 C CNN
F 1 "GND" H 2600 5580 30  0001 C CNN
F 2 "" H 2600 5650 60  0000 C CNN
F 3 "" H 2600 5650 60  0000 C CNN
	1    2600 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5A84BA6C
P 5750 5650
AR Path="/61077BCB/5A84BA6C" Ref="#PWR0102"  Part="1" 
AR Path="/61077C81/5A84BA6C" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0102" H 5750 5650 30  0001 C CNN
F 1 "GND" H 5750 5580 30  0001 C CNN
F 2 "" H 5750 5650 60  0000 C CNN
F 3 "" H 5750 5650 60  0000 C CNN
	1    5750 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5A84BA1C
P 8950 5650
AR Path="/61077BCB/5A84BA1C" Ref="#PWR0103"  Part="1" 
AR Path="/61077C81/5A84BA1C" Ref="#PWR0203"  Part="1" 
F 0 "#PWR0103" H 8950 5650 30  0001 C CNN
F 1 "GND" H 8950 5580 30  0001 C CNN
F 2 "" H 8950 5650 60  0000 C CNN
F 3 "" H 8950 5650 60  0000 C CNN
	1    8950 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5A84BA9B
P 2750 5500
AR Path="/61077BCB/5A84BA9B" Ref="#PWR0104"  Part="1" 
AR Path="/61077C81/5A84BA9B" Ref="#PWR0204"  Part="1" 
F 0 "#PWR0104" H 2750 5350 60  0001 C CNN
F 1 "+5V" V 2750 5700 50  0000 C CNN
F 2 "" H 2750 5500 60  0000 C CNN
F 3 "" H 2750 5500 60  0000 C CNN
	1    2750 5500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5A84BAC3
P 5950 5500
AR Path="/61077BCB/5A84BAC3" Ref="#PWR0105"  Part="1" 
AR Path="/61077C81/5A84BAC3" Ref="#PWR0205"  Part="1" 
F 0 "#PWR0105" H 5950 5350 60  0001 C CNN
F 1 "+5V" V 5950 5700 50  0000 C CNN
F 2 "" H 5950 5500 60  0000 C CNN
F 3 "" H 5950 5500 60  0000 C CNN
	1    5950 5500
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5A84BAEB
P 9100 5500
AR Path="/61077BCB/5A84BAEB" Ref="#PWR0106"  Part="1" 
AR Path="/61077C81/5A84BAEB" Ref="#PWR0206"  Part="1" 
F 0 "#PWR0106" H 9100 5350 60  0001 C CNN
F 1 "+5V" V 9100 5700 50  0000 C CNN
F 2 "" H 9100 5500 60  0000 C CNN
F 3 "" H 9100 5500 60  0000 C CNN
	1    9100 5500
	0    1    1    0   
$EndComp
Text GLabel 3700 3450 2    60   Input ~ 0
A[0..31]
Text GLabel 3700 2200 2    60   Input ~ 0
D[0..31]
Text GLabel 5950 5400 2    60   Input ~ 0
nIRQ1
Text GLabel 5950 5300 2    60   Input ~ 0
nIRQ2
Text GLabel 5950 5200 2    60   Input ~ 0
nIRQ3
Text GLabel 5950 5100 2    60   Input ~ 0
nIRQ4
Text GLabel 5950 5000 2    60   Input ~ 0
nIRQ5
Text GLabel 5950 4900 2    60   Input ~ 0
nIRQ6
Text GLabel 5950 4800 2    60   Input ~ 0
nIRQ7
Text GLabel 5950 3200 2    60   Input ~ 0
nAS
Text GLabel 2750 4600 2    60   Input ~ 0
nBGACK
Text GLabel 9100 4600 2    60   Input ~ 0
nBR
Text GLabel 5950 4600 2    60   Input ~ 0
nDSACK0
Text GLabel 5950 4700 2    60   Input ~ 0
nDSACK1
Text GLabel 2800 3400 2    60   Input ~ 0
SIZ0
Text GLabel 2800 3500 2    60   Input ~ 0
SIZ1
Text GLabel 5950 4200 2    60   Input ~ 0
nSTERM
Text GLabel 9100 4300 2    60   Input ~ 0
nHalt
Text GLabel 9100 3200 2    60   Input ~ 0
nReset
Text GLabel 2800 3200 2    60   Input ~ 0
nWR
Wire Wire Line
	2500 3300 2600 3300
Wire Wire Line
	2600 3300 2600 4500
Wire Wire Line
	5700 3300 5750 3300
Wire Wire Line
	5750 3300 5750 4500
Wire Wire Line
	8850 3300 8950 3300
Wire Wire Line
	8950 3300 8950 4500
Wire Wire Line
	2500 2400 3450 2400
Wire Wire Line
	2500 2500 3450 2500
Wire Wire Line
	2500 2600 3450 2600
Wire Wire Line
	2500 2700 3450 2700
Wire Wire Line
	2500 2800 3450 2800
Wire Wire Line
	2500 2900 3450 2900
Wire Wire Line
	2500 3000 3450 3000
Wire Wire Line
	2500 3100 3450 3100
Wire Wire Line
	2500 3200 2800 3200
Wire Wire Line
	2500 3400 2800 3400
Wire Wire Line
	2500 3500 2800 3500
Wire Wire Line
	2500 3600 3450 3600
Wire Wire Line
	2500 3700 3450 3700
Wire Wire Line
	2500 3800 3450 3800
Wire Wire Line
	2500 3900 3450 3900
Wire Wire Line
	2500 4000 3450 4000
Wire Wire Line
	2500 4100 3450 4100
Wire Wire Line
	2500 4200 3450 4200
Wire Wire Line
	2500 5400 3450 5400
Wire Wire Line
	2500 4600 2750 4600
Wire Wire Line
	2500 4700 3450 4700
Wire Wire Line
	2500 4800 3450 4800
Wire Wire Line
	2500 4900 3450 4900
Wire Wire Line
	2500 5000 3450 5000
Wire Wire Line
	2500 5100 3450 5100
Wire Wire Line
	2500 5200 3450 5200
Wire Wire Line
	2500 5300 3450 5300
Wire Wire Line
	2500 5500 2750 5500
Wire Wire Line
	5700 3200 5950 3200
Wire Wire Line
	5700 4200 5950 4200
Wire Wire Line
	5700 5400 5950 5400
Wire Wire Line
	5700 4600 5950 4600
Wire Wire Line
	5700 4700 5950 4700
Wire Wire Line
	5700 4800 5950 4800
Wire Wire Line
	5700 4900 5950 4900
Wire Wire Line
	5700 5000 5950 5000
Wire Wire Line
	5700 5100 5950 5100
Wire Wire Line
	5700 5200 5950 5200
Wire Wire Line
	5700 5300 5950 5300
Wire Wire Line
	5700 5500 5950 5500
Wire Wire Line
	8850 3200 9100 3200
Wire Wire Line
	8850 4300 9100 4300
Wire Wire Line
	8850 4400 9100 4400
Wire Wire Line
	8850 4600 9100 4600
Wire Wire Line
	8850 5500 9100 5500
Wire Wire Line
	2500 4500 2600 4500
Connection ~ 2600 4500
Wire Wire Line
	2600 4500 2600 5650
Wire Wire Line
	5700 4500 5750 4500
Connection ~ 5750 4500
Wire Wire Line
	5750 4500 5750 5650
Wire Wire Line
	8850 4500 8950 4500
Connection ~ 8950 4500
Wire Wire Line
	8950 4500 8950 5650
Text HLabel 2800 4300 2    50   Input ~ 0
nBGIN
Text HLabel 2800 4400 2    50   Input ~ 0
nBGOUT
Text HLabel 5950 4300 2    50   Input ~ 0
nIACKIN
Text HLabel 5950 4400 2    50   Input ~ 0
nIACKOUT
Text HLabel 9100 4400 2    50   Input ~ 0
nID
Entry Wire Line
	3450 2400 3550 2300
Entry Wire Line
	3450 2500 3550 2400
Entry Wire Line
	3450 2600 3550 2500
Entry Wire Line
	3450 2700 3550 2600
Entry Wire Line
	3450 2800 3550 2700
Entry Wire Line
	3450 2900 3550 2800
Entry Wire Line
	3450 3000 3550 2900
Entry Wire Line
	3450 3100 3550 3000
Entry Wire Line
	3450 3600 3550 3500
Entry Wire Line
	3450 3700 3550 3600
Entry Wire Line
	3450 3800 3550 3700
Entry Wire Line
	3450 3900 3550 3800
Entry Wire Line
	3450 4000 3550 3900
Entry Wire Line
	3450 4100 3550 4000
Entry Wire Line
	3450 4200 3550 4100
Entry Wire Line
	3450 4700 3550 4600
Entry Wire Line
	3450 4800 3550 4700
Entry Wire Line
	3450 4900 3550 4800
Entry Wire Line
	3450 5000 3550 4900
Entry Wire Line
	3450 5100 3550 5000
Entry Wire Line
	3450 5200 3550 5100
Entry Wire Line
	3450 5300 3550 5200
Entry Wire Line
	3450 5400 3550 5300
Text Label 3150 2400 0    50   ~ 0
D0
Text Label 3150 2500 0    50   ~ 0
D1
Text Label 3150 2600 0    50   ~ 0
D2
Text Label 3150 2700 0    50   ~ 0
D3
Text Label 3150 2800 0    50   ~ 0
D4
Text Label 3150 2900 0    50   ~ 0
D5
Text Label 3150 3000 0    50   ~ 0
D6
Text Label 3150 3100 0    50   ~ 0
D7
Text Label 3150 3600 0    50   ~ 0
A25
Text Label 3150 3700 0    50   ~ 0
A26
Text Label 3150 3800 0    50   ~ 0
A27
Text Label 3150 3900 0    50   ~ 0
A28
Text Label 3150 4000 0    50   ~ 0
A29
Text Label 3150 4100 0    50   ~ 0
A30
Text Label 3150 4200 0    50   ~ 0
A31
Text Label 3150 4700 0    50   ~ 0
A0
Text Label 3150 4800 0    50   ~ 0
A1
Text Label 3150 4900 0    50   ~ 0
A2
Text Label 3150 5000 0    50   ~ 0
A3
Text Label 3150 5100 0    50   ~ 0
A4
Text Label 3150 5200 0    50   ~ 0
A5
Text Label 3150 5300 0    50   ~ 0
A6
Text Label 3150 5400 0    50   ~ 0
A7
Wire Bus Line
	3550 2250 3600 2200
Wire Bus Line
	3600 2200 3700 2200
Wire Bus Line
	3550 3500 3600 3450
Wire Bus Line
	3600 3450 3700 3450
Text GLabel 6900 2200 2    60   Input ~ 0
D[0..31]
Entry Wire Line
	6650 2400 6750 2300
Entry Wire Line
	6650 2500 6750 2400
Entry Wire Line
	6650 2600 6750 2500
Entry Wire Line
	6650 2700 6750 2600
Entry Wire Line
	6650 2800 6750 2700
Entry Wire Line
	6650 2900 6750 2800
Entry Wire Line
	6650 3000 6750 2900
Entry Wire Line
	6650 3100 6750 3000
Text Label 6350 2400 0    50   ~ 0
D16
Text Label 6350 2500 0    50   ~ 0
D17
Text Label 6350 2600 0    50   ~ 0
D18
Text Label 6350 2700 0    50   ~ 0
D19
Text Label 6350 2800 0    50   ~ 0
D20
Text Label 6350 2900 0    50   ~ 0
D21
Text Label 6350 3000 0    50   ~ 0
D22
Text Label 6350 3100 0    50   ~ 0
D23
Wire Bus Line
	6750 2250 6800 2200
Wire Bus Line
	6800 2200 6900 2200
Wire Wire Line
	5700 3100 6650 3100
Wire Wire Line
	5700 3000 6650 3000
Wire Wire Line
	5700 2900 6650 2900
Wire Wire Line
	5700 2800 6650 2800
Wire Wire Line
	5700 2700 6650 2700
Wire Wire Line
	5700 2600 6650 2600
Wire Wire Line
	5700 2500 6650 2500
Wire Wire Line
	5700 2400 6650 2400
Text GLabel 10050 2200 2    60   Input ~ 0
D[0..31]
Entry Wire Line
	9800 2400 9900 2300
Entry Wire Line
	9800 2500 9900 2400
Entry Wire Line
	9800 2600 9900 2500
Entry Wire Line
	9800 2700 9900 2600
Entry Wire Line
	9800 2800 9900 2700
Entry Wire Line
	9800 2900 9900 2800
Entry Wire Line
	9800 3000 9900 2900
Entry Wire Line
	9800 3100 9900 3000
Text Label 9500 2400 0    50   ~ 0
D8
Text Label 9500 2500 0    50   ~ 0
D9
Text Label 9500 2600 0    50   ~ 0
D10
Text Label 9500 2700 0    50   ~ 0
D11
Text Label 9500 2800 0    50   ~ 0
D12
Text Label 9500 2900 0    50   ~ 0
D13
Text Label 9500 3000 0    50   ~ 0
D14
Text Label 9500 3100 0    50   ~ 0
D15
Wire Bus Line
	9900 2250 9950 2200
Wire Bus Line
	9950 2200 10050 2200
Wire Wire Line
	8850 2400 9800 2400
Wire Wire Line
	8850 2500 9800 2500
Wire Wire Line
	8850 2600 9800 2600
Wire Wire Line
	8850 2700 9800 2700
Wire Wire Line
	8850 2800 9800 2800
Wire Wire Line
	8850 2900 9800 2900
Wire Wire Line
	8850 3000 9800 3000
Wire Wire Line
	8850 3100 9800 3100
Entry Wire Line
	6650 3400 6750 3300
Entry Wire Line
	6650 3500 6750 3400
Entry Wire Line
	6650 3600 6750 3500
Entry Wire Line
	6650 3700 6750 3600
Entry Wire Line
	6650 3800 6750 3700
Entry Wire Line
	6650 3900 6750 3800
Entry Wire Line
	6650 4000 6750 3900
Entry Wire Line
	6650 4100 6750 4000
Text Label 6350 3400 0    50   ~ 0
D24
Text Label 6350 3500 0    50   ~ 0
D25
Text Label 6350 3600 0    50   ~ 0
D26
Text Label 6350 3700 0    50   ~ 0
D27
Text Label 6350 3800 0    50   ~ 0
D28
Text Label 6350 3900 0    50   ~ 0
D29
Text Label 6350 4000 0    50   ~ 0
D30
Text Label 6350 4100 0    50   ~ 0
D31
Wire Wire Line
	5700 4100 6650 4100
Wire Wire Line
	5700 4000 6650 4000
Wire Wire Line
	5700 3900 6650 3900
Wire Wire Line
	5700 3800 6650 3800
Wire Wire Line
	5700 3700 6650 3700
Wire Wire Line
	5700 3600 6650 3600
Wire Wire Line
	5700 3500 6650 3500
Wire Wire Line
	5700 3400 6650 3400
Text GLabel 10050 3200 2    60   Input ~ 0
A[0..31]
Wire Wire Line
	8850 3600 9800 3600
Wire Wire Line
	8850 3700 9800 3700
Wire Wire Line
	8850 3800 9800 3800
Wire Wire Line
	8850 3900 9800 3900
Wire Wire Line
	8850 4000 9800 4000
Wire Wire Line
	8850 4100 9800 4100
Wire Wire Line
	8850 4200 9800 4200
Wire Wire Line
	8850 5400 9800 5400
Wire Wire Line
	8850 4700 9800 4700
Wire Wire Line
	8850 4800 9800 4800
Wire Wire Line
	8850 4900 9800 4900
Wire Wire Line
	8850 5000 9800 5000
Wire Wire Line
	8850 5100 9800 5100
Wire Wire Line
	8850 5200 9800 5200
Wire Wire Line
	8850 5300 9800 5300
Entry Wire Line
	9800 3600 9900 3500
Entry Wire Line
	9800 3700 9900 3600
Entry Wire Line
	9800 3800 9900 3700
Entry Wire Line
	9800 3900 9900 3800
Entry Wire Line
	9800 4000 9900 3900
Entry Wire Line
	9800 4100 9900 4000
Entry Wire Line
	9800 4200 9900 4100
Entry Wire Line
	9800 4700 9900 4600
Entry Wire Line
	9800 4800 9900 4700
Entry Wire Line
	9800 4900 9900 4800
Entry Wire Line
	9800 5000 9900 4900
Entry Wire Line
	9800 5100 9900 5000
Entry Wire Line
	9800 5200 9900 5100
Entry Wire Line
	9800 5300 9900 5200
Entry Wire Line
	9800 5400 9900 5300
Text Label 9500 3600 0    50   ~ 0
A18
Text Label 9500 3700 0    50   ~ 0
A19
Text Label 9500 3800 0    50   ~ 0
A20
Text Label 9500 3900 0    50   ~ 0
A21
Text Label 9500 4000 0    50   ~ 0
A22
Text Label 9500 4100 0    50   ~ 0
A23
Text Label 9500 4200 0    50   ~ 0
A24
Text Label 9500 4700 0    50   ~ 0
A8
Text Label 9500 4800 0    50   ~ 0
A9
Text Label 9500 4900 0    50   ~ 0
A10
Text Label 9500 5000 0    50   ~ 0
A11
Text Label 9500 5100 0    50   ~ 0
A12
Text Label 9500 5200 0    50   ~ 0
A13
Text Label 9500 5300 0    50   ~ 0
A14
Text Label 9500 5400 0    50   ~ 0
A15
Wire Bus Line
	9950 3200 10050 3200
Wire Bus Line
	9950 3200 9900 3250
Text Label 9500 3500 0    50   ~ 0
A17
Text Label 9500 3400 0    50   ~ 0
A16
Wire Wire Line
	9800 3500 8850 3500
Wire Wire Line
	9800 3400 8850 3400
Entry Wire Line
	9800 3500 9900 3400
Entry Wire Line
	9800 3400 9900 3300
Wire Wire Line
	5700 4300 5950 4300
Wire Wire Line
	5950 4400 5700 4400
Wire Wire Line
	2800 4400 2500 4400
Wire Wire Line
	2500 4300 2800 4300
Wire Bus Line
	3550 2250 3550 3000
Wire Bus Line
	9900 2250 9900 3000
Wire Bus Line
	3550 3500 3550 5300
Wire Bus Line
	9900 3250 9900 5300
Wire Bus Line
	6750 2250 6750 4000
$EndSCHEMATC
