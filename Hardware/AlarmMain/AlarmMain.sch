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
S 9850 3050 875  800 
U 60A409E3
F0 "IO" 50
F1 "IO.sch" 50
$EndSheet
$Sheet
S 8625 3050 875  800 
U 61086BEF
F0 "Device" 50
F1 "Device.sch" 50
$EndSheet
$Sheet
S 8625 2000 875  825 
U 60A5B260
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
Wire Wire Line
	4950 5600 4850 5600
Wire Wire Line
	4950 6500 4950 5600
Wire Wire Line
	3100 5275 4075 5275
Wire Wire Line
	4075 5700 4075 5275
Wire Wire Line
	3100 5775 3550 5775
Wire Wire Line
	5125 6500 4950 6500
Wire Wire Line
	5125 6450 5125 6500
Wire Wire Line
	5525 6500 5525 6100
Connection ~ 5125 6500
Wire Wire Line
	5525 6500 5125 6500
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 60C446BD
P 5125 6025
F 0 "JP2" V 5079 6100 50  0000 L CNN
F 1 "NC" V 5170 6100 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5125 6025 50  0001 C CNN
F 3 "~" H 5125 6025 50  0001 C CNN
	1    5125 6025
	0    1    1    0   
$EndComp
Wire Wire Line
	5125 5700 4075 5700
Connection ~ 5125 5700
Wire Wire Line
	5125 5700 5125 5925
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 60B420EA
P 4650 5500
F 0 "J1" H 4675 5675 50  0000 C CNN
F 1 "debugWIRE" V 4575 5525 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4650 5500 50  0001 C CNN
F 3 "~" H 4650 5500 50  0001 C CNN
	1    4650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5125 6125 5125 6250
Connection ~ 5525 6500
Wire Wire Line
	5525 6575 5525 6500
Text GLabel 3550 3775 2    50   Input ~ 0
LED1
Text GLabel 3550 3875 2    50   Input ~ 0
LED2
Text GLabel 3550 3975 2    50   Input ~ 0
VBAT_PWM
Wire Wire Line
	3725 3225 3725 3200
Wire Wire Line
	3225 3225 3725 3225
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6119F223
P 3725 3200
F 0 "#FLG01" H 3725 3275 50  0001 C CNN
F 1 "PWR_FLAG" H 3725 3373 50  0000 C CNN
F 2 "" H 3725 3200 50  0001 C CNN
F 3 "~" H 3725 3200 50  0001 C CNN
	1    3725 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2625 3150 2925
Wire Wire Line
	3150 2925 3225 2925
Wire Wire Line
	3225 2925 3225 3000
Connection ~ 3150 2925
Wire Wire Line
	3150 3150 3150 2925
Wire Wire Line
	2500 3150 3150 3150
Wire Wire Line
	2500 3475 2500 3150
Wire Wire Line
	3225 3225 3225 3250
Connection ~ 3225 3225
Wire Wire Line
	2600 3225 3225 3225
Wire Wire Line
	2600 3475 2600 3225
Wire Wire Line
	3225 3450 3225 3500
$Comp
L power:GND #PWR03
U 1 1 60E9A384
P 3225 3500
F 0 "#PWR03" H 3225 3250 50  0001 C CNN
F 1 "GND" H 3230 3327 50  0000 C CNN
F 2 "" H 3225 3500 50  0001 C CNN
F 3 "" H 3225 3500 50  0001 C CNN
	1    3225 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3225 3200 3225 3225
$Comp
L Device:L_Small L1
U 1 1 60E88C3E
P 3225 3100
F 0 "L1" H 3273 3146 50  0000 L CNN
F 1 "10u" H 3273 3055 50  0000 L CNN
F 2 "Inductor_THT:L_Axial_L5.3mm_D2.2mm_P7.62mm_Horizontal_Vishay_IM-1" H 3225 3100 50  0001 C CNN
F 3 "~" H 3225 3100 50  0001 C CNN
	1    3225 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60E87700
P 3225 3350
F 0 "C3" H 3075 3425 50  0000 L CNN
F 1 "100n" H 2950 3325 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3225 3350 50  0001 C CNN
F 3 "~" H 3225 3350 50  0001 C CNN
	1    3225 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1675 4025 1675 4100
