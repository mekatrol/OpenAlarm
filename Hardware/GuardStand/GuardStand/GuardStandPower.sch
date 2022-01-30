EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Regulator_Linear:LM317_TO-220 U1
U 1 1 61F6426D
P 3100 1800
F 0 "U1" H 3100 2042 50  0000 C CNN
F 1 "LM317_TO-220" H 3100 1951 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3100 2050 50  0001 C CIN
F 3 "" H 3100 1800 50  0001 C CNN
	1    3100 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 61F6505E
P 3850 2050
F 0 "R3" H 3909 2096 50  0000 L CNN
F 1 "240R" H 3909 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 3850 2050 50  0001 C CNN
F 3 "~" H 3850 2050 50  0001 C CNN
	1    3850 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 61F662AF
P 3850 2750
F 0 "R4" H 3909 2796 50  0000 L CNN
F 1 "2k32" H 3909 2705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 3850 2750 50  0001 C CNN
F 3 "~" H 3850 2750 50  0001 C CNN
	1    3850 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D1
U 1 1 61F6697F
P 3100 1350
F 0 "D1" H 3100 1557 50  0000 C CNN
F 1 "1N4002" H 3100 1466 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" V 3100 1350 50  0001 C CNN
F 3 "~" V 3100 1350 50  0001 C CNN
	1    3100 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D3
U 1 1 61F6719D
P 3550 2100
F 0 "D3" V 3550 1950 50  0000 L CNN
F 1 "1N4002" V 3650 1750 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" V 3550 2100 50  0001 C CNN
F 3 "~" V 3550 2100 50  0001 C CNN
	1    3550 2100
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61F67CF3
P 4750 2400
F 0 "C7" H 4842 2446 50  0000 L CNN
F 1 "100n" H 4842 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 4750 2400 50  0001 C CNN
F 3 "~" H 4750 2400 50  0001 C CNN
	1    4750 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 61F68385
P 2850 2600
F 0 "C5" H 2942 2646 50  0000 L CNN
F 1 "100n" H 2942 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2850 2600 50  0001 C CNN
F 3 "~" H 2850 2600 50  0001 C CNN
	1    2850 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 61F689E7
P 1700 2150
F 0 "C1" H 1792 2196 50  0000 L CNN
F 1 "100u" H 1792 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D12.5mm_H25.0mm_P5.00mm" H 1700 2150 50  0001 C CNN
F 3 "~" H 1700 2150 50  0001 C CNN
	1    1700 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 61F69046
P 2100 2150
F 0 "C3" H 2192 2196 50  0000 L CNN
F 1 "100n" H 2192 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2100 2150 50  0001 C CNN
F 3 "~" H 2100 2150 50  0001 C CNN
	1    2100 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV1
U 1 1 61F6975E
P 3850 2400
F 0 "RV1" H 3780 2354 50  0000 R CNN
F 1 "500R" H 3780 2445 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 3850 2400 50  0001 C CNN
F 3 "~" H 3850 2400 50  0001 C CNN
	1    3850 2400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61F6B9C7
P 3600 3000
F 0 "#PWR03" H 3600 2750 50  0001 C CNN
F 1 "GND" H 3605 2827 50  0000 C CNN
F 2 "" H 3600 3000 50  0001 C CNN
F 3 "" H 3600 3000 50  0001 C CNN
	1    3600 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1800 3550 1800
Wire Wire Line
	4400 1800 4400 1400
Connection ~ 3550 1800
Wire Wire Line
	4750 1800 4400 1800
Connection ~ 4400 1800
$Comp
L power:+15V #PWR01
U 1 1 61F6DC17
P 1000 1150
F 0 "#PWR01" H 1000 1000 50  0001 C CNN
F 1 "+15V" H 1015 1323 50  0000 C CNN
F 2 "" H 1000 1150 50  0001 C CNN
F 3 "" H 1000 1150 50  0001 C CNN
	1    1000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1150 1000 1800
Wire Wire Line
	3000 1350 2500 1350
Wire Wire Line
	2500 1350 2500 1800
Connection ~ 2500 1800
Wire Wire Line
	2500 1800 2800 1800
Wire Wire Line
	3550 1800 3550 1350
Wire Wire Line
	3550 1350 3200 1350
Wire Wire Line
	1700 2050 1700 1800
