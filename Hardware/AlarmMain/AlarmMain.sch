EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "Power and Charge"
Date "2021-05-01"
Rev "0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2300 1950 875  800 
U 60A409E3
F0 "IO" 50
F1 "IO.sch" 50
$EndSheet
$Sheet
S 1075 1950 875  800 
U 61086BEF
F0 "Device" 50
F1 "Device.sch" 50
$EndSheet
$Sheet
S 1075 900  875  825 
U 60A5B260
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
Wire Wire Line
	6125 7325 6125 7125
Text GLabel 6125 7325 3    50   Input ~ 0
LED1
Wire Wire Line
	6125 6450 6125 6250
$Comp
L power:+5V #PWR07
U 1 1 60AE6EBB
P 6125 6250
F 0 "#PWR07" H 6125 6100 50  0001 C CNN
F 1 "+5V" H 6140 6423 50  0000 C CNN
F 2 "" H 6125 6250 50  0001 C CNN
F 3 "" H 6125 6250 50  0001 C CNN
	1    6125 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 6650 6125 6825
$Comp
L Device:LED D1
U 1 1 60A52AE1
P 6125 6975
F 0 "D1" V 6164 6857 50  0000 R CNN
F 1 "LED" V 6073 6857 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 6125 6975 50  0001 C CNN
F 3 "~" H 6125 6975 50  0001 C CNN
	1    6125 6975
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60A50EAA
P 6125 6550
F 0 "R3" H 6000 6475 50  0000 C CNN
F 1 "330R" H 5975 6550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 6125 6550 50  0001 C CNN
F 3 "~" H 6125 6550 50  0001 C CNN
	1    6125 6550
	-1   0    0    1   
$EndComp
$Sheet
S 2300 900  875  825 
U 60A545DE
F0 "Inputs" 50
F1 "Inputs.sch" 50
$EndSheet
Wire Wire Line
	4250 6275 4250 6575
Wire Wire Line
	3975 6275 4250 6275
Wire Wire Line
	4650 6225 4650 6350
Connection ~ 4650 6225
Wire Wire Line
	3975 6375 4375 6375
Wire Wire Line
	4375 6225 4650 6225
Wire Wire Line
	4375 6375 4375 6225
Wire Wire Line
	4650 6075 4650 6225
$Comp
L power:GND #PWR02
U 1 1 6090E671
P 1800 3800
F 0 "#PWR02" H 1800 3550 50  0001 C CNN
F 1 "GND" H 1805 3627 50  0000 C CNN
F 2 "" H 1800 3800 50  0001 C CNN
F 3 "" H 1800 3800 50  0001 C CNN
	1    1800 3800
	1    0    0    -1  
$EndComp
Connection ~ 1800 3800
Wire Wire Line
	1700 3800 1800 3800
Wire Wire Line
	1800 3800 1900 3800
$Comp
L power:GND #PWR08
U 1 1 60A10160
P 1625 7425
F 0 "#PWR08" H 1625 7175 50  0001 C CNN
F 1 "GND" H 1630 7252 50  0000 C CNN
F 2 "" H 1625 7425 50  0001 C CNN
F 3 "" H 1625 7425 50  0001 C CNN
	1    1625 7425
	1    0    0    -1  
$EndComp
Wire Wire Line
	1625 7350 1625 7400
Connection ~ 1625 7400
$Comp
L power:+5V #PWR01
U 1 1 60A1929F
P 2050 3500
F 0 "#PWR01" H 2050 3350 50  0001 C CNN
F 1 "+5V" H 2065 3673 50  0000 C CNN
F 2 "" H 2050 3500 50  0001 C CNN
F 3 "" H 2050 3500 50  0001 C CNN
	1    2050 3500
	1    0    0    -1  
$EndComp
Connection ~ 2050 3500
Wire Wire Line
	1900 3500 2050 3500
Wire Wire Line
	2050 3500 2275 3500