$Comp
L power:GND #PWR04
U 1 1 60E75896
P 1675 4100
F 0 "#PWR04" H 1675 3850 50  0001 C CNN
F 1 "GND" H 1680 3927 50  0000 C CNN
F 2 "" H 1675 4100 50  0001 C CNN
F 3 "" H 1675 4100 50  0001 C CNN
	1    1675 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1675 3775 1900 3775
Wire Wire Line
	1675 3825 1675 3775
$Comp
L Device:C_Small C4
U 1 1 60E63FEC
P 1675 3925
F 0 "C4" H 1525 4000 50  0000 L CNN
F 1 "100n" H 1400 3900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1675 3925 50  0001 C CNN
F 3 "~" H 1675 3925 50  0001 C CNN
	1    1675 3925
	1    0    0    -1  
$EndComp
Text GLabel 3550 4675 2    50   Input ~ 0
VBAT_DIS
Text GLabel 3550 4775 2    50   Input ~ 0
VBAT_TEST
$Comp
L Device:C_Small C7
U 1 1 60D77D6D
P 5125 6350
F 0 "C7" H 5150 6425 50  0000 L CNN
F 1 "100n" H 5125 6275 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5125 6350 50  0001 C CNN
F 3 "~" H 5125 6350 50  0001 C CNN
	1    5125 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5525 5700 5850 5700
Wire Wire Line
	5125 5700 5525 5700
Connection ~ 5525 5700
$Comp
L Switch:SW_Push SW1
U 1 1 60D68395
P 5525 5900
F 0 "SW1" V 5450 5725 50  0000 L CNN
F 1 "RESET" V 5525 5700 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 5525 6100 50  0001 C CNN
F 3 "~" H 5525 6100 50  0001 C CNN
	1    5525 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 6525 2500 6550
Wire Wire Line
	2300 6525 2500 6525
Wire Wire Line
	2300 6475 2300 6525
Wire Wire Line
	4500 4475 4500 4625
Wire Wire Line
	4450 4475 4500 4475
Wire Wire Line
	4175 4475 4250 4475
Wire Wire Line
	3100 4375 4500 4375
Connection ~ 4500 4475
Wire Wire Line
	4500 4375 4500 4475
Wire Wire Line
	4175 4475 4175 4625
Connection ~ 4175 4475
Wire Wire Line
	3100 4475 4175 4475
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U1
U 1 1 60C445C9
P 2500 4975
F 0 "U1" H 2750 3500 50  0000 R CNN
F 1 "ATmega328P-PU" H 3275 3425 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2500 4975 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2500 4975 50  0001 C CNN
	1    2500 4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6175 3550 6175
Wire Wire Line
	3100 6075 3550 6075
Wire Wire Line
	3100 5975 3550 5975
Wire Wire Line
	3100 5875 3550 5875
Wire Wire Line
	3100 5675 3550 5675
Wire Wire Line
	3100 5575 3550 5575
Wire Wire Line
	3100 5475 3550 5475
Wire Wire Line
	3100 5175 3550 5175
Wire Wire Line
	3100 5075 3550 5075
Wire Wire Line
	3100 4975 3550 4975
Wire Wire Line
	3100 4875 3550 4875
Wire Wire Line
	3100 4775 3550 4775
Wire Wire Line
	3100 4675 3550 4675
Wire Wire Line
	3100 3975 3550 3975
Wire Wire Line
	3100 3875 3550 3875
Wire Wire Line
	3100 4275 3550 4275
Wire Wire Line
	3100 4175 3550 4175
Wire Wire Line
	3100 4075 3550 4075
Text GLabel 3550 6175 2    50   Input ~ 0
IO_INT
Text GLabel 3550 6075 2    50   Input ~ 0
PD6
Text GLabel 3550 5975 2    50   Input ~ 0
PD5
Text GLabel 3550 5875 2    50   Input ~ 0
ONEWIRE
Text GLabel 3550 5775 2    50   Input ~ 0
TEMP_INT
Text GLabel 3550 5675 2    50   Input ~ 0
RTS
Text GLabel 3550 5575 2    50   Input ~ 0
TXD
Text GLabel 3550 5475 2    50   Input ~ 0
RXD
Text GLabel 3550 5175 2    50   Input ~ 0
SCL
Text GLabel 3550 5075 2    50   Input ~ 0
SDA
Text GLabel 3550 4975 2    50   Input ~ 0
VPWR_MON
Text GLabel 3550 4875 2    50   Input ~ 0
VBAT_MON
Text GLabel 3550 4275 2    50   Input ~ 0
SCK
Text GLabel 3550 4175 2    50   Input ~ 0
MISO
Text GLabel 3550 4075 2    50   Input ~ 0
MOSI
Wire Wire Line
	3100 3775 3550 3775
