EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6400 7100 2    50   Input ~ 0
VBAT_MON
$Comp
L Device:C_Small C38
U 1 1 60A7B528
P 4350 6900
F 0 "C38" H 4425 6975 50  0000 L CNN
F 1 "100n" H 4425 6900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4350 6900 50  0001 C CNN
F 3 "~" H 4350 6900 50  0001 C CNN
	1    4350 6900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U11
U 4 1 60A7B52E
P 5750 7100
F 0 "U11" H 5750 7467 50  0000 C CNN
F 1 "LM324" H 5750 7376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5700 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5800 7300 50  0001 C CNN
	4    5750 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R54
U 1 1 60A7B534
P 5725 7500
F 0 "R54" V 5650 7475 50  0000 C CNN
F 1 "1.8K" V 5800 7500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 5725 7500 50  0001 C CNN
F 3 "~" H 5725 7500 50  0001 C CNN
	1    5725 7500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR077
U 1 1 60A7B53A
P 4900 7525
F 0 "#PWR077" H 4900 7275 50  0001 C CNN
F 1 "GND" H 4905 7352 50  0000 C CNN
F 2 "" H 4900 7525 50  0001 C CNN
F 3 "" H 4900 7525 50  0001 C CNN
	1    4900 7525
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R53
U 1 1 60A7B540
P 4675 6700
F 0 "R53" V 4600 6675 50  0000 C CNN
F 1 "10K" V 4750 6700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 4675 6700 50  0001 C CNN
F 3 "~" H 4675 6700 50  0001 C CNN
	1    4675 6700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C43
U 1 1 60A7B546
P 4900 7300
F 0 "C43" H 4725 7400 50  0000 L CNN
F 1 "100n" H 4625 7300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4900 7300 50  0001 C CNN
F 3 "~" H 4900 7300 50  0001 C CNN
	1    4900 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 7100 6150 7100
Wire Wire Line
	4775 6700 4900 6700
Wire Wire Line
	4900 6700 4900 7200
Wire Wire Line
	4900 7200 5250 7200
Connection ~ 4900 7200
Wire Wire Line
	5250 7200 5250 7500
Wire Wire Line
	5250 7500 5625 7500
Connection ~ 5250 7200
Wire Wire Line
	5250 7200 5450 7200
Wire Wire Line
	5825 7500 6150 7500
Wire Wire Line
	6150 7500 6150 7100
Connection ~ 6150 7100
Wire Wire Line
	6150 7100 6050 7100
$Comp
L power:GND #PWR074
U 1 1 60A7B559
P 5100 6800
F 0 "#PWR074" H 5100 6550 50  0001 C CNN
F 1 "GND" H 5105 6627 50  0000 C CNN
F 2 "" H 5100 6800 50  0001 C CNN
F 3 "" H 5100 6800 50  0001 C CNN
	1    5100 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 7000 5300 7000
Wire Wire Line
	5300 7000 5300 6700
Wire Wire Line
	5300 6700 5100 6700
Wire Wire Line
	5100 6700 5100 6800
Wire Wire Line
	4900 7400 4900 7525
Text GLabel 4250 6700 0    50   Input ~ 0
VBAT
Wire Wire Line
	4250 6700 4350 6700
Wire Wire Line
	4350 6700 4350 6800
Connection ~ 4350 6700
Wire Wire Line
	4350 6700 4575 6700
Wire Wire Line
	4350 7000 4350 7325
$Comp
L power:GND #PWR076
U 1 1 60A7B56A
P 4350 7325
F 0 "#PWR076" H 4350 7075 50  0001 C CNN
F 1 "GND" H 4355 7152 50  0000 C CNN
F 2 "" H 4350 7325 50  0001 C CNN
F 3 "" H 4350 7325 50  0001 C CNN
	1    4350 7325
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U?
U 1 1 60AB0046
P 1650 6875
AR Path="/60AB0046" Ref="U?"  Part="1" 
AR Path="/60A5B260/60AB0046" Ref="U12"  Part="1" 
F 0 "U12" H 1650 7117 50  0000 C CNN
F 1 "7805" H 1650 7026 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1650 7100 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 1650 6825 50  0001 C CNN
	1    1650 6875
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 6875 1300 6875
$Comp
L power:GND #PWR?
U 1 1 60AB004D
P 1650 7550
AR Path="/60AB004D" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AB004D" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 1650 7300 50  0001 C CNN
F 1 "GND" H 1655 7377 50  0000 C CNN
F 2 "" H 1650 7550 50  0001 C CNN
F 3 "" H 1650 7550 50  0001 C CNN
	1    1650 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 7175 1650 7450
$Comp
L Device:C_Small C?
U 1 1 60AB0054
P 1300 7250
AR Path="/60AB0054" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AB0054" Ref="C42"  Part="1" 
F 0 "C42" H 1392 7296 50  0000 L CNN
F 1 "100n" H 1392 7205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1300 7250 50  0001 C CNN
F 3 "~" H 1300 7250 50  0001 C CNN
	1    1300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 6875 1300 7150
Connection ~ 1300 6875
Wire Wire Line
	1300 6875 1350 6875
Wire Wire Line
	1300 7350 1300 7450
Wire Wire Line
	1300 7450 1650 7450
Connection ~ 1650 7450
Wire Wire Line
	1650 7450 1650 7550
$Comp
L Device:C_Small C?
U 1 1 60AB0061
P 2675 7175
AR Path="/60AB0061" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AB0061" Ref="C39"  Part="1" 
F 0 "C39" H 2500 7250 50  0000 L CNN
F 1 "100n" H 2400 7100 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2675 7175 50  0001 C CNN
F 3 "~" H 2675 7175 50  0001 C CNN
	1    2675 7175
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AB0067
P 3125 7175
AR Path="/60AB0067" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AB0067" Ref="C40"  Part="1" 
F 0 "C40" H 2950 7250 50  0000 L CNN
F 1 "220u" H 2900 7100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 3125 7175 50  0001 C CNN
F 3 "~" H 3125 7175 50  0001 C CNN
	1    3125 7175
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AB006D
P 3525 7175
AR Path="/60AB006D" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AB006D" Ref="C41"  Part="1" 
F 0 "C41" H 3350 7250 50  0000 L CNN
F 1 "4.7u" H 3300 7100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 3525 7175 50  0001 C CNN
F 3 "~" H 3525 7175 50  0001 C CNN
	1    3525 7175
	1    0    0    -1  
