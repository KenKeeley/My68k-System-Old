EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 18
Title "My68k - MainBoard, ATA"
Date "2021-08-27"
Rev "1.0"
Comp ""
Comment1 "Kenneth Keeley"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L My68k:87758-4416 J29
U 1 1 5ABC4D88
P 5750 3300
F 0 "J29" H 5750 4450 50  0000 C CNN
F 1 "ATA" V 5750 3300 50  0000 C CNN
F 2 "My68k:87758-4416" H 5750 2350 50  0001 C CNN
F 3 "" H 5750 2350 50  0001 C CNN
	1    5750 3300
	1    0    0    -1  
$EndComp
$Comp
L My68k:74HCT245 U14
U 1 1 5ABC4E35
P 3150 2850
F 0 "U14" H 2850 3500 50  0000 L BNN
F 1 "74HCT245" H 3150 2600 50  0000 C TNN
F 2 "My68k:SOIC-20" H 3150 2850 50  0001 C CNN
F 3 "" H 3150 2850 50  0001 C CNN
	1    3150 2850
	1    0    0    -1  
$EndComp
$Comp
L My68k:74HCT245 U15
U 1 1 5ABC509B
P 8300 2850
F 0 "U15" H 8550 3500 50  0000 R BNN
F 1 "74HCT245" H 8300 2600 50  0000 C TNN
F 2 "My68k:SOIC-20" H 8300 2850 50  0001 C CNN
F 3 "" H 8300 2850 50  0001 C CNN
	1    8300 2850
	-1   0    0    -1  
$EndComp
$Comp
L My68k:LED D504
U 1 1 5ABCDCF5
P 4100 4350
F 0 "D504" H 4100 4450 50  0000 C CNN
F 1 "ACT" H 4100 4250 50  0000 C CNN
F 2 "My68k:HDR1x2" H 4100 4350 50  0001 C CNN
F 3 "" H 4100 4350 50  0001 C CNN
	1    4100 4350
	-1   0    0    1   
$EndComp
$Comp
L My68k:R R33
U 1 1 5ABCDF3C
P 4750 4400
F 0 "R33" V 4830 4400 50  0000 C CNN
F 1 "10k" V 4681 4400 50  0000 C CNN
F 2 "My68k:R_0805" V 4680 4400 50  0001 C CNN
F 3 "" H 4750 4400 50  0001 C CNN
	1    4750 4400
	1    0    0    -1  
$EndComp
$Comp
L My68k:R R34
U 1 1 5ABCDF67
P 4450 4400
F 0 "R34" V 4530 4400 50  0000 C CNN
F 1 "10k" V 4378 4400 50  0000 C CNN
F 2 "My68k:R_0805" V 4380 4400 50  0001 C CNN
F 3 "" H 4450 4400 50  0001 C CNN
	1    4450 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR078
U 1 1 5ABCDDAB
P 6200 2000
F 0 "#PWR078" H 6200 1850 50  0001 C CNN
F 1 "+5V" H 6200 2150 50  0000 C CNN
F 2 "" H 6200 2000 50  0001 C CNN
F 3 "" H 6200 2000 50  0001 C CNN
	1    6200 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR082
U 1 1 5ABCE58C
P 3150 2000
F 0 "#PWR082" H 3150 1850 50  0001 C CNN
F 1 "+5V" H 3150 2150 50  0000 C CNN
F 2 "" H 3150 2000 50  0001 C CNN
F 3 "" H 3150 2000 50  0001 C CNN
	1    3150 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR083
U 1 1 5ABCE5B2
P 8300 2000
F 0 "#PWR083" H 8300 1850 50  0001 C CNN
F 1 "+5V" H 8300 2150 50  0000 C CNN
F 2 "" H 8300 2000 50  0001 C CNN
F 3 "" H 8300 2000 50  0001 C CNN
	1    8300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR076
U 1 1 5ABC5356
P 6100 4450
F 0 "#PWR076" H 6100 4200 50  0001 C CNN
F 1 "GND" H 6100 4300 50  0001 C CNN
F 2 "" H 6100 4450 50  0001 C CNN
F 3 "" H 6100 4450 50  0001 C CNN
	1    6100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR077
