EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "My68k - MainBoard"
Date "2021-08-03"
Rev "1.0"
Comp ""
Comment1 "Kenneth Keeley"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5600 5800 1000 650 
U 61077BCB
F0 "Expansion Slot 1" 50
F1 "ExpansionSlot.sch" 50
F2 "nIACKIN" I L 5600 5950 50 
F3 "nBGIN" I L 5600 6150 50 
F4 "nIACKOUT" O R 6600 5950 50 
F5 "nBGOUT" O R 6600 6150 50 
F6 "nID" I L 5600 6350 50 
$EndSheet
$Sheet
S 7100 5800 1000 650 
U 61077C81
F0 "Expansion Slot 2" 50
F1 "ExpansionSlot.sch" 50
F2 "nIACKIN" I L 7100 5950 50 
F3 "nBGIN" I L 7100 6150 50 
F4 "nIACKOUT" O R 8100 5950 50 
F5 "nBGOUT" O R 8100 6150 50 
F6 "nID" I L 7100 6350 50 
$EndSheet
$Sheet
S 7350 2200 1000 650 
U 5E5CD421
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
$Comp
L My68k:Mounting_Hole_M3 MH1
U 1 1 5E55EBC1
P 5350 7400
F 0 "MH1" H 5350 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 5350 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 5800 7400 50  0001 C CNN
F 3 "" H 5800 7400 50  0001 C CNN
	1    5350 7400
	1    0    0    -1  
$EndComp
$Comp
L My68k:Mounting_Hole_M3 MH2
U 1 1 5E55F285
P 5550 7400
F 0 "MH2" H 5550 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 5550 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 6000 7400 50  0001 C CNN
F 3 "" H 6000 7400 50  0001 C CNN
	1    5550 7400
	1    0    0    -1  
$EndComp
$Comp
L My68k:Mounting_Hole_M3 MH3
U 1 1 5E5631EB
P 5750 7400
F 0 "MH3" H 5750 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 5750 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 6200 7400 50  0001 C CNN
F 3 "" H 6200 7400 50  0001 C CNN
	1    5750 7400
	1    0    0    -1  
$EndComp
$Comp
L My68k:Mounting_Hole_M3 MH4
U 1 1 5E567191
P 5950 7400
F 0 "MH4" H 5950 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 5950 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 6400 7400 50  0001 C CNN
F 3 "" H 6400 7400 50  0001 C CNN
	1    5950 7400
	1    0    0    -1  
$EndComp
$Comp
L My68k:Mounting_Hole_M3 MH5
U 1 1 5E56B121
P 6150 7400
F 0 "MH5" H 6150 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 6150 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 6600 7400 50  0001 C CNN
F 3 "" H 6600 7400 50  0001 C CNN
	1    6150 7400
	1    0    0    -1  
$EndComp
$Comp
L My68k:Mounting_Hole_M3 MH6
U 1 1 5E56F1B9
P 6350 7400
F 0 "MH6" H 6350 7300 50  0001 C CNN
F 1 "Mounting_Hole_M3" H 6350 7550 50  0001 C CNN
F 2 "My68k:Mounting_Hole_M3" H 6800 7400 50  0001 C CNN
F 3 "" H 6800 7400 50  0001 C CNN
	1    6350 7400
	1    0    0    -1  
$EndComp
Wire Notes Line
	4600 7200 7100 7200
Wire Notes Line
	4600 7550 4600 7200
Wire Notes Line
	7100 7200 7100 7550
Wire Notes Line
	7100 7550 4600 7550
Text Notes 5450 7300 0    50   ~ 0
Board Mounting Holes
NoConn ~ 8100 5950
NoConn ~ 8100 6150
NoConn ~ 7100 5950
NoConn ~ 7100 6150
NoConn ~ 7100 6350
NoConn ~ 6600 5950
NoConn ~ 6600 6150
NoConn ~ 5600 5950
NoConn ~ 5600 6150
NoConn ~ 5600 6350
$EndSCHEMATC