$Comp
L Device:C_Small C2
U 1 1 60A2AE98
P 1900 3650
F 0 "C2" H 1992 3696 50  0000 L CNN
F 1 "100n" H 1992 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1900 3650 50  0001 C CNN
F 3 "~" H 1900 3650 50  0001 C CNN
	1    1900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 60A2BBDD
P 1700 3650
F 0 "C1" H 1550 3725 50  0000 L CNN
F 1 "100n" H 1425 3625 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1700 3650 50  0001 C CNN
F 3 "~" H 1700 3650 50  0001 C CNN
	1    1700 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3550 1700 3500
Wire Wire Line
	1700 3800 1700 3750
Wire Wire Line
	1700 3500 1900 3500
Connection ~ 1900 3500
Wire Wire Line
	1900 3550 1900 3500
Wire Wire Line
	1900 3800 1900 3750
$Comp
L Device:Crystal_Small Y1
U 1 1 60A6B555
P 3475 5350
F 0 "Y1" H 3200 5300 50  0000 L CNN
F 1 "20Mhz" H 3050 5375 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 3475 5350 50  0001 C CNN
F 3 "~" H 3475 5350 50  0001 C CNN
	1    3475 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 60A88675
P 3625 5600
F 0 "C6" H 3717 5646 50  0000 L CNN
F 1 "22p" H 3717 5555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3625 5600 50  0001 C CNN
F 3 "~" H 3625 5600 50  0001 C CNN
	1    3625 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 60A897D9
P 3300 5600
F 0 "C5" H 3392 5646 50  0000 L CNN
F 1 "22p" H 3392 5555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3300 5600 50  0001 C CNN
F 3 "~" H 3300 5600 50  0001 C CNN
	1    3300 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5700 3300 5775
Wire Wire Line
	3300 5775 3475 5775
Connection ~ 3475 5775
Wire Wire Line
	3625 5775 3625 5700
$Comp
L power:GND #PWR05
U 1 1 60AA69A0
P 3475 5850
F 0 "#PWR05" H 3475 5600 50  0001 C CNN
F 1 "GND" H 3480 5677 50  0000 C CNN
F 2 "" H 3475 5850 50  0001 C CNN
F 3 "" H 3475 5850 50  0001 C CNN
	1    3475 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3475 5850 3475 5775
Wire Wire Line
	3475 5775 3625 5775
$Comp
L power:GND #PWR09
U 1 1 60AE868F
P 4650 7450
F 0 "#PWR09" H 4650 7200 50  0001 C CNN
F 1 "GND" H 4655 7277 50  0000 C CNN
F 2 "" H 4650 7450 50  0001 C CNN
F 3 "" H 4650 7450 50  0001 C CNN
	1    4650 7450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 60AE8A13
P 4650 6075
F 0 "#PWR06" H 4650 5925 50  0001 C CNN
F 1 "+5V" H 4665 6248 50  0000 C CNN
F 2 "" H 4650 6075 50  0001 C CNN
F 3 "" H 4650 6075 50  0001 C CNN
	1    4650 6075
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 60AEA57F
P 4650 6450
F 0 "R1" H 4525 6350 50  0000 C CNN
F 1 "100K" H 4500 6450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 4650 6450 50  0001 C CNN
F 3 "~" H 4650 6450 50  0001 C CNN
	1    4650 6450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 6550 4650 6575
Text GLabel 4975 6575 2    50   Input ~ 0
RESET
Wire Wire Line
	2225 4650 2675 4650
Text GLabel 2675 4950 2    50   Input ~ 0
MOSI
Text GLabel 2675 5050 2    50   Input ~ 0
MISO
Text GLabel 2675 5150 2    50   Input ~ 0
SCK
Text GLabel 2675 5750 2    50   Input ~ 0
VPWR_MON
Text GLabel 2675 5850 2    50   Input ~ 0
VBAT_MON
Text GLabel 2675 5950 2    50   Input ~ 0
SDA
Text GLabel 2675 6050 2    50   Input ~ 0
SCL
Text GLabel 2675 6350 2    50   Input ~ 0
RXD
Text GLabel 2675 6450 2    50   Input ~ 0
TXD
Text GLabel 2675 6550 2    50   Input ~ 0
RTS
Text GLabel 2675 6650 2    50   Input ~ 0
RXD_2
Text GLabel 2675 6750 2    50   Input ~ 0
TXD_2
Text GLabel 2675 6850 2    50   Input ~ 0
PD5
Text GLabel 2675 6950 2    50   Input ~ 0
PD6
Text GLabel 2675 7050 2    50   Input ~ 0
IO_INT
Wire Wire Line
	2225 4950 2675 4950