$EndComp
Wire Wire Line
	3525 7075 3525 6875
Wire Wire Line
	2675 6875 2675 7075
Wire Wire Line
	3125 7075 3125 6875
Connection ~ 2675 6875
Wire Wire Line
	3125 6875 2675 6875
Wire Wire Line
	3525 6875 3125 6875
Connection ~ 3125 6875
Wire Wire Line
	1650 7450 2675 7450
Wire Wire Line
	3525 7450 3525 7275
Wire Wire Line
	3125 7275 3125 7450
Connection ~ 3125 7450
Wire Wire Line
	3125 7450 3525 7450
Wire Wire Line
	2675 7275 2675 7450
Connection ~ 2675 7450
Wire Wire Line
	2675 7450 3125 7450
$Comp
L power:+5V #PWR?
U 1 1 60AB0082
P 2575 6875
AR Path="/60AB0082" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AB0082" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 2575 6725 50  0001 C CNN
F 1 "+5V" H 2590 7048 50  0000 C CNN
F 2 "" H 2575 6875 50  0001 C CNN
F 3 "" H 2575 6875 50  0001 C CNN
	1    2575 6875
	1    0    0    -1  
$EndComp
Connection ~ 2575 6875
Wire Wire Line
	2575 6875 2675 6875
Wire Wire Line
	1950 6875 2575 6875
Text GLabel 1075 6875 0    50   Input ~ 0
VBAT_SUP
$Comp
L Device:Fuse_Small F?
U 1 1 60AD22A2
P 6750 1150
AR Path="/60AD22A2" Ref="F?"  Part="1" 
AR Path="/60A5B260/60AD22A2" Ref="F1"  Part="1" 
F 0 "F1" V 6704 1198 50  0000 L CNN
F 1 "2A" V 6795 1198 50  0000 L CNN
F 2 "Fuse:Fuse_Bourns_MF-RHT200" H 6750 1150 50  0001 C CNN
F 3 "~" H 6750 1150 50  0001 C CNN
	1    6750 1150
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LM317_TO-220 U?
U 1 1 60AD22A8
P 8075 1000
AR Path="/60AD22A8" Ref="U?"  Part="1" 
AR Path="/60A5B260/60AD22A8" Ref="U10"  Part="1" 
F 0 "U10" H 8075 1242 50  0000 C CNN
F 1 "LM317_TO-220" H 8075 1151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 8075 1250 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 8075 1000 50  0001 C CNN
	1    8075 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_Small D?
U 1 1 60AD22AE
P 9050 1000
AR Path="/60AD22AE" Ref="D?"  Part="1" 
AR Path="/60A5B260/60AD22AE" Ref="D3"  Part="1" 
F 0 "D3" H 9050 793 50  0000 C CNN
F 1 "Schottky" H 9050 884 50  0000 C CNN
F 2 "Diode_THT:D_DO-201_P15.24mm_Horizontal" V 9050 1000 50  0001 C CNN
F 3 "~" V 9050 1000 50  0001 C CNN
	1    9050 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Bridge_+AA- D?
U 1 1 60AD22B4
P 6450 1300
AR Path="/60AD22B4" Ref="D?"  Part="1" 
AR Path="/60A5B260/60AD22B4" Ref="D4"  Part="1" 
F 0 "D4" H 6150 1500 50  0000 L CNN
F 1 "KBP210G" H 5925 1425 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Vishay_KBPM" H 6450 1300 50  0001 C CNN
F 3 "~" H 6450 1300 50  0001 C CNN
	1    6450 1300
	1    0    0    -1  
$EndComp
Text GLabel 4375 1900 2    50   Input ~ 0
VBAT_SUP
$Comp
L power:GND #PWR?
U 1 1 60AD22BB
P 6550 2025
AR Path="/60AD22BB" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD22BB" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 6550 1775 50  0001 C CNN
F 1 "GND" H 6555 1852 50  0000 C CNN
F 2 "" H 6550 2025 50  0001 C CNN
F 3 "" H 6550 2025 50  0001 C CNN
	1    6550 2025
	1    0    0    -1  
$EndComp
Wire Wire Line
	8375 1000 8450 1000
$Comp
L Device:R_Small R?
U 1 1 60AD22C2
P 8450 1200
AR Path="/60AD22C2" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD22C2" Ref="R41"  Part="1" 
F 0 "R41" H 8509 1246 50  0000 L CNN
F 1 "220R" H 8509 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 8450 1200 50  0001 C CNN
F 3 "~" H 8450 1200 50  0001 C CNN
	1    8450 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1100 8450 1000
Text GLabel 10575 1150 2    50   Input ~ 0
VBAT_SUP
Wire Wire Line
	6750 1300 6750 1250
Wire Wire Line
	6750 1050 6750 1000
$Comp
L Device:C_Small C?
U 1 1 60AD22CE
P 7000 1700
AR Path="/60AD22CE" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22CE" Ref="C28"  Part="1" 
F 0 "C28" H 6825 1775 50  0000 L CNN
F 1 "2200u" H 6725 1625 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L34.5mm_D20.0mm_P41.00mm_Horizontal" H 7000 1700 50  0001 C CNN
F 3 "~" H 7000 1700 50  0001 C CNN
	1    7000 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD22D4
