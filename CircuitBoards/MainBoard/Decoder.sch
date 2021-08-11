EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 10
Title "My68k - MainBoard, Decoder"
Date "2021-08-11"
Rev "1.0"
Comp ""
Comment1 "Kenneth Keeley"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4700 6750 4700 6850
Wire Wire Line
	4700 6850 4800 6850
Wire Wire Line
	4800 6750 4800 6850
Connection ~ 4800 6850
Wire Wire Line
	5300 6750 5300 6850
Wire Wire Line
	4900 6750 4900 6850
Connection ~ 4900 6850
Wire Wire Line
	5200 6750 5200 6850
Connection ~ 5200 6850
Wire Wire Line
	5000 6750 5000 6850
Connection ~ 5000 6850
Wire Wire Line
	5100 6750 5100 6850
Connection ~ 5100 6850
Wire Wire Line
	4700 1250 4700 1150
Wire Wire Line
	4700 1150 4800 1150
Wire Wire Line
	5300 1150 5300 1250
Wire Wire Line
	4800 1250 4800 1150
Connection ~ 4800 1150
Wire Wire Line
	4900 1250 4900 1150
Connection ~ 4900 1150
Wire Wire Line
	5200 1250 5200 1150
Connection ~ 5200 1150
Wire Wire Line
	5100 1250 5100 1150
Connection ~ 5100 1150
Connection ~ 5000 1150
$Comp
L power:+5V #PWR09
U 1 1 5B74048C
P 8850 5800
F 0 "#PWR09" H 8850 5650 50  0001 C CNN
F 1 "+5V" H 8850 5940 50  0000 C CNN
F 2 "" H 8850 5800 50  0001 C CNN
F 3 "" H 8850 5800 50  0001 C CNN
	1    8850 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5B7404B4
P 5050 6950
F 0 "#PWR010" H 5050 6700 50  0001 C CNN
F 1 "GND" H 5050 6800 50  0001 C CNN
F 2 "" H 5050 6950 50  0001 C CNN
F 3 "" H 5050 6950 50  0001 C CNN
	1    5050 6950
	1    0    0    -1  
$EndComp
Text GLabel 3900 1800 0    50   Input ~ 0
nBGACK
Text GLabel 3900 1900 0    50   Input ~ 0
nBR
Text GLabel 3900 2000 0    50   Output ~ 0
nBG_CPU
Text GLabel 3900 2200 0    50   Output ~ 0
nCS_RAM
Text GLabel 3900 2300 0    50   Output ~ 0
nCS_ROM
Text GLabel 3900 2400 0    50   Output ~ 0
nCS_FPU
Text GLabel 3900 1700 0    50   Output ~ 0
nCS_DUART
Text GLabel 3900 6100 0    50   Input ~ 0
nReset
Text GLabel 9250 1350 2    50   Input ~ 0
A[0..31]
Text GLabel 3900 2800 0    50   Input ~ 0
FC0
Text GLabel 3900 2900 0    50   Input ~ 0
FC1
Text GLabel 3900 3000 0    50   Input ~ 0
FC2
Text GLabel 3900 3100 0    50   Output ~ 0
nDSACK0
Text GLabel 3900 3300 0    50   Input ~ 0
nWR
Text GLabel 3900 6000 0    50   Input ~ 0
CLK
Text HLabel 3900 4400 0    50   Output ~ 0
nIACKOUT
Text Label 6150 1700 0    50   ~ 0
A0
Text Label 6150 1800 0    50   ~ 0
A1
Text Label 6150 1900 0    50   ~ 0
A2
Text Label 6150 3400 0    50   ~ 0
A16
Text Label 6150 3500 0    50   ~ 0
A17
Text Label 6150 2100 0    50   ~ 0
A4
Text Label 6150 2200 0    50   ~ 0
A5
Text Label 6150 2300 0    50   ~ 0
A6
Text Label 6150 2400 0    50   ~ 0
A7
Text Label 6150 3100 0    50   ~ 0
A13
Text Label 6150 3200 0    50   ~ 0
A14
Text Label 6150 3300 0    50   ~ 0
A15
Text Label 6150 2900 0    50   ~ 0
A11
Text Label 6150 2800 0    50   ~ 0
A10
Text Label 6150 2600 0    50   ~ 0
A9
Entry Wire Line
	6350 1800 6450 1700