Connection ~ 1700 1800
Wire Wire Line
	1700 2250 1700 2350
Wire Wire Line
	3100 2100 3100 2400
Wire Wire Line
	3100 2400 2850 2400
Wire Wire Line
	2850 2400 2850 2500
Wire Wire Line
	2850 2700 2850 3000
Connection ~ 2850 3000
Wire Wire Line
	4750 3000 4750 2500
Wire Wire Line
	4750 2300 4750 1800
Wire Wire Line
	3550 1800 3850 1800
Wire Wire Line
	3100 2400 3550 2400
Connection ~ 3100 2400
Wire Wire Line
	3550 2000 3550 1800
Wire Wire Line
	3550 2200 3550 2400
Connection ~ 3550 2400
Wire Wire Line
	3550 2400 3700 2400
Wire Wire Line
	3850 1950 3850 1800
Connection ~ 3850 1800
Wire Wire Line
	3850 1800 4400 1800
Wire Wire Line
	3850 2150 3850 2250
Wire Wire Line
	3850 2550 3850 2650
Wire Wire Line
	3850 2850 3850 3000
Connection ~ 3850 3000
Wire Wire Line
	3850 3000 4750 3000
$Comp
L power:+BATT #PWR04
U 1 1 61F78CDB
P 4400 1400
F 0 "#PWR04" H 4400 1250 50  0001 C CNN
F 1 "+BATT" H 4415 1573 50  0000 C CNN
F 2 "" H 4400 1400 50  0001 C CNN
F 3 "" H 4400 1400 50  0001 C CNN
	1    4400 1400
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM317_TO-220 U2
U 1 1 61F85D64
P 3100 4350
F 0 "U2" H 3100 4592 50  0000 C CNN
F 1 "LM317_TO-220" H 3100 4501 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3100 4600 50  0001 C CIN
F 3 "" H 3100 4350 50  0001 C CNN
	1    3100 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 61F85D6A
P 3850 4600
F 0 "R5" H 3909 4646 50  0000 L CNN
F 1 "240R" H 3909 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 3850 4600 50  0001 C CNN
F 3 "~" H 3850 4600 50  0001 C CNN
	1    3850 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 61F85D70
P 3850 5300
F 0 "R6" H 3909 5346 50  0000 L CNN
F 1 "2k1" H 3909 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 3850 5300 50  0001 C CNN
F 3 "~" H 3850 5300 50  0001 C CNN
	1    3850 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D2
U 1 1 61F85D76
P 3100 3900
F 0 "D2" H 3100 4107 50  0000 C CNN
F 1 "1N4002" H 3100 4016 50  0000 C CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" V 3100 3900 50  0001 C CNN
F 3 "~" V 3100 3900 50  0001 C CNN
	1    3100 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D4
U 1 1 61F85D7C
P 3550 4650
F 0 "D4" V 3550 4500 50  0000 L CNN
F 1 "1N4002" V 3650 4300 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" V 3550 4650 50  0001 C CNN
F 3 "~" V 3550 4650 50  0001 C CNN
	1    3550 4650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 61F85D82
P 4750 4950
F 0 "C8" H 4842 4996 50  0000 L CNN
F 1 "100n" H 4842 4905 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 4750 4950 50  0001 C CNN
F 3 "~" H 4750 4950 50  0001 C CNN
	1    4750 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 61F85D88
P 2850 5150
F 0 "C6" H 2942 5196 50  0000 L CNN
F 1 "100n" H 2942 5105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2850 5150 50  0001 C CNN
F 3 "~" H 2850 5150 50  0001 C CNN
	1    2850 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61F85D8E
P 1700 4700
F 0 "C2" H 1792 4746 50  0000 L CNN
F 1 "100u" H 1792 4655 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D12.5mm_H25.0mm_P5.00mm" H 1700 4700 50  0001 C CNN
F 3 "~" H 1700 4700 50  0001 C CNN
	1    1700 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61F85D94
P 2300 4700
F 0 "C4" H 2392 4746 50  0000 L CNN
F 1 "100n" H 2392 4655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 2300 4700 50  0001 C CNN
F 3 "~" H 2300 4700 50  0001 C CNN
	1    2300 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV2
U 1 1 61F85D9A
P 3850 4950
F 0 "RV2" H 3780 4904 50  0000 R CNN
F 1 "500R" H 3780 4995 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 3850 4950 50  0001 C CNN
F 3 "~" H 3850 4950 50  0001 C CNN
	1    3850 4950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61F85DA0