Wire Wire Line
	2225 5050 2675 5050
Wire Wire Line
	2225 5150 2675 5150
Wire Wire Line
	2225 4750 2675 4750
Wire Wire Line
	2225 4850 2675 4850
Wire Wire Line
	2225 5550 2675 5550
Wire Wire Line
	2225 5650 2675 5650
Wire Wire Line
	2225 5750 2675 5750
Wire Wire Line
	2225 5850 2675 5850
Wire Wire Line
	2225 5950 2675 5950
Wire Wire Line
	2225 6050 2675 6050
Wire Wire Line
	2225 6350 2675 6350
Wire Wire Line
	2225 6450 2675 6450
Wire Wire Line
	2225 6550 2675 6550
Wire Wire Line
	2225 6750 2675 6750
Wire Wire Line
	2225 6850 2675 6850
Wire Wire Line
	2225 6950 2675 6950
Wire Wire Line
	2225 7050 2675 7050
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U1
U 1 1 60C445C9
P 1625 5850
F 0 "U1" H 1875 4375 50  0000 R CNN
F 1 "ATmega328P-PU" H 2400 4300 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 1625 5850 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 1625 5850 50  0001 C CNN
	1    1625 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2225 5350 3300 5350
Connection ~ 3300 5350
Wire Wire Line
	3300 5350 3300 5500
Wire Wire Line
	3625 5250 3625 5350
Connection ~ 3625 5350
Wire Wire Line
	2225 5250 3625 5250
Wire Wire Line
	3300 5350 3375 5350
Wire Wire Line
	3575 5350 3625 5350
Wire Wire Line
	3625 5350 3625 5500
Wire Wire Line
	1425 7350 1425 7400
Wire Wire Line
	1425 7400 1625 7400
Wire Wire Line
	1625 7400 1625 7425
$Comp
L Switch:SW_Push SW1
U 1 1 60D68395
P 4650 6775
F 0 "SW1" V 4575 6600 50  0000 L CNN
F 1 "RESET" V 4650 6575 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 4650 6975 50  0001 C CNN
F 3 "~" H 4650 6975 50  0001 C CNN
	1    4650 6775
	0    1    1    0   
$EndComp
Connection ~ 4650 6575
Wire Wire Line
	4250 6575 4650 6575
Wire Wire Line
	4650 6575 4975 6575
$Comp
L Device:C_Small C7
U 1 1 60D77D6D
P 4250 7225
F 0 "C7" H 4275 7300 50  0000 L CNN
F 1 "100n" H 4250 7150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4250 7225 50  0001 C CNN
F 3 "~" H 4250 7225 50  0001 C CNN
	1    4250 7225
	1    0    0    -1  
$EndComp
Text GLabel 2675 5650 2    50   Input ~ 0
VBAT_DIS
Text GLabel 2675 5550 2    50   Input ~ 0
VBAT_TEST
$Comp
L Device:C_Small C4
U 1 1 60E63FEC
P 800 4800
F 0 "C4" H 650 4875 50  0000 L CNN
F 1 "100n" H 525 4775 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 800 4800 50  0001 C CNN
F 3 "~" H 800 4800 50  0001 C CNN
	1    800  4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  4700 800  4650
Wire Wire Line
	800  4650 1025 4650