Text GLabel 5850 5700 2    50   Input ~ 0
RESET
Wire Wire Line
	5525 5675 5525 5700
$Comp
L Device:R_Small R1
U 1 1 60AEA57F
P 5525 5575
F 0 "R1" H 5400 5475 50  0000 C CNN
F 1 "100K" H 5375 5575 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 5525 5575 50  0001 C CNN
F 3 "~" H 5525 5575 50  0001 C CNN
	1    5525 5575
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 60AE8A13
P 5525 5200
F 0 "#PWR06" H 5525 5050 50  0001 C CNN
F 1 "+5V" H 5540 5373 50  0000 C CNN
F 2 "" H 5525 5200 50  0001 C CNN
F 3 "" H 5525 5200 50  0001 C CNN
	1    5525 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60AE868F
P 5525 6575
F 0 "#PWR09" H 5525 6325 50  0001 C CNN
F 1 "GND" H 5530 6402 50  0000 C CNN
F 2 "" H 5525 6575 50  0001 C CNN
F 3 "" H 5525 6575 50  0001 C CNN
	1    5525 6575
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4900 4500 4900
Wire Wire Line
	4350 4975 4350 4900
$Comp
L power:GND #PWR05
U 1 1 60AA69A0
P 4350 4975
F 0 "#PWR05" H 4350 4725 50  0001 C CNN
F 1 "GND" H 4355 4802 50  0000 C CNN
F 2 "" H 4350 4975 50  0001 C CNN
F 3 "" H 4350 4975 50  0001 C CNN
	1    4350 4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4900 4500 4825
Connection ~ 4350 4900
Wire Wire Line
	4175 4900 4350 4900
Wire Wire Line
	4175 4825 4175 4900
$Comp
L Device:C_Small C5
U 1 1 60A897D9
P 4175 4725
F 0 "C5" H 4267 4771 50  0000 L CNN
F 1 "22p" H 4267 4680 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4175 4725 50  0001 C CNN
F 3 "~" H 4175 4725 50  0001 C CNN
	1    4175 4725
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 60A88675
P 4500 4725
F 0 "C6" H 4592 4771 50  0000 L CNN
F 1 "22p" H 4592 4680 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 4500 4725 50  0001 C CNN
F 3 "~" H 4500 4725 50  0001 C CNN
	1    4500 4725
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 60A6B555
P 4350 4475
F 0 "Y1" H 4075 4425 50  0000 L CNN
F 1 "20Mhz" H 3925 4500 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 4350 4475 50  0001 C CNN
F 3 "~" H 4350 4475 50  0001 C CNN
	1    4350 4475
	-1   0    0    1   
$EndComp
Wire Wire Line
	2775 2925 2775 2875
Wire Wire Line
	2775 2675 2775 2625
Connection ~ 2775 2625
Wire Wire Line
	2575 2625 2775 2625
Wire Wire Line
	2575 2925 2575 2875
Wire Wire Line
	2575 2675 2575 2625
$Comp
L Device:C_Small C1
U 1 1 60A2BBDD
P 2575 2775
F 0 "C1" H 2425 2850 50  0000 L CNN
F 1 "100n" H 2300 2750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2575 2775 50  0001 C CNN
F 3 "~" H 2575 2775 50  0001 C CNN
	1    2575 2775
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60A2AE98
P 2775 2775
F 0 "C2" H 2867 2821 50  0000 L CNN
F 1 "100n" H 2867 2730 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2775 2775 50  0001 C CNN
F 3 "~" H 2775 2775 50  0001 C CNN
	1    2775 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 2625 3150 2625
Wire Wire Line
	2775 2625 2925 2625