Entry Wire Line
	6350 1900 6450 1800
Entry Wire Line
	6350 2000 6450 1900
Entry Wire Line
	6350 2100 6450 2000
Entry Wire Line
	6350 2200 6450 2100
Entry Wire Line
	6350 2300 6450 2200
Entry Wire Line
	6350 2400 6450 2300
Entry Wire Line
	6350 2500 6450 2400
Entry Wire Line
	6350 2800 6450 2700
Entry Wire Line
	6350 3100 6450 3000
Entry Wire Line
	6350 3200 6450 3100
Entry Wire Line
	6350 3300 6450 3200
Entry Wire Line
	6350 3400 6450 3300
Entry Wire Line
	6350 3500 6450 3400
Wire Bus Line
	6450 1400 6500 1350
Wire Bus Line
	6500 1350 8550 1350
Wire Wire Line
	6050 1800 6350 1800
Wire Wire Line
	6050 1900 6350 1900
Wire Wire Line
	6050 2000 6350 2000
Wire Wire Line
	6050 2100 6350 2100
Wire Wire Line
	6050 2200 6350 2200
Wire Wire Line
	6050 2300 6350 2300
Wire Wire Line
	6050 2400 6350 2400
Wire Wire Line
	6050 2500 6350 2500
Wire Wire Line
	6050 2800 6350 2800
Wire Wire Line
	6050 3000 6350 3000
Wire Wire Line
	6050 3100 6350 3100
Wire Wire Line
	6050 3200 6350 3200
Wire Wire Line
	6050 3300 6350 3300
Wire Wire Line
	6050 3400 6350 3400
Wire Wire Line
	6050 2600 6350 2600
Wire Wire Line
	6050 1700 6350 1700
Wire Wire Line
	6050 3500 6350 3500
Wire Wire Line
	3900 1800 4050 1800
Wire Wire Line
	3900 1900 4050 1900
Wire Wire Line
	3900 2000 4050 2000
Wire Wire Line
	3900 2100 4050 2100
Wire Wire Line
	3900 2200 4050 2200
Wire Wire Line
	3900 2300 4050 2300
Wire Wire Line
	3900 2400 4050 2400
Wire Wire Line
	3900 2500 4050 2500
Wire Wire Line
	3900 2800 4050 2800
Wire Wire Line
	3900 2900 4050 2900
Wire Wire Line
	3900 3000 4050 3000
Wire Wire Line
	3900 3100 4050 3100
Wire Wire Line
	3900 3200 4050 3200
Wire Wire Line
	3900 6000 4050 6000
Text GLabel 3900 5600 0    50   Output ~ 0
nRD
Text GLabel 3900 4200 0    50   Output ~ 0
nBERR
Text GLabel 3900 4100 0    50   Input ~ 0
nAS
Text GLabel 6650 4800 2    50   Output ~ 0
D[0..31]
Wire Wire Line
	3900 4400 4050 4400
Wire Wire Line
	3900 3900 4050 3900
Wire Wire Line
	3900 4100 4050 4100
Wire Wire Line
	3900 4200 4050 4200
Text GLabel 3900 3900 0    50   Output ~ 0
nIRQ6
Wire Wire Line
	4800 6850 4900 6850
Wire Wire Line
	4900 6850 5000 6850
Wire Wire Line
	5200 6850 5300 6850
Wire Wire Line
	5100 6850 5200 6850
Wire Wire Line
	4800 1150 4900 1150
Wire Wire Line
	4900 1150 5000 1150
Wire Wire Line
	5200 1150 5300 1150
Wire Wire Line
	5100 1150 5200 1150
Wire Wire Line
	5000 1150 5000 1250
Wire Wire Line
	5000 1150 5050 1150
Wire Wire Line
	5000 6850 5050 6850
Wire Wire Line
	5400 1250 5400 1150
Wire Wire Line
	5400 1150 5300 1150
Connection ~ 5300 1150
Wire Wire Line
	5050 1050 5050 1150
Connection ~ 5050 1150
Wire Wire Line
	5050 1150 5100 1150