P 7450 1700
AR Path="/60AD22D4" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22D4" Ref="C29"  Part="1" 
F 0 "C29" H 7275 1775 50  0000 L CNN
F 1 "220u" H 7225 1625 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 7450 1700 50  0001 C CNN
F 3 "~" H 7450 1700 50  0001 C CNN
	1    7450 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD22DA
P 7850 1700
AR Path="/60AD22DA" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22DA" Ref="C30"  Part="1" 
F 0 "C30" H 7675 1775 50  0000 L CNN
F 1 "4.7u" H 7625 1625 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 7850 1700 50  0001 C CNN
F 3 "~" H 7850 1700 50  0001 C CNN
	1    7850 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 1600 7850 1400
Wire Wire Line
	7850 1400 7450 1400
Wire Wire Line
	7000 1400 7000 1600
Wire Wire Line
	7450 1600 7450 1400
Connection ~ 7450 1400
Wire Wire Line
	7450 1400 7000 1400
Wire Wire Line
	7450 1400 7450 1175
Connection ~ 7450 1000
Wire Wire Line
	7000 1800 7000 2025
Wire Wire Line
	7000 2025 7450 2025
Wire Wire Line
	7850 2025 7850 1800
Wire Wire Line
	7450 1800 7450 2025
Connection ~ 7450 2025
Wire Wire Line
	7450 2025 7850 2025
Connection ~ 7000 2025
$Comp
L Device:C_Small C?
U 1 1 60AD22EF
P 9525 1300
AR Path="/60AD22EF" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22EF" Ref="C25"  Part="1" 
F 0 "C25" H 9350 1375 50  0000 L CNN
F 1 "2200u" H 9250 1225 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L34.5mm_D20.0mm_P41.00mm_Horizontal" H 9525 1300 50  0001 C CNN
F 3 "~" H 9525 1300 50  0001 C CNN
	1    9525 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD22F5
P 9975 1300
AR Path="/60AD22F5" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22F5" Ref="C26"  Part="1" 
F 0 "C26" H 9800 1375 50  0000 L CNN
F 1 "220u" H 9750 1225 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 9975 1300 50  0001 C CNN
F 3 "~" H 9975 1300 50  0001 C CNN
	1    9975 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD22FB
P 10375 1300
AR Path="/60AD22FB" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD22FB" Ref="C27"  Part="1" 
F 0 "C27" H 10200 1375 50  0000 L CNN
F 1 "4.7u" H 10150 1225 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 10375 1300 50  0001 C CNN
F 3 "~" H 10375 1300 50  0001 C CNN
	1    10375 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10375 1200 10375 1150
Wire Wire Line
	9525 1000 9525 1200
Wire Wire Line
	9975 1200 9975 1000
Connection ~ 9525 1000
Wire Wire Line
	9975 1000 9825 1000
Wire Wire Line
	10375 1000 9975 1000
Connection ~ 9975 1000
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60AD2311
P 7200 1000
AR Path="/60AD2311" Ref="#FLG?"  Part="1" 
AR Path="/60A5B260/60AD2311" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 7200 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 7200 1173 50  0000 C CNN
F 2 "" H 7200 1000 50  0001 C CNN
F 3 "~" H 7200 1000 50  0001 C CNN
	1    7200 1000
	1    0    0    -1  
$EndComp
Connection ~ 7200 1000
Wire Wire Line
	7200 1000 7450 1000
Wire Wire Line
	6100 1300 6150 1300
$Comp
L power:+BATT #PWR?
U 1 1 60AD231A
P 9825 1000
AR Path="/60AD231A" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD231A" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 9825 850 50  0001 C CNN
F 1 "+BATT" H 9840 1173 50  0000 C CNN
F 2 "" H 9825 1000 50  0001 C CNN
F 3 "" H 9825 1000 50  0001 C CNN
	1    9825 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60AD2321
P 9450 1000
AR Path="/60AD2321" Ref="#FLG?"  Part="1" 
AR Path="/60A5B260/60AD2321" Ref="#FLG03"  Part="1" 
F 0 "#FLG03" H 9450 1075 50  0001 C CNN
F 1 "PWR_FLAG" H 9450 1173 50  0000 C CNN
F 2 "" H 9450 1000 50  0001 C CNN
F 3 "~" H 9450 1000 50  0001 C CNN
	1    9450 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 60AD2328
P 6725 2025
AR Path="/60AD2328" Ref="#FLG?"  Part="1" 
AR Path="/60A5B260/60AD2328" Ref="#FLG04"  Part="1" 
F 0 "#FLG04" H 6725 2100 50  0001 C CNN
F 1 "PWR_FLAG" H 6725 2198 50  0000 C CNN
F 2 "" H 6725 2025 50  0001 C CNN
F 3 "~" H 6725 2025 50  0001 C CNN
	1    6725 2025
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1000 7200 1000
$Comp
L power:GND #PWR?
U 1 1 60AD232F
P 9725 1625
AR Path="/60AD232F" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD232F" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 9725 1375 50  0001 C CNN
F 1 "GND" H 9730 1452 50  0000 C CNN
F 2 "" H 9725 1625 50  0001 C CNN
F 3 "" H 9725 1625 50  0001 C CNN
	1    9725 1625
	1    0    0    -1  
$EndComp
Connection ~ 9725 1625
Wire Wire Line
	9525 1625 9725 1625
Wire Wire Line
	9725 1625 9975 1625
Wire Wire Line
	9975 1625 10375 1625
Connection ~ 9975 1625
Wire Wire Line
	9975 1400 9975 1625
Wire Wire Line
	10375 1625 10375 1400
Wire Wire Line
	9525 1400 9525 1625