P 3550 5550
F 0 "#PWR02" H 3550 5300 50  0001 C CNN
F 1 "GND" H 3555 5377 50  0000 C CNN
F 2 "" H 3550 5550 50  0001 C CNN
F 3 "" H 3550 5550 50  0001 C CNN
	1    3550 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4350 3550 4350
Wire Wire Line
	4400 4350 4400 3950
Connection ~ 3550 4350
Wire Wire Line
	4750 4350 4400 4350
Connection ~ 4400 4350
Wire Wire Line
	3000 3900 2500 3900
Wire Wire Line
	2500 3900 2500 4350
Connection ~ 2500 4350
Wire Wire Line
	2500 4350 2800 4350
Wire Wire Line
	3550 4350 3550 3900
Wire Wire Line
	3550 3900 3200 3900
Wire Wire Line
	2300 4600 2300 4350
Connection ~ 2300 4350
Wire Wire Line
	2300 4350 2500 4350
Wire Wire Line
	1700 4600 1700 4350
Connection ~ 1700 4350
Wire Wire Line
	1700 4350 2300 4350
Wire Wire Line
	1700 4800 1700 4850
Wire Wire Line
	3100 4650 3100 4950
Wire Wire Line
	3100 4950 2850 4950
Wire Wire Line
	2850 4950 2850 5050
Wire Wire Line
	2850 5250 2850 5550
Connection ~ 2850 5550
Wire Wire Line
	4750 5550 4750 5050
Wire Wire Line
	4750 4850 4750 4350
Wire Wire Line
	3550 4350 3850 4350
Wire Wire Line
	3100 4950 3550 4950
Connection ~ 3100 4950
Wire Wire Line
	3550 4550 3550 4350
Wire Wire Line
	3550 4750 3550 4950
Connection ~ 3550 4950
Wire Wire Line
	3550 4950 3700 4950
Wire Wire Line
	3850 4500 3850 4350
Connection ~ 3850 4350
Wire Wire Line
	3850 4350 4400 4350
Wire Wire Line
	3850 4700 3850 4800
Wire Wire Line
	3850 5100 3850 5200
Wire Wire Line
	3850 5400 3850 5550
Connection ~ 3850 5550
Wire Wire Line
	3850 5550 4750 5550
$Comp
L power:+12V #PWR05
U 1 1 61F8789E
P 4400 3950
F 0 "#PWR05" H 4400 3800 50  0001 C CNN
F 1 "+12V" H 4415 4123 50  0000 C CNN
F 2 "" H 4400 3950 50  0001 C CNN
F 3 "" H 4400 3950 50  0001 C CNN
	1    4400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4350 1700 4350
$Comp
L Device:C_Small C9
U 1 1 61F884F6
P 5250 4950
F 0 "C9" H 5342 4996 50  0000 L CNN
F 1 "2200u" H 5342 4905 50  0000 L CNN
F 2 "Capacitor_THT:C_Axial_L22.0mm_D10.5mm_P27.50mm_Horizontal" H 5250 4950 50  0001 C CNN
F 3 "~" H 5250 4950 50  0001 C CNN
	1    5250 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4350 5250 4350
Wire Wire Line
	5250 4350 5250 4850
Connection ~ 4750 4350
Wire Wire Line
	4750 5550 5250 5550
Wire Wire Line
	5250 5550 5250 5050
Connection ~ 4750 5550
$Comp
L Device:D_Bridge_+A-A D7
U 1 1 61F8C420
P 8150 1750
F 0 "D7" H 8350 1600 50  0000 L CNN
F 1 "WO4" H 8350 1500 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D9.8mm" H 8150 1750 50  0001 C CNN
F 3 "~" H 8150 1750 50  0001 C CNN
	1    8150 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61F8D3AD
P 7750 1800
F 0 "#PWR06" H 7750 1550 50  0001 C CNN
F 1 "GND" H 7755 1627 50  0000 C CNN
F 2 "" H 7750 1800 50  0001 C CNN
F 3 "" H 7750 1800 50  0001 C CNN
	1    7750 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 61F8F83D