NoConn ~ 4050 4500
Text GLabel 3900 3200 0    50   Output ~ 0
nDSACK1
Wire Wire Line
	3900 3300 4050 3300
$Comp
L power:GND #PWR0129
U 1 1 5CA8534D
P 3950 6400
F 0 "#PWR0129" H 3950 6150 50  0001 C CNN
F 1 "GND" H 3955 6227 50  0001 C CNN
F 2 "" H 3950 6400 50  0001 C CNN
F 3 "" H 3950 6400 50  0001 C CNN
	1    3950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6750 5400 6850
Wire Wire Line
	5400 6850 5300 6850
Connection ~ 5300 6850
Wire Wire Line
	5050 6950 5050 6850
Connection ~ 5050 6850
Wire Wire Line
	5050 6850 5100 6850
Wire Wire Line
	4050 6200 3950 6200
Wire Wire Line
	3950 6200 3950 6300
Wire Wire Line
	6050 2900 6350 2900
Entry Wire Line
	6350 3000 6450 2900
Entry Wire Line
	6350 2900 6450 2800
Text Label 6150 3000 0    50   ~ 0
A12
Text Label 6150 2500 0    50   ~ 0
A8
$Comp
L My68k:JTAG-10 J401
U 1 1 5ADF0692
P 9300 6100
AR Path="/5ADF0692" Ref="J401"  Part="1" 
AR Path="/5ADF03DA/5ADF0692" Ref="J401"  Part="1" 
F 0 "J401" H 9550 6550 50  0000 R CNN
F 1 "JTAG-10" V 9100 6250 50  0000 R CNN
F 2 "My68k:HDR2x5" V 9150 6250 50  0001 C CNN
F 3 "" H 8025 5550 50  0001 C CNN
	1    9300 6100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9300 6650 9300 6600
$Comp
L power:GND #PWR011
U 1 1 5B740518
P 9300 6650
F 0 "#PWR011" H 9300 6400 50  0001 C CNN
F 1 "GND" H 9300 6500 50  0001 C CNN
F 2 "" H 9300 6650 50  0001 C CNN
F 3 "" H 9300 6650 50  0001 C CNN
	1    9300 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5900 8900 5900
Wire Wire Line
	6050 6000 8900 6000
$Comp
L My68k:Decoder U401
U 1 1 5ADF0464
P 5050 3950
AR Path="/5ADF0464" Ref="U401"  Part="1" 
AR Path="/5ADF03DA/5ADF0464" Ref="U401"  Part="1" 
F 0 "U401" H 5050 4000 50  0000 C CNN
F 1 "EPM7128SQC100" H 5050 3900 50  0000 C CNN
F 2 "My68k:PQFP-100" H 5050 4100 50  0001 C CNN
F 3 "" H 5050 3950 60  0001 C CNN
	1    5050 3950
	1    0    0    -1  
$EndComp
NoConn ~ 6050 4900
NoConn ~ 4050 4000
Wire Wire Line
	4050 4800 3900 4800
Wire Wire Line
	3900 4900 4050 4900
Wire Wire Line
	3900 5000 4050 5000
Wire Wire Line
	3900 5100 4050 5100
Text HLabel 3900 2100 0    50   Output ~ 0
nBGOUT
$Comp
L power:+5V #PWR0101
U 1 1 610A24DA
P 5050 1050
F 0 "#PWR0101" H 5050 900 50  0001 C CNN
F 1 "+5V" H 5065 1223 50  0000 C CNN
F 2 "" H 5050 1050 50  0001 C CNN
F 3 "" H 5050 1050 50  0001 C CNN
	1    5050 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6100 4050 6100
Wire Wire Line
	3900 5700 4050 5700
Text GLabel 3900 5200 0    50   Output ~ 0
nCS_ATA0
Text GLabel 3900 5300 0    50   Output ~ 0
nCS_ATA1
Text GLabel 3900 5500 0    50   Input ~ 0
DTACK_ATA
Wire Wire Line
	4050 5200 3900 5200
Wire Wire Line
	3900 5300 4050 5300
Wire Wire Line
	3900 5400 4050 5400
Wire Wire Line
	3900 5500 4050 5500
Wire Wire Line
	3900 5600 4050 5600