Connection ~ 2925 2625
$Comp
L power:+5V #PWR01
U 1 1 60A1929F
P 2925 2625
F 0 "#PWR01" H 2925 2475 50  0001 C CNN
F 1 "+5V" H 2940 2798 50  0000 C CNN
F 2 "" H 2925 2625 50  0001 C CNN
F 3 "" H 2925 2625 50  0001 C CNN
	1    2925 2625
	1    0    0    -1  
$EndComp
Connection ~ 2500 6525
Wire Wire Line
	2500 6475 2500 6525
$Comp
L power:GND #PWR08
U 1 1 60A10160
P 2500 6550
F 0 "#PWR08" H 2500 6300 50  0001 C CNN
F 1 "GND" H 2505 6377 50  0000 C CNN
F 2 "" H 2500 6550 50  0001 C CNN
F 3 "" H 2500 6550 50  0001 C CNN
	1    2500 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 2925 2775 2925
Wire Wire Line
	2575 2925 2675 2925
Connection ~ 2675 2925
$Comp
L power:GND #PWR02
U 1 1 6090E671
P 2675 2925
F 0 "#PWR02" H 2675 2675 50  0001 C CNN
F 1 "GND" H 2680 2752 50  0000 C CNN
F 2 "" H 2675 2925 50  0001 C CNN
F 3 "" H 2675 2925 50  0001 C CNN
	1    2675 2925
	1    0    0    -1  
$EndComp
Wire Wire Line
	1225 7300 1225 7100
Wire Wire Line
	875  7300 875  7100
Text GLabel 1225 7300 3    50   Input ~ 0
LED2
Text GLabel 875  7300 3    50   Input ~ 0
LED1
Wire Wire Line
	1225 6425 1225 6225
Wire Wire Line
	875  6425 875  6225
Wire Wire Line
	1050 6225 1225 6225
Wire Wire Line
	875  6225 1050 6225
Connection ~ 1050 6225
$Comp
L power:+5V #PWR07
U 1 1 60AE6EBB
P 1050 6225
F 0 "#PWR07" H 1050 6075 50  0001 C CNN
F 1 "+5V" H 1065 6398 50  0000 C CNN
F 2 "" H 1050 6225 50  0001 C CNN
F 3 "" H 1050 6225 50  0001 C CNN
	1    1050 6225
	1    0    0    -1  
$EndComp
Wire Wire Line
	1225 6625 1225 6800
Wire Wire Line
	875  6625 875  6800
$Comp
L Device:LED D2
U 1 1 60A538B1
P 1225 6950
F 0 "D2" V 1264 6832 50  0000 R CNN
F 1 "LED" V 1173 6832 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 1225 6950 50  0001 C CNN
F 3 "~" H 1225 6950 50  0001 C CNN
	1    1225 6950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D1
U 1 1 60A52AE1
P 875 6950
F 0 "D1" V 914 6832 50  0000 R CNN
F 1 "LED" V 823 6832 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 875 6950 50  0001 C CNN
F 3 "~" H 875 6950 50  0001 C CNN
	1    875  6950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60A51574
P 1225 6525
F 0 "R4" H 1100 6450 50  0000 C CNN
F 1 "330R" H 1075 6525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 1225 6525 50  0001 C CNN
F 3 "~" H 1225 6525 50  0001 C CNN
	1    1225 6525
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60A50EAA
P 875 6525
F 0 "R3" H 750 6450 50  0000 C CNN
F 1 "330R" H 725 6525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 875 6525 50  0001 C CNN
F 3 "~" H 875 6525 50  0001 C CNN
	1    875  6525
	-1   0    0    1   
$EndComp
$Sheet
S 9850 2000 875  825 
U 60A545DE
F0 "Inputs" 50
F1 "Inputs.sch" 50
$EndSheet
Wire Wire Line
	5525 5200 5525 5350
Wire Wire Line
	5250 5500 5250 5350
Wire Wire Line
	5250 5350 5525 5350
Wire Wire Line
	4850 5500 5250 5500
Connection ~ 5525 5350
Wire Wire Line
	5525 5350 5525 5475
Wire Wire Line
	4850 5400 5125 5400
Wire Wire Line
	5125 5400 5125 5700
$EndSCHEMATC