$Comp
L Amplifier_Operational:LM324 U?
U 1 1 60AD233D
P 2125 5425
AR Path="/60AD233D" Ref="U?"  Part="1" 
AR Path="/60A5B260/60AD233D" Ref="U11"  Part="1" 
F 0 "U11" H 2125 5792 50  0000 C CNN
F 1 "LM324" H 2125 5701 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2075 5525 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 2175 5625 50  0001 C CNN
	1    2125 5425
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 2 1 60AD2343
P 3200 5525
AR Path="/60AD2343" Ref="U?"  Part="2" 
AR Path="/60A5B260/60AD2343" Ref="U11"  Part="2" 
F 0 "U11" H 3200 5892 50  0000 C CNN
F 1 "LM324" H 3200 5801 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3150 5625 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3250 5725 50  0001 C CNN
	2    3200 5525
	1    0    0    -1  
$EndComp
Text GLabel 725  4925 1    50   Input ~ 0
VBAT_PWM
$Comp
L Device:R_Small R?
U 1 1 60AD234A
P 725 5150
AR Path="/60AD234A" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD234A" Ref="R48"  Part="1" 
F 0 "R48" V 875 5150 50  0000 C CNN
F 1 "1K" V 800 5150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 725 5150 50  0001 C CNN
F 3 "~" H 725 5150 50  0001 C CNN
	1    725  5150
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD2350
P 1300 5500
AR Path="/60AD2350" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD2350" Ref="C34"  Part="1" 
F 0 "C34" H 1392 5546 50  0000 L CNN
F 1 "100u" H 1392 5455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 1300 5500 50  0001 C CNN
F 3 "~" H 1300 5500 50  0001 C CNN
	1    1300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5400 1300 5325
Connection ~ 1300 5325
Wire Wire Line
	1300 5325 1825 5325
$Comp
L power:GND #PWR?
U 1 1 60AD235B
P 1300 5675
AR Path="/60AD235B" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD235B" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 1300 5425 50  0001 C CNN
F 1 "GND" H 1305 5502 50  0000 C CNN
F 2 "" H 1300 5675 50  0001 C CNN
F 3 "" H 1300 5675 50  0001 C CNN
	1    1300 5675
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5600 1300 5625
Wire Wire Line
	2900 5625 2825 5625
Wire Wire Line
	3500 5875 3500 5525
Wire Wire Line
	2425 5425 2525 5425
Wire Wire Line
	1825 5525 1725 5525
Wire Wire Line
	1725 5525 1725 5800
Wire Wire Line
	2525 5800 2525 5425
Connection ~ 2525 5425
Wire Wire Line
	2525 5425 2900 5425
$Comp
L Device:R_Small R?
U 1 1 60AD236A
P 3175 5875
AR Path="/60AD236A" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD236A" Ref="R50"  Part="1" 
F 0 "R50" V 3250 5875 50  0000 C CNN
F 1 "10K" V 3075 5875 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 3175 5875 50  0001 C CNN
F 3 "~" H 3175 5875 50  0001 C CNN
	1    3175 5875
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60AD2370
P 2825 6100
AR Path="/60AD2370" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2370" Ref="R51"  Part="1" 
F 0 "R51" H 2700 6175 50  0000 C CNN
F 1 "4K7" H 2700 6075 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 2825 6100 50  0001 C CNN
F 3 "~" H 2825 6100 50  0001 C CNN
	1    2825 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AD2376
P 2825 6300
AR Path="/60AD2376" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD2376" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 2825 6050 50  0001 C CNN
F 1 "GND" H 2830 6127 50  0000 C CNN
F 2 "" H 2825 6300 50  0001 C CNN
F 3 "" H 2825 6300 50  0001 C CNN
	1    2825 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2825 5625 2825 5875
Wire Wire Line
	3075 5875 2825 5875
Connection ~ 2825 5875
Wire Wire Line
	2825 5875 2825 6000
Wire Wire Line
	3275 5875 3500 5875
$Comp
L Device:C_Small C?
U 1 1 60AD2381
P 2375 6075
AR Path="/60AD2381" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD2381" Ref="C37"  Part="1" 
F 0 "C37" H 2200 6175 50  0000 L CNN
F 1 "100n" H 2100 6075 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2375 6075 50  0001 C CNN
F 3 "~" H 2375 6075 50  0001 C CNN
	1    2375 6075
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 5975 2375 5800
Wire Wire Line
	1725 5800 2375 5800
Connection ~ 2375 5800
Wire Wire Line
	2375 5800 2525 5800
Wire Wire Line
	2375 6175 2375 6250
Wire Wire Line
	2375 6250 2825 6250
Wire Wire Line
	2825 6200 2825 6250
Connection ~ 2825 6250
Wire Wire Line
	2825 6250 2825 6300
Wire Wire Line
	4475 2875 4625 2875
Connection ~ 4475 2875
Wire Wire Line
	4625 2875 4825 2875
Connection ~ 4625 2875
Wire Wire Line
	4625 2700 4625 2875
Wire Wire Line
	4825 2875 4825 2700
Wire Wire Line
	3875 2525 3875 2875
Wire Wire Line
	4625 2225 4825 2225
Wire Wire Line
	4825 2500 4825 2225
Wire Wire Line
	4625 2500 4625 2225
$Comp
L Device:C_Small C?
U 1 1 60AD23B3
P 4825 2600
AR Path="/60AD23B3" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD23B3" Ref="C33"  Part="1" 
F 0 "C33" H 4900 2675 50  0000 L CNN
F 1 "47u" H 4900 2525 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P5.00mm" H 4825 2600 50  0001 C CNN
F 3 "~" H 4825 2600 50  0001 C CNN
	1    4825 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD23B9
P 4625 2600
AR Path="/60AD23B9" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD23B9" Ref="C32"  Part="1" 
F 0 "C32" H 4450 2675 50  0000 L CNN
F 1 "100n" H 4350 2525 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4625 2600 50  0001 C CNN
F 3 "~" H 4625 2600 50  0001 C CNN
	1    4625 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60AD23C4
P 3875 2425
AR Path="/60AD23C4" Ref="C?"  Part="1" 
AR Path="/60A5B260/60AD23C4" Ref="C31"  Part="1" 
F 0 "C31" H 3900 2500 50  0000 L CNN
F 1 "100n" H 3900 2350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3875 2425 50  0001 C CNN
F 3 "~" H 3875 2425 50  0001 C CNN
	1    3875 2425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AD23D0