Text GLabel 3900 5400 0    50   Output ~ 0
nCS_ATA
Text GLabel 3900 5700 0    50   Output ~ 0
nIACK_DUART
Text GLabel 3900 3600 0    50   Input ~ 0
IRQ_ATA
Text GLabel 3900 3800 0    50   Output ~ 0
nIRQ4
Wire Wire Line
	4050 3600 3900 3600
Text GLabel 3900 4900 0    50   Output ~ 0
nCS_RTC
Text GLabel 3900 5000 0    50   Output ~ 0
AS_RTC
Text GLabel 3900 5100 0    50   Output ~ 0
DS_RTC
Text GLabel 3900 4800 0    50   Output ~ 0
nCS_PS2
Text GLabel 3900 3400 0    50   Input ~ 0
IRQ_K
Text GLabel 3900 3500 0    50   Input ~ 0
IRQ_M
Text GLabel 3900 2500 0    50   Output ~ 0
PS2_CLK
Wire Wire Line
	3900 1700 4050 1700
Wire Wire Line
	4050 6300 3950 6300
Wire Wire Line
	3950 6400 3950 6300
Connection ~ 3950 6300
Text GLabel 3900 2600 0    50   Output ~ 0
CPU_CLK
Wire Wire Line
	3900 2600 4050 2600
Text GLabel 3900 4600 0    50   Output ~ 0
nPS_Off
Wire Wire Line
	4050 4600 3900 4600
$Comp
L My68k:74HCT30 U402
U 1 1 61247ECA
P 7800 3450
F 0 "U402" H 8000 3600 50  0000 C CNN
F 1 "74HCT30" H 8000 3250 50  0000 C CNN
F 2 "My68k:SOIC-14" H 7800 3450 50  0001 C CNN
F 3 "" H 7800 3450 50  0001 C CNN
	1    7800 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0187
U 1 1 6124A866
P 7850 3850
F 0 "#PWR0187" H 7850 3600 50  0001 C CNN
F 1 "GND" H 7855 3677 50  0000 C CNN
F 2 "" H 7850 3850 50  0001 C CNN
F 3 "" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0188
U 1 1 6124B041
P 7750 3050
F 0 "#PWR0188" H 7750 2900 50  0001 C CNN
F 1 "+5V" H 7765 3223 50  0000 C CNN
F 2 "" H 7750 3050 50  0001 C CNN
F 3 "" H 7750 3050 50  0001 C CNN
	1    7750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3100 7750 3050
Wire Wire Line
	7850 3800 7850 3850
Text Label 8200 3550 0    50   ~ 0
A28
Text Label 8200 3650 0    50   ~ 0
A29
Text Label 8200 3750 0    50   ~ 0
A30
Text Label 8200 3850 0    50   ~ 0
A31
Entry Wire Line
	8400 3550 8500 3450
Entry Wire Line
	8400 3650 8500 3550
Entry Wire Line
	8400 3750 8500 3650
Entry Wire Line
	8400 3850 8500 3750
Wire Wire Line
	8100 3550 8400 3550
Wire Wire Line
	8100 3650 8400 3650
Wire Wire Line
	8100 3750 8400 3750
Wire Wire Line
	8100 3850 8400 3850
Text Label 8200 3150 0    50   ~ 0
A24
Text Label 8200 3250 0    50   ~ 0
A25
Text Label 8200 3350 0    50   ~ 0
A26
Text Label 8200 3450 0    50   ~ 0
A27
Entry Wire Line
	8400 3150 8500 3050
Entry Wire Line
	8400 3250 8500 3150
Entry Wire Line
	8400 3350 8500 3250
Entry Wire Line
	8400 3450 8500 3350
Wire Wire Line
	8100 3150 8400 3150
Wire Wire Line
	8100 3250 8400 3250
Wire Wire Line
	8100 3350 8400 3350
Wire Wire Line
	8100 3450 8400 3450
Text Label 6150 3900 0    50   ~ 0
A20
Text Label 6150 4000 0    50   ~ 0
A21
Text Label 6150 4100 0    50   ~ 0
A22
Text Label 6150 4200 0    50   ~ 0
A23
Entry Wire Line
	6350 3900 6450 3800
Entry Wire Line
	6350 4000 6450 3900