P 6700 1800
F 0 "J7" H 6618 1475 50  0000 C CNN
F 1 "15-18VAC" H 6618 1566 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6700 1800 50  0001 C CNN
F 3 "~" H 6700 1800 50  0001 C CNN
	1    6700 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 1700 7400 1700
Wire Wire Line
	7400 1700 7400 1350
Wire Wire Line
	7400 1350 8150 1350
Wire Wire Line
	8150 1350 8150 1450
Wire Wire Line
	8150 2050 8150 2350
Wire Wire Line
	8150 2350 7400 2350
Wire Wire Line
	7400 2350 7400 1800
Wire Wire Line
	7400 1800 6900 1800
$Comp
L power:+15V #PWR07
U 1 1 61F95788
P 8750 1350
F 0 "#PWR07" H 8750 1200 50  0001 C CNN
F 1 "+15V" H 8765 1523 50  0000 C CNN
F 2 "" H 8750 1350 50  0001 C CNN
F 3 "" H 8750 1350 50  0001 C CNN
	1    8750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1750 8750 1750
Wire Wire Line
	8750 1750 8750 1350
$Comp
L Device:C_Small C10
U 1 1 61F9822A
P 9050 2050
F 0 "C10" H 9142 2096 50  0000 L CNN
F 1 "2200u" H 9142 2005 50  0000 L CNN
F 2 "Capacitor_THT:C_Axial_L22.0mm_D10.5mm_P27.50mm_Horizontal" H 9050 2050 50  0001 C CNN
F 3 "~" H 9050 2050 50  0001 C CNN
	1    9050 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 61F98742
P 9650 2050
F 0 "C11" H 9742 2096 50  0000 L CNN
F 1 "100u" H 9742 2005 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D12.5mm_H25.0mm_P5.00mm" H 9650 2050 50  0001 C CNN
F 3 "~" H 9650 2050 50  0001 C CNN
	1    9650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 1750 9050 1750
Wire Wire Line
	9650 1750 9650 1950
Connection ~ 8750 1750
Wire Wire Line
	9050 1950 9050 1750
Connection ~ 9050 1750
Wire Wire Line
	9050 1750 9650 1750
$Comp
L power:GND #PWR08
U 1 1 61F9D6D5
P 9350 2350
F 0 "#PWR08" H 9350 2100 50  0001 C CNN
F 1 "GND" H 9355 2177 50  0000 C CNN
F 2 "" H 9350 2350 50  0001 C CNN
F 3 "" H 9350 2350 50  0001 C CNN
	1    9350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2150 9050 2350
Wire Wire Line
	9050 2350 9350 2350
Wire Wire Line
	9650 2150 9650 2350
Connection ~ 9350 2350
Wire Wire Line
	1000 1800 1200 1800
Wire Wire Line
	1000 4350 1000 1800
Connection ~ 1000 1800
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61FAAFB7
P 1200 1800
F 0 "#FLG01" H 1200 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 1973 50  0000 C CNN
F 2 "" H 1200 1800 50  0001 C CNN
F 3 "~" H 1200 1800 50  0001 C CNN
	1    1200 1800
	1    0    0    -1  
$EndComp
Connection ~ 1200 1800
Wire Wire Line
	1200 1800 1700 1800
Wire Wire Line
	2850 3000 3600 3000
Connection ~ 3600 3000
Wire Wire Line
	3600 3000 3850 3000
Wire Wire Line
	7850 1750 7750 1750
Wire Wire Line
	7750 1750 7750 1800
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 61FB0F14
P 5550 2350
F 0 "J1" H 5630 2342 50  0000 L CNN
F 1 "BATT" H 5630 2251 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5550 2350 50  0001 C CNN
F 3 "~" H 5550 2350 50  0001 C CNN
	1    5550 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2350 5350 2150
Wire Wire Line
	5350 1800 5200 1800
Connection ~ 4750 1800
Wire Wire Line
	5350 3000 5350 2450
Connection ~ 4750 3000
Wire Wire Line
	2850 5550 3550 5550
Connection ~ 3550 5550
Wire Wire Line
	3550 5550 3850 5550
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61FB7CE8
P 1200 2950
F 0 "#FLG02" H 1200 3025 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 3123 50  0000 C CNN
F 2 "" H 1200 2950 50  0001 C CNN
F 3 "~" H 1200 2950 50  0001 C CNN
	1    1200 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2350 9650 2350