$Comp
L power:GND #PWR04
U 1 1 60E75896
P 800 4975
F 0 "#PWR04" H 800 4725 50  0001 C CNN
F 1 "GND" H 805 4802 50  0000 C CNN
F 2 "" H 800 4975 50  0001 C CNN
F 3 "" H 800 4975 50  0001 C CNN
	1    800  4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  4900 800  4975
$Comp
L Device:C_Small C3
U 1 1 60E87700
P 2350 4225
F 0 "C3" H 2200 4300 50  0000 L CNN
F 1 "100n" H 2075 4200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2350 4225 50  0001 C CNN
F 3 "~" H 2350 4225 50  0001 C CNN
	1    2350 4225
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Small L1
U 1 1 60E88C3E
P 2350 3975
F 0 "L1" H 2398 4021 50  0000 L CNN
F 1 "10u" H 2398 3930 50  0000 L CNN
F 2 "Inductor_THT:L_Axial_L5.3mm_D2.2mm_P7.62mm_Horizontal_Vishay_IM-1" H 2350 3975 50  0001 C CNN
F 3 "~" H 2350 3975 50  0001 C CNN
	1    2350 3975
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4075 2350 4100
$Comp
L power:GND #PWR03
U 1 1 60E9A384
P 2350 4375
F 0 "#PWR03" H 2350 4125 50  0001 C CNN
F 1 "GND" H 2355 4202 50  0000 C CNN
F 2 "" H 2350 4375 50  0001 C CNN
F 3 "" H 2350 4375 50  0001 C CNN
	1    2350 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4325 2350 4375
Wire Wire Line
	1725 4350 1725 4100
Wire Wire Line
	1725 4100 2350 4100
Connection ~ 2350 4100
Wire Wire Line
	2350 4100 2350 4125
Wire Wire Line
	1625 4350 1625 4025
Wire Wire Line
	1625 4025 2275 4025
Wire Wire Line
	2275 4025 2275 3800
Connection ~ 2275 3800
Wire Wire Line
	2350 3800 2350 3875
Wire Wire Line
	2275 3800 2350 3800
Wire Wire Line
	2275 3500 2275 3800
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6119F223
P 2850 4075
F 0 "#FLG01" H 2850 4150 50  0001 C CNN
F 1 "PWR_FLAG" H 2850 4248 50  0000 C CNN
F 2 "" H 2850 4075 50  0001 C CNN
F 3 "~" H 2850 4075 50  0001 C CNN
	1    2850 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4100 2850 4100
Wire Wire Line
	2850 4100 2850 4075
Text GLabel 2675 4850 2    50   Input ~ 0
VBAT_PWM
Text GLabel 2675 4750 2    50   Input ~ 0
RTS_2
Text GLabel 2675 4650 2    50   Input ~ 0
LED1
Wire Wire Line
	4650 7450 4650 7375
Connection ~ 4650 7375
Wire Wire Line
	4250 7000 4250 7125
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 60B420EA
P 3775 6375
F 0 "J1" H 3800 6550 50  0000 C CNN
F 1 "debugWIRE" V 3700 6400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3775 6375 50  0001 C CNN
F 3 "~" H 3775 6375 50  0001 C CNN
	1    3775 6375
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6575 4250 6800
Connection ~ 4250 6575
Wire Wire Line
	4250 6575 3200 6575
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 60C446BD
P 4250 6900
F 0 "JP2" V 4204 6975 50  0000 L CNN
F 1 "NC" V 4295 6975 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4250 6900 50  0001 C CNN
F 3 "~" H 4250 6900 50  0001 C CNN
	1    4250 6900
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 7375 4250 7375
Connection ~ 4250 7375
Wire Wire Line
	4650 7375 4650 6975
Wire Wire Line
	4250 7325 4250 7375
Wire Wire Line
	4250 7375 4075 7375
Wire Wire Line
	2225 6650 2675 6650
Wire Wire Line
	3200 6575 3200 6150
Wire Wire Line
	2225 6150 3200 6150
Wire Wire Line
	4075 7375 4075 6475
Wire Wire Line
	4075 6475 3975 6475
$EndSCHEMATC