U 1 1 5ABC56BB
P 5400 4450
F 0 "#PWR077" H 5400 4200 50  0001 C CNN
F 1 "GND" H 5400 4300 50  0001 C CNN
F 2 "" H 5400 4450 50  0001 C CNN
F 3 "" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR079
U 1 1 5ABCDFA4
P 4600 4650
F 0 "#PWR079" H 4600 4400 50  0001 C CNN
F 1 "GND" H 4600 4500 50  0001 C CNN
F 2 "" H 4600 4650 50  0001 C CNN
F 3 "" H 4600 4650 50  0001 C CNN
	1    4600 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR080
U 1 1 5ABCE540
P 3150 3800
F 0 "#PWR080" H 3150 3550 50  0001 C CNN
F 1 "GND" H 3150 3650 50  0001 C CNN
F 2 "" H 3150 3800 50  0001 C CNN
F 3 "" H 3150 3800 50  0001 C CNN
	1    3150 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR081
U 1 1 5ABCE566
P 8300 3700
F 0 "#PWR081" H 8300 3450 50  0001 C CNN
F 1 "GND" H 8300 3550 50  0001 C CNN
F 2 "" H 8300 3700 50  0001 C CNN
F 3 "" H 8300 3700 50  0001 C CNN
	1    8300 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2350 3850 2350
Wire Wire Line
	3650 2450 3850 2450
Wire Wire Line
	3650 2550 3850 2550
Wire Wire Line
	3650 2650 3850 2650
Wire Wire Line
	3650 2750 3850 2750
Wire Wire Line
	3650 2850 3850 2850
Wire Wire Line
	3650 2950 3850 2950
Wire Wire Line
	3650 3050 3850 3050
Wire Wire Line
	8800 3250 9000 3250
Wire Wire Line
	8800 3350 9000 3350
Wire Wire Line
	6000 3450 6100 3450
Wire Wire Line
	6600 4050 6000 4050
Wire Wire Line
	4000 4350 3950 4350
Wire Wire Line
	4750 4300 4750 3550
Wire Wire Line
	4450 4300 4450 3750
Wire Wire Line
	4750 4500 4750 4600
Wire Wire Line
	4750 4600 4600 4600
Wire Wire Line
	4450 4600 4450 4500
Wire Wire Line
	4600 4650 4600 4600
Connection ~ 4600 4600
Wire Wire Line
	3150 3800 3150 3650
Wire Wire Line
	3150 2050 3150 2000
Wire Wire Line
	8300 3700 8300 3650
Wire Wire Line
	8300 2050 8300 2000
NoConn ~ 6000 3750
NoConn ~ 6000 3550
NoConn ~ 5500 3650
NoConn ~ 6000 3150
Text GLabel 5150 2250 0    60   Input ~ 0
nReset
Text GLabel 9000 3250 2    60   Input ~ 0
nWR
Text GLabel 9000 3350 2    60   Input ~ 0
nCS_ATA
Text GLabel 4150 4050 0    60   Input ~ 0
nCS_ATA0
Text GLabel 4150 3350 0    60   Input ~ 0
nWR
Text GLabel 4150 3450 0    60   Input ~ 0
nRD
Text GLabel 4150 3550 0    60   Output ~ 0
DTACK_ATA
Text GLabel 4150 3750 0    60   Output ~ 0
IRQ_ATA
Text GLabel 6600 4050 2    60   Input ~ 0
nCS_ATA1
Wire Wire Line
	4600 4600 4450 4600
Text Label 8800 2350 0    50   ~ 0
D16
Text Label 8800 2450 0    50   ~ 0
D17
Text Label 8800 2550 0    50   ~ 0
D18
Text Label 8800 2650 0    50   ~ 0
D19
Text Label 8800 2750 0    50   ~ 0
D20
Text Label 8800 2850 0    50   ~ 0
D21
Text Label 8800 2950 0    50   ~ 0
D22
Text Label 8800 3050 0    50   ~ 0
D23
Text GLabel 9250 2100 2    50   BiDi ~ 0
D[0..31]
Entry Wire Line
	9100 2950 9000 3050
Entry Wire Line
	9100 2750 9000 2850
Entry Wire Line
	9100 2650 9000 2750
Entry Wire Line
	9100 2550 9000 2650
Entry Wire Line
	9100 2450 9000 2550
Entry Wire Line
	9000 2350 9100 2250
Entry Wire Line
	9100 2350 9000 2450