Wire Wire Line
	4750 3000 5350 3000
Wire Wire Line
	1200 2950 1200 3000
Wire Wire Line
	1200 3000 1700 3000
Connection ~ 1700 3000
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 61FBBFC5
P 6650 4400
F 0 "J3" H 6730 4392 50  0000 L CNN
F 1 "12V" H 6730 4301 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6650 4400 50  0001 C CNN
F 3 "~" H 6650 4400 50  0001 C CNN
	1    6650 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 61FBC6C8
P 6650 4700
F 0 "J4" H 6730 4692 50  0000 L CNN
F 1 "12V" H 6730 4601 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6650 4700 50  0001 C CNN
F 3 "~" H 6650 4700 50  0001 C CNN
	1    6650 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 61FBC9CC
P 6650 5000
F 0 "J5" H 6730 4992 50  0000 L CNN
F 1 "12V" H 6730 4901 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6650 5000 50  0001 C CNN
F 3 "~" H 6650 5000 50  0001 C CNN
	1    6650 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J6
U 1 1 61FBCD66
P 6650 5300
F 0 "J6" H 6730 5292 50  0000 L CNN
F 1 "12V" H 6730 5201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6650 5300 50  0001 C CNN
F 3 "~" H 6650 5300 50  0001 C CNN
	1    6650 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4400 6450 4400
Wire Wire Line
	6000 4400 6000 4700
Wire Wire Line
	6000 4700 6450 4700
Connection ~ 6000 4400
Wire Wire Line
	6000 4700 6000 5000
Wire Wire Line
	6000 5000 6450 5000
Connection ~ 6000 4700
Wire Wire Line
	6000 5000 6000 5300
Wire Wire Line
	6000 5300 6450 5300
Connection ~ 6000 5000
Wire Wire Line
	6450 4500 6350 4500
Wire Wire Line
	6350 4500 6350 4600
Wire Wire Line
	6350 4600 7200 4600
Wire Wire Line
	7200 4600 7200 4900
Wire Wire Line
	6450 4800 6450 4900
Wire Wire Line
	6450 4900 7200 4900
Connection ~ 7200 4900
Wire Wire Line
	7200 4900 7200 5200
Wire Wire Line
	6450 5100 6450 5200
Wire Wire Line
	6450 5200 7200 5200
Connection ~ 7200 5200
Wire Wire Line
	7200 5200 7200 5550
Wire Wire Line
	5250 5550 6450 5550
Connection ~ 5250 5550
Wire Wire Line
	6450 5400 6450 5550
Connection ~ 6450 5550
Wire Wire Line
	6450 5550 7200 5550
$Comp
L Diode:1N5400 D5
U 1 1 61FDCBEB
P 5050 1800
F 0 "D5" H 5050 1583 50  0000 C CNN
F 1 "1N5400" H 5050 1674 50  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5050 1625 50  0001 C CNN
F 3 "" H 5050 1800 50  0001 C CNN
	1    5050 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1800 4750 1800
$Comp
L Diode:1N5400 D6
U 1 1 61FDE93F
P 5600 4350
F 0 "D6" H 5600 4133 50  0000 C CNN
F 1 "1N5400" H 5600 4224 50  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5600 4175 50  0001 C CNN
F 3 "" H 5600 4350 50  0001 C CNN
	1    5600 4350
	-1   0    0    1   
$EndComp
Connection ~ 5250 4350
Wire Wire Line
	5250 4350 5450 4350
$Comp
L Transistor_BJT:BC549 Q1
U 1 1 61FE1483
P 2450 2650
F 0 "Q1" H 2400 2900 50  0000 L CNN
F 1 "BC549" H 2300 2800 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2650 2575 50  0001 L CIN
F 3 "" H 2450 2650 50  0001 L CNN
	1    2450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1800 2100 1800
Wire Wire Line
	1700 3000 2550 3000
Wire Wire Line
	2100 2050 2100 1800
Connection ~ 2100 1800
Wire Wire Line
	2100 1800 2500 1800
Wire Wire Line
	2100 2250 2100 2350
Wire Wire Line
	2100 2350 1700 2350
Connection ~ 1700 2350
Wire Wire Line
	1700 2350 1700 3000
Wire Wire Line
	2550 2450 2550 2400
Wire Wire Line
	2550 2400 2850 2400