P 4475 2875
AR Path="/60AD23D0" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD23D0" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 4475 2625 50  0001 C CNN
F 1 "GND" H 4480 2702 50  0000 C CNN
F 2 "" H 4475 2875 50  0001 C CNN
F 3 "" H 4475 2875 50  0001 C CNN
	1    4475 2875
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 60AD23D6
P 1500 1250
AR Path="/60AD23D6" Ref="J?"  Part="1" 
AR Path="/60A5B260/60AD23D6" Ref="J15"  Part="1" 
F 0 "J15" H 1625 1150 50  0000 C CNN
F 1 "BATT" H 1675 1250 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 1500 1250 50  0001 C CNN
F 3 "~" H 1500 1250 50  0001 C CNN
	1    1500 1250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 60AD23DC
P 5375 2475
AR Path="/60AD23DC" Ref="J?"  Part="1" 
AR Path="/60A5B260/60AD23DC" Ref="J16"  Part="1" 
F 0 "J16" H 5550 2375 50  0000 C CNN
F 1 "12V" H 5550 2475 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5375 2475 50  0001 C CNN
F 3 "~" H 5375 2475 50  0001 C CNN
	1    5375 2475
	-1   0    0    1   
$EndComp
Connection ~ 6725 2025
Wire Wire Line
	6725 2025 7000 2025
Wire Wire Line
	6550 2025 6725 2025
Connection ~ 6550 2025
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 60AD23EC
P 5650 900
AR Path="/60AD23EC" Ref="J?"  Part="1" 
AR Path="/60A5B260/60AD23EC" Ref="J14"  Part="1" 
F 0 "J14" H 5775 800 50  0000 C CNN
F 1 "PWR" H 5825 900 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5650 900 50  0001 C CNN
F 3 "~" H 5650 900 50  0001 C CNN
	1    5650 900 
	-1   0    0    1   
$EndComp
Text GLabel 6400 1650 0    50   Input ~ 0
AC2
Wire Wire Line
	6450 1600 6450 1650
Text GLabel 6000 900  2    50   Input ~ 0
AC2
Wire Wire Line
	5850 900  6000 900 
$Comp
L power:GND #PWR?
U 1 1 60AD23F8
P 1800 1325
AR Path="/60AD23F8" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD23F8" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 1800 1075 50  0001 C CNN
F 1 "GND" H 1805 1152 50  0000 C CNN
F 2 "" H 1800 1325 50  0001 C CNN
F 3 "" H 1800 1325 50  0001 C CNN
	1    1800 1325
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60AD2400
P 1975 2100
AR Path="/60AD2400" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2400" Ref="R43"  Part="1" 
F 0 "R43" V 1900 2125 50  0000 C CNN
F 1 "25R" V 2050 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Box_L8.4mm_W2.5mm_P5.08mm" H 1975 2100 50  0001 C CNN
F 3 "~" H 1975 2100 50  0001 C CNN
	1    1975 2100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q?
U 1 1 60AD240C
P 1875 2525
AR Path="/60AD240C" Ref="Q?"  Part="1" 
AR Path="/60A5B260/60AD240C" Ref="Q6"  Part="1" 
F 0 "Q6" H 1800 2725 50  0000 L CNN
F 1 "IRF540N" H 1575 2650 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2125 2450 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 1875 2525 50  0001 L CNN
	1    1875 2525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AD2412
P 1975 2800
AR Path="/60AD2412" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD2412" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 1975 2550 50  0001 C CNN
F 1 "GND" H 1980 2627 50  0000 C CNN
F 2 "" H 1975 2800 50  0001 C CNN
F 3 "" H 1975 2800 50  0001 C CNN
	1    1975 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1975 2725 1975 2800
Wire Wire Line
	1975 2200 1975 2325
Connection ~ 3875 1900
Wire Wire Line
	3175 1900 3100 1900
$Comp
L Device:R_Small R?
U 1 1 60AD2428
P 1425 2525
AR Path="/60AD2428" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2428" Ref="R46"  Part="1" 
F 0 "R46" V 1350 2525 50  0000 C CNN
F 1 "10K" V 1500 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 1425 2525 50  0001 C CNN
F 3 "~" H 1425 2525 50  0001 C CNN
	1    1425 2525
	0    1    1    0   
$EndComp
Wire Wire Line
	3375 2300 3375 2200
Text GLabel 2050 1350 2    50   Input ~ 0
VBAT
$Comp
L Device:R_Small R?
U 1 1 60AD2437
P 3650 2125
AR Path="/60AD2437" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2437" Ref="R42"  Part="1" 
F 0 "R42" V 3725 2125 50  0000 C CNN
F 1 "100K" V 3550 2125 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 3650 2125 50  0001 C CNN
F 3 "~" H 3650 2125 50  0001 C CNN
	1    3650 2125
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:BC337 Q?
U 1 1 60AD2440
P 2900 2625
AR Path="/60AD2440" Ref="Q?"  Part="1" 
AR Path="/60A5B260/60AD2440" Ref="Q7"  Part="1" 
F 0 "Q7" H 3091 2671 50  0000 L CNN
F 1 "BC337" H 3091 2580 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3100 2550 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 2900 2625 50  0001 L CNN
	1    2900 2625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AD2449
P 3000 2875
AR Path="/60AD2449" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AD2449" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 3000 2625 50  0001 C CNN
F 1 "GND" H 3005 2702 50  0000 C CNN
F 2 "" H 3000 2875 50  0001 C CNN
F 3 "" H 3000 2875 50  0001 C CNN
	1    3000 2875
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60AD2450
P 2300 2450
AR Path="/60AD2450" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2450" Ref="R45"  Part="1" 
F 0 "R45" V 2225 2450 50  0000 C CNN
F 1 "200R" V 2375 2450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 2300 2450 50  0001 C CNN
F 3 "~" H 2300 2450 50  0001 C CNN
	1    2300 2450
	1    0    0    -1  