Wire Bus Line
	9150 2100 9250 2100
Wire Bus Line
	9100 2150 9150 2100
Entry Wire Line
	9100 2850 9000 2950
Wire Wire Line
	8800 3050 9000 3050
Wire Wire Line
	9000 2950 8800 2950
Wire Wire Line
	8800 2850 9000 2850
Wire Wire Line
	9000 2750 8800 2750
Wire Wire Line
	8800 2650 9000 2650
Wire Wire Line
	9000 2550 8800 2550
Wire Wire Line
	8800 2450 9000 2450
Wire Wire Line
	9000 2350 8800 2350
Wire Wire Line
	2650 2350 2450 2350
Wire Wire Line
	2650 2450 2450 2450
Wire Wire Line
	2650 2550 2450 2550
Wire Wire Line
	2650 2650 2450 2650
Wire Wire Line
	2650 2750 2450 2750
Wire Wire Line
	2650 2850 2450 2850
Wire Wire Line
	2650 2950 2450 2950
Wire Wire Line
	2650 3050 2450 3050
Entry Wire Line
	2350 2850 2450 2950
Wire Bus Line
	2350 2150 2300 2100
Wire Bus Line
	2300 2100 2200 2100
Entry Wire Line
	2350 2350 2450 2450
Entry Wire Line
	2350 2250 2450 2350
Entry Wire Line
	2350 2450 2450 2550
Entry Wire Line
	2350 2550 2450 2650
Entry Wire Line
	2350 2650 2450 2750
Entry Wire Line
	2350 2750 2450 2850
Entry Wire Line
	2350 2950 2450 3050
Text GLabel 2200 2100 0    50   BiDi ~ 0
D[0..31]
Text Label 2500 3050 0    50   ~ 0
D24
Text Label 2500 2950 0    50   ~ 0
D25
Text Label 2500 2850 0    50   ~ 0
D26
Text Label 2500 2750 0    50   ~ 0
D27
Text Label 2500 2650 0    50   ~ 0
D28
Text Label 2500 2550 0    50   ~ 0
D29
Text Label 2500 2450 0    50   ~ 0
D30
Text Label 2500 2350 0    50   ~ 0
D31
Text GLabel 2450 3350 0    60   Input ~ 0
nCS_ATA
Text GLabel 2450 3250 0    60   Input ~ 0
nWR
Wire Wire Line
	2450 3350 2650 3350
Wire Wire Line
	2450 3250 2650 3250
$Comp
L My68k:R R35
U 1 1 5ABCDD7A
P 3850 4350
F 0 "R35" V 3930 4350 50  0000 C CNN
F 1 "100" V 3769 4350 50  0000 C CNN
F 2 "My68k:R_0805" V 3780 4350 50  0001 C CNN
F 3 "" H 3850 4350 50  0001 C CNN
	1    3850 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0150
U 1 1 612CA2A0
P 5300 2000
F 0 "#PWR0150" H 5300 1850 50  0001 C CNN
F 1 "+5V" H 5300 2150 50  0000 C CNN
F 2 "" H 5300 2000 50  0001 C CNN
F 3 "" H 5300 2000 50  0001 C CNN
	1    5300 2000
	1    0    0    -1  
$EndComp
NoConn ~ 5500 3250
Wire Bus Line
	4150 4850 4950 4850
Wire Bus Line
	4950 4850 5000 4800
Text GLabel 4150 4850 0    50   Input ~ 0
A[0..31]
Entry Wire Line
	5000 4050 5100 3950
Entry Wire Line
	5000 4750 5100 4650
Entry Wire Line
	5000 3950 5100 3850
Text Label 5150 3850 0    50   ~ 0
A1
Text Label 5150 3950 0    50   ~ 0
A2
Text Label 5150 4650 0    50   ~ 0
A3
Wire Wire Line
	5100 3950 5500 3950
$Comp
L My68k:R R801
U 1 1 611A0F27
P 3950 2350
F 0 "R801" V 3850 2350 50  0001 C CNN
F 1 "22" V 3950 2350 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2350 50  0001 C CNN
F 3 "" H 3950 2350 50  0001 C CNN
	1    3950 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 2650 5500 2650