Connection ~ 2850 2400
Wire Wire Line
	2550 2850 2550 2900
Connection ~ 2550 3000
Wire Wire Line
	2550 3000 2850 3000
$Comp
L Device:R_Small R1
U 1 1 61FF4611
P 2050 2650
F 0 "R1" V 1854 2650 50  0000 C CNN
F 1 "10k" V 1945 2650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 2050 2650 50  0001 C CNN
F 3 "~" H 2050 2650 50  0001 C CNN
	1    2050 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 2650 2250 2650
Text GLabel 2150 2900 0    50   Input ~ 0
BATT_DIS
Wire Wire Line
	1950 2650 1850 2650
Wire Wire Line
	1850 2650 1850 2750
Wire Wire Line
	1850 2750 2250 2750
Wire Wire Line
	2250 2750 2250 2900
Wire Wire Line
	2250 2900 2150 2900
$Comp
L Transistor_BJT:BC549 Q2
U 1 1 620026AE
P 2450 5200
F 0 "Q2" H 2350 5450 50  0000 L CNN
F 1 "BC549" H 2300 5350 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2650 5125 50  0001 L CIN
F 3 "" H 2450 5200 50  0001 L CNN
	1    2450 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5400 2550 5450
$Comp
L Device:R_Small R2
U 1 1 620026B5
P 2050 5200
F 0 "R2" V 1854 5200 50  0000 C CNN
F 1 "10k" V 1945 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 2050 5200 50  0001 C CNN
F 3 "~" H 2050 5200 50  0001 C CNN
	1    2050 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5200 2250 5200
Text GLabel 2150 5450 0    50   Input ~ 0
12V_DIS
Wire Wire Line
	1950 5200 1850 5200
Wire Wire Line
	1850 5300 2250 5300
Wire Wire Line
	2250 5300 2250 5450
Wire Wire Line
	2250 5450 2150 5450
Wire Wire Line
	1700 5550 2550 5550
Wire Wire Line
	1700 4850 2300 4850
Wire Wire Line
	2300 4850 2300 4800
Connection ~ 1700 4850
Wire Wire Line
	1700 4850 1700 5550
Wire Wire Line
	1850 5200 1850 5300
Connection ~ 2550 5550
Wire Wire Line
	2550 5550 2850 5550
Wire Wire Line
	2550 5000 2550 4950
Wire Wire Line
	2550 4950 2850 4950
Connection ~ 2850 4950
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 620210A8
P 6600 3300
F 0 "J2" H 6680 3292 50  0000 L CNN
F 1 "DIS" H 6680 3201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 6600 3300 50  0001 C CNN
F 3 "~" H 6600 3300 50  0001 C CNN
	1    6600 3300
	1    0    0    -1  
$EndComp
Text GLabel 6000 3300 0    50   Input ~ 0
BATT_DIS
Text GLabel 6000 3400 0    50   Input ~ 0
12V_DIS
Wire Wire Line
	6000 3400 6400 3400
Wire Wire Line
	6000 3300 6400 3300
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 6205F07E
P 1600 6900
F 0 "H1" H 1700 6949 50  0000 L CNN
F 1 "GND" H 1700 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 1600 6900 50  0001 C CNN
F 3 "~" H 1600 6900 50  0001 C CNN
	1    1600 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6205F463
P 2050 6900
F 0 "H2" H 2150 6949 50  0000 L CNN
F 1 "GND" H 2150 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 2050 6900 50  0001 C CNN
F 3 "~" H 2050 6900 50  0001 C CNN
	1    2050 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6205F634
P 2500 6900
F 0 "H3" H 2600 6949 50  0000 L CNN
F 1 "GND" H 2600 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 2500 6900 50  0001 C CNN
F 3 "~" H 2500 6900 50  0001 C CNN
	1    2500 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6205F8B4
P 2950 6900
F 0 "H4" H 3050 6949 50  0000 L CNN
F 1 "GND" H 3050 6858 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 2950 6900 50  0001 C CNN
F 3 "~" H 2950 6900 50  0001 C CNN
	1    2950 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 620600F7
P 2300 7250
F 0 "#PWR09" H 2300 7000 50  0001 C CNN
F 1 "GND" H 2305 7077 50  0000 C CNN
F 2 "" H 2300 7250 50  0001 C CNN
F 3 "" H 2300 7250 50  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 7000 1600 7200
Wire Wire Line
	1600 7200 2050 7200