$EndComp
Text GLabel 2300 2225 1    50   Input ~ 0
VBAT_DIS
Connection ~ 8450 1000
Wire Wire Line
	7450 1000 7775 1000
Text GLabel 7375 1175 0    50   Input ~ 0
VIN
Wire Wire Line
	7375 1175 7450 1175
Connection ~ 7450 1175
Wire Wire Line
	7450 1175 7450 1000
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 60AEC023
P 9775 5825
AR Path="/60AEC023" Ref="H?"  Part="1" 
AR Path="/60A5B260/60AEC023" Ref="H1"  Part="1" 
F 0 "H1" H 9875 5874 50  0000 L CNN
F 1 "GND" H 9875 5783 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 9775 5825 50  0001 C CNN
F 3 "~" H 9775 5825 50  0001 C CNN
	1    9775 5825
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 60AEC029
P 10125 5825
AR Path="/60AEC029" Ref="H?"  Part="1" 
AR Path="/60A5B260/60AEC029" Ref="H2"  Part="1" 
F 0 "H2" H 10225 5874 50  0000 L CNN
F 1 "GND" H 10225 5783 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 10125 5825 50  0001 C CNN
F 3 "~" H 10125 5825 50  0001 C CNN
	1    10125 5825
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 60AEC02F
P 10475 5825
AR Path="/60AEC02F" Ref="H?"  Part="1" 
AR Path="/60A5B260/60AEC02F" Ref="H3"  Part="1" 
F 0 "H3" H 10575 5874 50  0000 L CNN
F 1 "GND" H 10575 5783 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 10475 5825 50  0001 C CNN
F 3 "~" H 10475 5825 50  0001 C CNN
	1    10475 5825
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H?
U 1 1 60AEC035
P 10850 5825
AR Path="/60AEC035" Ref="H?"  Part="1" 
AR Path="/60A5B260/60AEC035" Ref="H4"  Part="1" 
F 0 "H4" H 10950 5874 50  0000 L CNN
F 1 "GND" H 10950 5783 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 10850 5825 50  0001 C CNN
F 3 "~" H 10850 5825 50  0001 C CNN
	1    10850 5825
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AEC03B
P 10300 6200
AR Path="/60AEC03B" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60AEC03B" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 10300 5950 50  0001 C CNN
F 1 "GND" H 10305 6027 50  0000 C CNN
F 2 "" H 10300 6200 50  0001 C CNN
F 3 "" H 10300 6200 50  0001 C CNN
	1    10300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9775 5925 9775 6125
Wire Wire Line
	10850 6125 10850 5925
Wire Wire Line
	10300 6200 10300 6125
Connection ~ 10300 6125
Wire Wire Line
	10125 5925 10125 6125
Wire Wire Line
	9775 6125 10125 6125
Connection ~ 10125 6125
Wire Wire Line
	10125 6125 10300 6125
Wire Wire Line
	10475 5925 10475 6125
Wire Wire Line
	10300 6125 10475 6125
Connection ~ 10475 6125
Wire Wire Line
	10475 6125 10850 6125
Text GLabel 6900 5675 2    50   Input ~ 0
VPWR_MON
$Comp
L Amplifier_Operational:LM324 U?
U 3 1 60B08703
P 6375 5675
AR Path="/60B08703" Ref="U?"  Part="3" 
AR Path="/60A5B260/60B08703" Ref="U11"  Part="3" 
F 0 "U11" H 6375 6042 50  0000 C CNN
F 1 "LM324" H 6375 5951 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 6325 5775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 6425 5875 50  0001 C CNN
	3    6375 5675
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B08710
P 4775 5550
AR Path="/60B08710" Ref="C?"  Part="1" 
AR Path="/60A5B260/60B08710" Ref="C35"  Part="1" 
F 0 "C35" H 4600 5650 50  0000 L CNN
F 1 "100n" H 4500 5550 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4775 5550 50  0001 C CNN
F 3 "~" H 4775 5550 50  0001 C CNN
	1    4775 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4775 5450 4775 5250
Connection ~ 4975 5250
Wire Wire Line
	4975 5250 4975 5275
$Comp
L Device:R_Small R?
U 1 1 60B0871D
P 6350 6100
AR Path="/60B0871D" Ref="R?"  Part="1" 
AR Path="/60A5B260/60B0871D" Ref="R52"  Part="1" 
F 0 "R52" V 6275 6075 50  0000 C CNN
F 1 "1.8K" V 6425 6100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 6350 6100 50  0001 C CNN
F 3 "~" H 6350 6100 50  0001 C CNN
	1    6350 6100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B08723
P 5525 6200
AR Path="/60B08723" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60B08723" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 5525 5950 50  0001 C CNN
F 1 "GND" H 5530 6027 50  0000 C CNN
F 2 "" H 5525 6200 50  0001 C CNN
F 3 "" H 5525 6200 50  0001 C CNN
	1    5525 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60B08729
P 5300 5250
AR Path="/60B08729" Ref="R?"  Part="1" 
AR Path="/60A5B260/60B08729" Ref="R47"  Part="1" 
F 0 "R47" V 5225 5225 50  0000 C CNN
F 1 "10K" V 5375 5250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 5300 5250 50  0001 C CNN
F 3 "~" H 5300 5250 50  0001 C CNN
	1    5300 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60B0872F
P 5525 5950
AR Path="/60B0872F" Ref="C?"  Part="1" 
AR Path="/60A5B260/60B0872F" Ref="C36"  Part="1" 
F 0 "C36" H 5350 6050 50  0000 L CNN
F 1 "100n" H 5250 5950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5525 5950 50  0001 C CNN
F 3 "~" H 5525 5950 50  0001 C CNN
	1    5525 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4975 5250 5200 5250