$Comp
L My68k:R R802
U 1 1 611A22E5
P 3950 2450
F 0 "R802" V 3754 2450 50  0001 C CNN
F 1 "22" V 3950 2450 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2450 50  0001 C CNN
F 3 "" H 3950 2450 50  0001 C CNN
	1    3950 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 2750 5500 2750
$Comp
L My68k:R R803
U 1 1 611A2971
P 3950 2550
F 0 "R803" V 3754 2550 50  0001 C CNN
F 1 "22" V 3950 2550 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2550 50  0001 C CNN
F 3 "" H 3950 2550 50  0001 C CNN
	1    3950 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 2850 5500 2850
$Comp
L My68k:R R804
U 1 1 611A2FCC
P 3950 2650
F 0 "R804" V 3754 2650 50  0001 C CNN
F 1 "22" V 3950 2650 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2650 50  0001 C CNN
F 3 "" H 3950 2650 50  0001 C CNN
	1    3950 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 2950 5500 2950
$Comp
L My68k:R R805
U 1 1 611A364F
P 3950 2750
F 0 "R805" V 3754 2750 50  0001 C CNN
F 1 "22" V 3950 2750 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2750 50  0001 C CNN
F 3 "" H 3950 2750 50  0001 C CNN
	1    3950 2750
	0    1    1    0   
$EndComp
$Comp
L My68k:R R806
U 1 1 611A3D24
P 3950 2850
F 0 "R806" V 3754 2850 50  0001 C CNN
F 1 "22" V 3950 2850 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2850 50  0001 C CNN
F 3 "" H 3950 2850 50  0001 C CNN
	1    3950 2850
	0    1    1    0   
$EndComp
$Comp
L My68k:R R807
U 1 1 611A43F7
P 3950 2950
F 0 "R807" V 3754 2950 50  0001 C CNN
F 1 "22" V 3950 2950 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 2950 50  0001 C CNN
F 3 "" H 3950 2950 50  0001 C CNN
	1    3950 2950
	0    1    1    0   
$EndComp
$Comp
L My68k:R R808
U 1 1 611A4AF2
P 3950 3050
F 0 "R808" V 3754 3050 50  0001 C CNN
F 1 "22" V 3950 3050 39  0000 C CNN
F 2 "My68k:R_0805" H 3950 3050 50  0001 C CNN
F 3 "" H 3950 3050 50  0001 C CNN
	1    3950 3050
	0    1    1    0   
$EndComp
$Comp
L My68k:R R811
U 1 1 611A5005
P 7550 2350
F 0 "R811" V 7354 2350 50  0001 C CNN
F 1 "22" V 7550 2350 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2350 50  0001 C CNN
F 3 "" H 7550 2350 50  0001 C CNN
	1    7550 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2350 7800 2350
$Comp
L My68k:R R812
U 1 1 611A5750
P 7550 2450
F 0 "R812" V 7354 2450 50  0001 C CNN
F 1 "22" V 7550 2450 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2450 50  0001 C CNN
F 3 "" H 7550 2450 50  0001 C CNN
	1    7550 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2450 7800 2450
$Comp
L My68k:R R813
U 1 1 611A5EC3
P 7550 2550
F 0 "R813" V 7354 2550 50  0001 C CNN
F 1 "22" V 7550 2550 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2550 50  0001 C CNN
F 3 "" H 7550 2550 50  0001 C CNN
	1    7550 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2550 7800 2550
$Comp
L My68k:R R814
U 1 1 611A665E
P 7550 2650
F 0 "R814" V 7354 2650 50  0001 C CNN
F 1 "22" V 7550 2650 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2650 50  0001 C CNN
F 3 "" H 7550 2650 50  0001 C CNN
	1    7550 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2650 7800 2650
$Comp
L My68k:R R815
U 1 1 611A6BE1
P 7550 2750
F 0 "R815" V 7354 2750 50  0001 C CNN
F 1 "22" V 7550 2750 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2750 50  0001 C CNN
F 3 "" H 7550 2750 50  0001 C CNN
	1    7550 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2750 7800 2750
$Comp
L My68k:R R816
U 1 1 611A73CC
P 7550 2850
F 0 "R816" V 7354 2850 50  0001 C CNN
F 1 "22" V 7550 2850 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2850 50  0001 C CNN
F 3 "" H 7550 2850 50  0001 C CNN
	1    7550 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2850 7800 2850