Wire Wire Line
	2300 7200 2300 7250
Wire Wire Line
	2950 7000 2950 7200
Wire Wire Line
	2950 7200 2500 7200
Connection ~ 2300 7200
Wire Wire Line
	2500 7000 2500 7200
Connection ~ 2500 7200
Wire Wire Line
	2500 7200 2300 7200
Wire Wire Line
	2050 7000 2050 7200
Connection ~ 2050 7200
Wire Wire Line
	2050 7200 2300 7200
$Comp
L Diode:1N5400 D8
U 1 1 620983E1
P 5600 3900
F 0 "D8" H 5600 3683 50  0000 C CNN
F 1 "1N5400" H 5600 3774 50  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 5600 3725 50  0001 C CNN
F 3 "" H 5600 3900 50  0001 C CNN
	1    5600 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 3900 5850 3900
Wire Wire Line
	6000 3900 6000 4000
Wire Wire Line
	5350 1800 6100 1800
Wire Wire Line
	6100 1800 6100 3100
Wire Wire Line
	6100 3100 5200 3100
Wire Wire Line
	5200 3100 5200 3900
Wire Wire Line
	5200 3900 5450 3900
Connection ~ 5350 1800
$Comp
L Device:R_Small R7
U 1 1 620BE73A
P 2400 2900
F 0 "R7" V 2500 2900 50  0000 C CNN
F 1 "100k" V 2600 2900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 2400 2900 50  0001 C CNN
F 3 "~" H 2400 2900 50  0001 C CNN
	1    2400 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 2900 2300 2900
Connection ~ 2250 2900
Wire Wire Line
	2500 2900 2550 2900
Connection ~ 2550 2900
Wire Wire Line
	2550 2900 2550 3000
$Comp
L Device:R_Small R8
U 1 1 620CFF12
P 2400 5450
F 0 "R8" V 2500 5450 50  0000 C CNN
F 1 "100k" V 2600 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 2400 5450 50  0001 C CNN
F 3 "~" H 2400 5450 50  0001 C CNN
	1    2400 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5450 2300 5450
Connection ~ 2250 5450
Wire Wire Line
	2500 5450 2550 5450
Connection ~ 2550 5450
Wire Wire Line
	2550 5450 2550 5550
$Comp
L Device:LED D9
U 1 1 620EEFD8
P 10250 2050
F 0 "D9" V 10289 1932 50  0000 R CNN
F 1 "RED LED" V 10198 1932 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 10250 2050 50  0001 C CNN
F 3 "~" H 10250 2050 50  0001 C CNN
	1    10250 2050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 620F0849
P 10050 2350
F 0 "R9" V 9854 2350 50  0000 C CNN
F 1 "10k" V 9945 2350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 10050 2350 50  0001 C CNN
F 3 "~" H 10050 2350 50  0001 C CNN
	1    10050 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 1750 10250 1750
Wire Wire Line
	10250 1750 10250 1900
Connection ~ 9650 1750
Wire Wire Line
	10250 2200 10250 2350
Wire Wire Line
	10250 2350 10150 2350
Wire Wire Line
	9950 2350 9650 2350
Connection ~ 9650 2350
$Comp
L Device:Fuse_Small F1
U 1 1 6211500B
P 5350 2050
F 0 "F1" V 5304 2098 50  0000 L CNN
F 1 "3A" V 5395 2098 50  0000 L CNN
F 2 "Fuse:Fuse_Blade_Mini_directSolder" H 5350 2050 50  0001 C CNN
F 3 "~" H 5350 2050 50  0001 C CNN
	1    5350 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 1950 5350 1800
$Comp
L Device:Fuse_Small F2
U 1 1 62116531
P 6000 4100
F 0 "F2" V 5954 4148 50  0000 L CNN
F 1 "3A" V 6045 4148 50  0000 L CNN
F 2 "Fuse:Fuse_Blade_Mini_directSolder" H 6000 4100 50  0001 C CNN
F 3 "~" H 6000 4100 50  0001 C CNN
	1    6000 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 4200 6000 4400
Wire Wire Line
	5750 4350 5850 4350
Wire Wire Line
	5850 4350 5850 3900
Connection ~ 5850 3900
Wire Wire Line
	5850 3900 6000 3900
$EndSCHEMATC