Wire Wire Line
	5400 5250 5525 5250
Wire Wire Line
	5525 5250 5525 5775
Wire Wire Line
	5525 5775 5875 5775
$Comp
L power:GND #PWR?
U 1 1 60B08739
P 5725 5375
AR Path="/60B08739" Ref="#PWR?"  Part="1" 
AR Path="/60A5B260/60B08739" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 5725 5125 50  0001 C CNN
F 1 "GND" H 5730 5202 50  0000 C CNN
F 2 "" H 5725 5375 50  0001 C CNN
F 3 "" H 5725 5375 50  0001 C CNN
	1    5725 5375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 5575 5925 5575
Wire Wire Line
	5925 5575 5925 5250
Wire Wire Line
	5925 5250 5725 5250
Wire Wire Line
	5725 5250 5725 5375
Wire Wire Line
	6675 5675 6775 5675
Wire Wire Line
	6450 6100 6775 6100
Wire Wire Line
	6775 6100 6775 5675
Wire Wire Line
	5875 5775 5875 6100
Connection ~ 5875 5775
Wire Wire Line
	5875 5775 6075 5775
Wire Wire Line
	5875 6100 6250 6100
Wire Wire Line
	5525 5775 5525 5850
Connection ~ 5525 5775
Wire Wire Line
	5525 6050 5525 6150
Wire Wire Line
	6775 5675 6900 5675
Connection ~ 6775 5675
$Comp
L Amplifier_Operational:LM324 U?
U 5 1 60B0874F
P 5075 5575
AR Path="/60B0874F" Ref="U?"  Part="5" 
AR Path="/60A5B260/60B0874F" Ref="U11"  Part="5" 
F 0 "U11" H 5033 5621 50  0000 L CNN
F 1 "LM324" H 5033 5530 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5025 5675 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 5125 5775 50  0001 C CNN
	5    5075 5575
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60B08755
P 4400 5400
AR Path="/60B08755" Ref="R?"  Part="1" 
AR Path="/60A5B260/60B08755" Ref="R49"  Part="1" 
F 0 "R49" H 4400 5125 50  0000 C CNN
F 1 "330R" H 4375 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 4400 5400 50  0001 C CNN
F 3 "~" H 4400 5400 50  0001 C CNN
	1    4400 5400
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 60B0875B
P 4400 5700
AR Path="/60B0875B" Ref="D?"  Part="1" 
AR Path="/60A5B260/60B0875B" Ref="D6"  Part="1" 
F 0 "D6" V 4400 5625 50  0000 R CNN
F 1 "PWR" V 4325 5600 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 4400 5700 50  0001 C CNN
F 3 "~" H 4400 5700 50  0001 C CNN
	1    4400 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 5250 4775 5250
Connection ~ 4775 5250
Wire Wire Line
	4775 5250 4975 5250
Wire Wire Line
	4400 5250 4400 5300
Wire Wire Line
	4400 5500 4400 5550
Text GLabel 4825 5075 0    50   Input ~ 0
VIN
Wire Wire Line
	4825 5075 4975 5075
Wire Wire Line
	4975 5075 4975 5250
Wire Wire Line
	10375 1150 10575 1150
Connection ~ 10375 1150
Wire Wire Line
	10375 1150 10375 1000
Text GLabel 8075 1500 3    50   Input ~ 0
VBAT_ADJ
Text GLabel 3600 5525 2    50   Input ~ 0
VBAT_ADJ
Wire Wire Line
	3500 5525 3600 5525
Connection ~ 3500 5525
Wire Wire Line
	4400 6150 4775 6150
Wire Wire Line
	4400 5850 4400 6150
Connection ~ 5525 6150
Wire Wire Line
	5525 6150 5525 6200
Wire Wire Line
	4975 5875 4975 6150
Connection ~ 4975 6150
Wire Wire Line
	4975 6150 5525 6150
Wire Wire Line
	4775 5650 4775 6150
Connection ~ 4775 6150
Wire Wire Line
	4775 6150 4975 6150
Connection ~ 9825 1000
Wire Wire Line
	9825 1000 9525 1000
Wire Wire Line
	6100 1300 6100 2025
Wire Wire Line
	6100 2025 6550 2025
Wire Wire Line
	6400 1650 6450 1650
Connection ~ 4825 2875
Wire Wire Line
	3575 1900 3650 1900
Wire Wire Line
	2050 1350 1975 1350
Wire Wire Line
	3000 2300 3000 2425
Wire Wire Line
	1525 2525 1675 2525
Wire Wire Line
	1325 2525 1175 2525
Text GLabel 1175 2525 0    50   Input ~ 0
VBAT_TEST
Wire Wire Line
	3875 1900 4375 1900
Wire Wire Line
	1975 1350 1975 1550
Connection ~ 1975 1550
Wire Wire Line
	1975 1550 1975 2000
Wire Wire Line
	5850 800  6450 800 
Wire Wire Line
	6450 800  6450 1000
$Comp
L Device:D_Small D5
U 1 1 60A9E8B4
P 4325 2225
F 0 "D5" H 4425 2150 50  0000 C CNN
F 1 "1N5408RL" H 4325 2325 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" V 4325 2225 50  0001 C CNN
F 3 "~" V 4325 2225 50  0001 C CNN
	1    4325 2225
	-1   0    0    1   
$EndComp
Wire Wire Line
	3875 2875 4475 2875
Wire Wire Line
	3875 1900 3875 2225
Wire Wire Line
	3875 2225 4225 2225
Connection ~ 3875 2225
Wire Wire Line
	3875 2225 3875 2325
Wire Wire Line
	4425 2225 4500 2225
Connection ~ 4625 2225
Wire Wire Line
	1975 1350 1975 1150
Wire Wire Line
	1975 1150 1700 1150
Connection ~ 1975 1350
Wire Wire Line
	1700 1250 1800 1250
Wire Wire Line
	1800 1250 1800 1325