$Comp
L My68k:R R817
U 1 1 611A7987
P 7550 2950
F 0 "R817" V 7354 2950 50  0001 C CNN
F 1 "22" V 7550 2950 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 2950 50  0001 C CNN
F 3 "" H 7550 2950 50  0001 C CNN
	1    7550 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 2950 7800 2950
$Comp
L My68k:R R818
U 1 1 611A81C2
P 7550 3050
F 0 "R818" V 7354 3050 50  0001 C CNN
F 1 "22" V 7550 3050 39  0000 C CNN
F 2 "My68k:R_0805" H 7550 3050 50  0001 C CNN
F 3 "" H 7550 3050 50  0001 C CNN
	1    7550 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3050 7800 3050
Text Notes 3800 2300 0    39   ~ 0
R801-808
Text Notes 7400 2300 0    39   ~ 0
R811-818
Wire Wire Line
	5500 2250 5150 2250
Wire Wire Line
	5300 4250 5300 2000
Wire Wire Line
	4050 3050 5500 3050
Wire Wire Line
	4050 2550 5500 2550
Wire Wire Line
	4050 2350 5500 2350
Wire Wire Line
	5500 2450 4050 2450
Wire Wire Line
	6000 3650 6100 3650
Connection ~ 6100 3650
Wire Wire Line
	6000 4150 6100 4150
Wire Wire Line
	6000 4250 6200 4250
Wire Wire Line
	6000 2650 7450 2650
Wire Wire Line
	6000 2750 7450 2750
Wire Wire Line
	6000 2850 7450 2850
Wire Wire Line
	6000 2950 7450 2950
Wire Wire Line
	6000 3050 7450 3050
Wire Wire Line
	6000 3250 6100 3250
Wire Wire Line
	6000 2350 7450 2350
Wire Wire Line
	6100 3350 6000 3350
Wire Wire Line
	7450 2450 6000 2450
Wire Wire Line
	6000 2550 7450 2550
Wire Wire Line
	3750 4350 3700 4350
$Comp
L power:+5V #PWR?
U 1 1 6211674D
P 3700 4350
F 0 "#PWR?" H 3700 4200 50  0001 C CNN
F 1 "+5V" V 3700 4550 50  0000 C CNN
F 2 "" H 3700 4350 50  0001 C CNN
F 3 "" H 3700 4350 50  0001 C CNN
	1    3700 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 3150 5500 3150
Wire Wire Line
	4150 3350 5500 3350
Wire Wire Line
	4150 3450 5500 3450
Wire Wire Line
	4150 3550 4750 3550
Wire Wire Line
	4150 3750 4450 3750
Wire Wire Line
	5400 3150 5400 4350
Wire Wire Line
	5300 4250 5500 4250
Wire Wire Line
	5400 4350 5500 4350
Connection ~ 5400 4350
Wire Wire Line
	5400 4350 5400 4450
Wire Wire Line
	4300 4150 4300 4350
Wire Wire Line
	4300 4350 4200 4350
Wire Wire Line
	6000 2250 6100 2250
Wire Wire Line
	6100 2250 6100 3250
Connection ~ 6100 3250
Wire Wire Line
	6100 3250 6100 3350
Connection ~ 6100 3350
Wire Wire Line
	6100 3350 6100 3450
Connection ~ 6100 3450
Wire Wire Line
	6100 3450 6100 3650
Wire Wire Line
	5500 3850 5100 3850
Wire Wire Line
	5500 4150 4300 4150
Wire Wire Line
	6200 2000 6200 4250
Wire Wire Line
	6100 3650 6100 4150
Connection ~ 6100 4150
Wire Wire Line
	6100 4150 6100 4450
NoConn ~ 6000 3850
Wire Wire Line
	6000 3950 6300 3950
Wire Wire Line
	6300 3950 6300 4650
Wire Wire Line
	6300 4650 5100 4650
NoConn ~ 6000 4350
Connection ~ 4750 3550
Wire Wire Line
	4750 3550 5500 3550
Connection ~ 4450 3750
Wire Wire Line
	4450 3750 5500 3750
Wire Wire Line
	4150 4050 5500 4050
Wire Bus Line
	5000 3950 5000 4800
Wire Bus Line
	9100 2150 9100 2950
Wire Bus Line
	2350 2150 2350 2950
$EndSCHEMATC