Entry Wire Line
	6350 4100 6450 4000
Entry Wire Line
	6350 4200 6450 4100
Wire Wire Line
	6050 3900 6350 3900
Wire Wire Line
	6050 4000 6350 4000
Wire Wire Line
	6050 4100 6350 4100
Wire Wire Line
	6050 4200 6350 4200
Text Label 6150 3600 0    50   ~ 0
A18
Text Label 6150 3800 0    50   ~ 0
A19
Entry Wire Line
	6350 3600 6450 3500
Wire Wire Line
	6050 3800 6350 3800
Wire Wire Line
	6050 3600 6350 3600
Text Label 6150 2000 0    50   ~ 0
A3
Entry Wire Line
	6350 1700 6450 1600
Entry Wire Line
	6350 2600 6450 2500
Wire Bus Line
	8500 1400 8550 1350
Connection ~ 8550 1350
Wire Bus Line
	8550 1350 9250 1350
Wire Wire Line
	7100 3450 7500 3450
Wire Wire Line
	3900 3400 4050 3400
Wire Wire Line
	3900 3500 4050 3500
Wire Wire Line
	3900 3800 4050 3800
Entry Wire Line
	6350 3800 6450 3700
Wire Wire Line
	6050 4300 7100 4300
Wire Wire Line
	7100 4300 7100 3450
Wire Wire Line
	8850 5800 8850 5900
Text Label 6150 5000 0    50   ~ 0
D24
Text Label 6150 5100 0    50   ~ 0
D25
Entry Wire Line
	6350 5000 6450 4900
Entry Wire Line
	6350 5100 6450 5000
Wire Wire Line
	6050 5000 6350 5000
Wire Wire Line
	6050 5100 6350 5100
Text Label 6150 5400 0    50   ~ 0
D28
Text Label 6150 5500 0    50   ~ 0
D29
Text Label 6150 5600 0    50   ~ 0
D30
Text Label 6150 5700 0    50   ~ 0
D31
Entry Wire Line
	6350 5400 6450 5300
Entry Wire Line
	6350 5500 6450 5400
Entry Wire Line
	6350 5600 6450 5500
Entry Wire Line
	6350 5700 6450 5600
Wire Wire Line
	6050 5400 6350 5400
Wire Wire Line
	6050 5500 6350 5500
Wire Wire Line
	6050 5600 6350 5600
Wire Wire Line
	6050 5700 6350 5700
Text Label 6150 5200 0    50   ~ 0
D26
Text Label 6150 5300 0    50   ~ 0
D27
Entry Wire Line
	6350 5200 6450 5100
Wire Wire Line
	6050 5300 6350 5300
Wire Wire Line
	6050 5200 6350 5200
Entry Wire Line
	6350 5300 6450 5200
Wire Bus Line
	6450 4900 6500 4800
Wire Bus Line
	6500 4800 6650 4800
Wire Wire Line
	6200 4400 6050 4400
Wire Wire Line
	6050 4500 6200 4500
Text HLabel 6200 4400 2    50   Output ~ 0
nID1
Text HLabel 6200 4500 2    50   Output ~ 0
nID2
NoConn ~ 4050 4300
Wire Wire Line
	6050 6300 6450 6300
Wire Wire Line
	8550 6300 8900 6300
Text GLabel 8550 6300 0    50   Input ~ 0
DRAM_TDO
Text GLabel 6450 6300 2    50   Output ~ 0
DEC_TDO
Wire Wire Line
	7400 6200 8900 6200
Wire Wire Line
	6050 6200 7400 6200
Connection ~ 7400 6200
Wire Wire Line
	7400 6400 7400 6200
Text GLabel 7400 6400 3    50   Output ~ 0
TCK
Text GLabel 7200 6400 3    50   Output ~ 0
TMS
Wire Wire Line
	7200 6100 8900 6100
Wire Wire Line
	6050 6100 7200 6100
Connection ~ 7200 6100
Wire Wire Line
	7200 6400 7200 6100
NoConn ~ 6050 4600
NoConn ~ 6050 4800
Wire Bus Line
	8500 1400 8500 3750
Wire Bus Line
	6450 4900 6450 5600
Wire Bus Line
	6450 1400 6450 4100
$EndSCHEMATC