Wire Wire Line
	4825 2225 5675 2225
Wire Wire Line
	5675 2225 5675 2375
Wire Wire Line
	5675 2375 5575 2375
Connection ~ 4825 2225
Wire Wire Line
	5675 2875 5675 2475
Wire Wire Line
	5675 2475 5575 2475
Wire Wire Line
	4825 2875 5675 2875
Wire Wire Line
	9450 1000 9525 1000
Wire Wire Line
	9150 1000 9450 1000
Connection ~ 9450 1000
Wire Wire Line
	8450 1000 8825 1000
Wire Wire Line
	8075 1300 8075 1375
Wire Wire Line
	8075 1375 8450 1375
Wire Wire Line
	8450 1375 8450 1300
Connection ~ 8075 1375
Wire Wire Line
	8075 1375 8075 1500
$Comp
L Device:C_Small C?
U 1 1 60B1614C
P 8825 1200
AR Path="/60B1614C" Ref="C?"  Part="1" 
AR Path="/60A5B260/60B1614C" Ref="C16"  Part="1" 
F 0 "C16" H 8900 1275 50  0000 L CNN
F 1 "100n" H 8900 1125 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 8825 1200 50  0001 C CNN
F 3 "~" H 8825 1200 50  0001 C CNN
	1    8825 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1375 8825 1375
Wire Wire Line
	8825 1375 8825 1300
Connection ~ 8450 1375
Wire Wire Line
	8825 1100 8825 1000
Connection ~ 8825 1000
Wire Wire Line
	8825 1000 8950 1000
$Comp
L power:+12V #PWR0120
U 1 1 60D1FD1A
P 4500 2225
F 0 "#PWR0120" H 4500 2075 50  0001 C CNN
F 1 "+12V" H 4515 2398 50  0000 C CNN
F 2 "" H 4500 2225 50  0001 C CNN
F 3 "" H 4500 2225 50  0001 C CNN
	1    4500 2225
	1    0    0    -1  
$EndComp
Connection ~ 4500 2225
Wire Wire Line
	4500 2225 4625 2225
$Comp
L Device:R_Small R?
U 1 1 60AD2422
P 2550 2850
AR Path="/60AD2422" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AD2422" Ref="R44"  Part="1" 
F 0 "R44" V 2475 2825 50  0000 C CNN
F 1 "100K" V 2625 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 2550 2850 50  0001 C CNN
F 3 "~" H 2550 2850 50  0001 C CNN
	1    2550 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 2300 3075 2300
Wire Wire Line
	3000 2825 3000 2850
Wire Wire Line
	2300 2550 2300 2625
Wire Wire Line
	2300 2225 2300 2350
$Comp
L Transistor_FET:IRF9540N Q?
U 1 1 60AD2406
P 3375 2000
AR Path="/60AD2406" Ref="Q?"  Part="1" 
AR Path="/60A5B260/60AD2406" Ref="Q5"  Part="1" 
F 0 "Q5" V 3717 2000 50  0000 C CNN
F 1 "IRF9540N" V 3626 2000 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3575 1925 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf9540n.pdf" H 3375 2000 50  0001 L CNN
	1    3375 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 2625 2300 2850
Wire Wire Line
	2300 2850 2450 2850
Connection ~ 2300 2625
Wire Wire Line
	2650 2850 3000 2850
Connection ~ 3000 2850
Wire Wire Line
	3000 2850 3000 2875
Wire Wire Line
	3100 1900 3100 1550
Wire Wire Line
	1975 1550 3100 1550
Wire Wire Line
	3650 2025 3650 1900
Connection ~ 3650 1900
Wire Wire Line
	3650 1900 3875 1900
Wire Wire Line
	3375 2300 3650 2300
Wire Wire Line
	3650 2300 3650 2225
Connection ~ 3375 2300
Wire Wire Line
	2300 2625 2700 2625
$Comp
L Device:R_Small R?
U 1 1 60AF69F8
P 3175 2300
AR Path="/60AF69F8" Ref="R?"  Part="1" 
AR Path="/60A5B260/60AF69F8" Ref="R2"  Part="1" 
F 0 "R2" V 3100 2275 50  0000 C CNN
F 1 "4K7" V 3250 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 3175 2300 50  0001 C CNN
F 3 "~" H 3175 2300 50  0001 C CNN
	1    3175 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	3275 2300 3375 2300
$Comp
L Device:D_Zener_Small D2
U 1 1 60BCF8A8
P 1050 5475
F 0 "D2" V 1025 5400 50  0000 R CNN
F 1 "5V1" V 1100 5400 50  0000 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" V 1050 5475 50  0001 C CNN
F 3 "~" V 1050 5475 50  0001 C CNN
	1    1050 5475
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 5625 1300 5625
Connection ~ 1300 5625
Wire Wire Line
	1300 5625 1300 5675
Wire Wire Line
	725  5325 725  5250
Wire Wire Line
	725  5050 725  4925
Wire Wire Line
	725  5325 1050 5325
Wire Wire Line
	1050 5375 1050 5325
Connection ~ 1050 5325
Wire Wire Line
	1050 5325 1300 5325
Wire Wire Line
	1050 5575 1050 5625
$Comp
L Device:R_Small R?
U 1 1 60C2E674
P 1050 5075
AR Path="/60C2E674" Ref="R?"  Part="1" 
AR Path="/60A5B260/60C2E674" Ref="R4"  Part="1" 
F 0 "R4" H 950 5000 50  0000 C CNN
F 1 "100K" H 900 5075 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 1050 5075 50  0001 C CNN
F 3 "~" H 1050 5075 50  0001 C CNN
	1    1050 5075
	-1   0    0    1   
$EndComp
Wire Wire Line
	1050 5175 1050 5325
Text GLabel 1050 4850 1    50   Input ~ 0
VIN
Wire Wire Line
	1050 4850 1050 4975
$EndSCHEMATC
