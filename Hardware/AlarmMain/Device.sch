EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L MekatrolLibrary:STTS75 U?
U 1 1 610A994A
P 2100 4100
AR Path="/610A994A" Ref="U?"  Part="1" 
AR Path="/61086BEF/610A994A" Ref="U7"  Part="1" 
F 0 "U7" H 2150 4675 50  0000 L CNN
F 1 "STTS75" H 2150 4575 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2900 3650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX6369-MAX6374.pdf" H 2250 4600 50  0001 C CNN
	1    2100 4100
	1    0    0    -1  
$EndComp
$Comp
L Timer:MCP7940N-xSN U?
U 1 1 610EB641
P 2100 2100
AR Path="/610EB641" Ref="U?"  Part="1" 
AR Path="/61086BEF/610EB641" Ref="U6"  Part="1" 
F 0 "U6" H 1975 2575 50  0000 C CNN
F 1 "MCP7940N-xSN" H 1700 2475 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 2100 2100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005010F.pdf" H 2100 2100 50  0001 C CNN
	1    2100 2100
	1    0    0    -1  
$EndComp
Text GLabel 1550 1900 0    50   Input ~ 0
SCL
Text GLabel 1550 2000 0    50   Input ~ 0
SDA
Wire Wire Line
	1550 1900 1700 1900
Wire Wire Line
	1550 2000 1700 2000
$Comp
L power:GND #PWR?
U 1 1 610EB64B
P 2100 2575
AR Path="/610EB64B" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/610EB64B" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 2100 2325 50  0001 C CNN
F 1 "GND" H 2105 2402 50  0000 C CNN
F 2 "" H 2100 2575 50  0001 C CNN
F 3 "" H 2100 2575 50  0001 C CNN
	1    2100 2575
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2500 2100 2575
$Comp
L power:+5V #PWR?
U 1 1 610EB652
P 2400 1275
AR Path="/610EB652" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/610EB652" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2400 1125 50  0001 C CNN
F 1 "+5V" H 2415 1448 50  0000 C CNN
F 2 "" H 2400 1275 50  0001 C CNN
F 3 "" H 2400 1275 50  0001 C CNN
	1    2400 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1275 2400 1275
Wire Wire Line
	2600 1400 2600 1275
Wire Wire Line
	2600 1600 2600 1675
$Comp
L power:GND #PWR?
U 1 1 610EB669
P 2600 1675
AR Path="/610EB669" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/610EB669" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 2600 1425 50  0001 C CNN
F 1 "GND" H 2605 1502 50  0000 C CNN
F 2 "" H 2600 1675 50  0001 C CNN
F 3 "" H 2600 1675 50  0001 C CNN
	1    2600 1675
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal_Small Y?
U 1 1 610EB674
P 2725 2100
AR Path="/610EB674" Ref="Y?"  Part="1" 
AR Path="/61086BEF/610EB674" Ref="Y2"  Part="1" 
F 0 "Y2" V 2775 1925 50  0000 L CNN
F 1 "32.768k" V 2700 1725 50  0000 L CNN
F 2 "Crystal:Crystal_AT310_D3.0mm_L10.0mm_Horizontal" H 2725 2100 50  0001 C CNN
F 3 "~" H 2725 2100 50  0001 C CNN
	1    2725 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 610EB67A
P 2725 2450
AR Path="/610EB67A" Ref="C?"  Part="1" 
AR Path="/61086BEF/610EB67A" Ref="C18"  Part="1" 
F 0 "C18" H 2550 2550 50  0000 L CNN
F 1 "10p" H 2450 2450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2725 2450 50  0001 C CNN
F 3 "~" H 2725 2450 50  0001 C CNN
	1    2725 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 610EB680
P 3100 2450
AR Path="/610EB680" Ref="C?"  Part="1" 
AR Path="/61086BEF/610EB680" Ref="C19"  Part="1" 
F 0 "C19" H 2925 2550 50  0000 L CNN
F 1 "10p" H 2825 2450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3100 2450 50  0001 C CNN
F 3 "~" H 3100 2450 50  0001 C CNN
	1    3100 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610EB686
P 2900 2625
AR Path="/610EB686" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/610EB686" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 2900 2375 50  0001 C CNN
F 1 "GND" H 2905 2452 50  0000 C CNN
F 2 "" H 2900 2625 50  0001 C CNN
F 3 "" H 2900 2625 50  0001 C CNN
	1    2900 2625
	1    0    0    -1  
$EndComp
Wire Wire Line
	2725 2550 2725 2625
Wire Wire Line
	2725 2625 2900 2625
Wire Wire Line
	2900 2625 3100 2625
Wire Wire Line
	3100 2625 3100 2550
Connection ~ 2900 2625
Wire Wire Line
	3100 2350 3100 2000
Wire Wire Line
	3100 2000 2725 2000
Wire Wire Line
	2725 2000 2500 2000
Connection ~ 2725 2000
Wire Wire Line
	2500 2200 2725 2200
Wire Wire Line
	2725 2200 2725 2350
Connection ~ 2725 2200
Connection ~ 2400 1275
Wire Wire Line
	2400 1275 2600 1275
Wire Wire Line
	2200 1275 2200 1700
Text GLabel 1575 2200 0    50   Input ~ 0
MFP
Wire Wire Line
	1575 2200 1700 2200
Text GLabel 10050 1625 2    50   Input ~ 0
ONEWIRE
$Comp
L Sensor_Temperature:DS18B20 U?
U 1 1 6110A047
P 9550 1625
AR Path="/6110A047" Ref="U?"  Part="1" 
AR Path="/61086BEF/6110A047" Ref="U5"  Part="1" 
F 0 "U5" H 9320 1671 50  0000 R CNN
F 1 "DS18B20" H 9320 1580 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8550 1375 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 9400 1875 50  0001 C CNN
	1    9550 1625
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6110A04D
P 9550 2075
AR Path="/6110A04D" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/6110A04D" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 9550 1825 50  0001 C CNN
F 1 "GND" H 9555 1902 50  0000 C CNN
F 2 "" H 9550 2075 50  0001 C CNN
F 3 "" H 9550 2075 50  0001 C CNN
	1    9550 2075
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1225 9550 1325
Wire Wire Line
	9550 1925 9550 2075
$Comp
L Device:R_Small R?
U 1 1 6110A055
P 9925 1425
AR Path="/6110A055" Ref="R?"  Part="1" 
AR Path="/61086BEF/6110A055" Ref="R38"  Part="1" 
F 0 "R38" H 9800 1375 50  0000 C CNN
F 1 "4K7" H 9800 1475 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 9925 1425 50  0001 C CNN
F 3 "~" H 9925 1425 50  0001 C CNN
	1    9925 1425
	-1   0    0    1   
$EndComp
Wire Wire Line
	9925 1225 9550 1225
Wire Wire Line
	9850 1625 9925 1625
Wire Wire Line
	9925 1225 9925 1325
Wire Wire Line
	9925 1525 9925 1625
Connection ~ 9925 1625
Wire Wire Line
	9925 1625 10050 1625
$Comp
L power:+5V #PWR?
U 1 1 6110A061
P 9550 1225
AR Path="/6110A061" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/6110A061" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 9550 1075 50  0001 C CNN
F 1 "+5V" H 9565 1398 50  0000 C CNN
F 2 "" H 9550 1225 50  0001 C CNN
F 3 "" H 9550 1225 50  0001 C CNN
	1    9550 1225
	1    0    0    -1  
$EndComp
Connection ~ 9550 1225
Text GLabel 1000 6625 0    50   Input ~ 0
RXD
Text GLabel 1000 6775 0    50   Input ~ 0
RTS
Text GLabel 1000 6925 0    50   Input ~ 0
TXD
$Comp
L Interface_UART:MAX483E U?
U 1 1 61187FFD
P 1925 6725
AR Path="/61187FFD" Ref="U?"  Part="1" 
AR Path="/61086BEF/61187FFD" Ref="U9"  Part="1" 
F 0 "U9" H 2050 7275 50  0000 C CNN
F 1 "MAX483E" H 2200 7175 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1925 6025 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX1487E-MAX491E.pdf" H 1925 6775 50  0001 C CNN
	1    1925 6725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61188003
P 1925 7425
AR Path="/61188003" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/61188003" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 1925 7175 50  0001 C CNN
F 1 "GND" H 1930 7252 50  0000 C CNN
F 2 "" H 1925 7425 50  0001 C CNN
F 3 "" H 1925 7425 50  0001 C CNN
	1    1925 7425
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61188009
P 1925 5825
AR Path="/61188009" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/61188009" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 1925 5675 50  0001 C CNN
F 1 "+5V" H 1940 5998 50  0000 C CNN
F 2 "" H 1925 5825 50  0001 C CNN
F 3 "" H 1925 5825 50  0001 C CNN
	1    1925 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	1925 7325 1925 7375
$Comp
L Connector:Screw_Terminal_01x04 J?
U 1 1 61188010
P 2925 6700
AR Path="/61188010" Ref="J?"  Part="1" 
AR Path="/61086BEF/61188010" Ref="J13"  Part="1" 
F 0 "J13" H 3005 6692 50  0000 L CNN
F 1 "RS485" H 3005 6601 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4-5.08_1x04_P5.08mm_Horizontal" H 2925 6700 50  0001 C CNN
F 3 "~" H 2925 6700 50  0001 C CNN
	1    2925 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2325 6625 2450 6625
Wire Wire Line
	1925 7375 2725 7375
Wire Wire Line
	2725 7375 2725 6900
Connection ~ 1925 7375
Wire Wire Line
	1925 7375 1925 7425
$Comp
L power:+12P #PWR?
U 1 1 61188020
P 2725 6350
AR Path="/61188020" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/61188020" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 2725 6200 50  0001 C CNN
F 1 "+12P" H 2740 6523 50  0000 C CNN
F 2 "" H 2725 6350 50  0001 C CNN
F 3 "" H 2725 6350 50  0001 C CNN
	1    2725 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2725 6350 2725 6600
Wire Wire Line
	1000 6625 1525 6625
Wire Wire Line
	1000 6775 1425 6775
Wire Wire Line
	1425 6775 1425 6725
Wire Wire Line
	1425 6725 1525 6725
Wire Wire Line
	1425 6775 1425 6825
Wire Wire Line
	1425 6825 1525 6825
Connection ~ 1425 6775
Wire Wire Line
	1000 6925 1525 6925
$Comp
L Device:C_Small C?
U 1 1 6118802F
P 1125 6200
AR Path="/6118802F" Ref="C?"  Part="1" 
AR Path="/61086BEF/6118802F" Ref="C23"  Part="1" 
F 0 "C23" H 950 6300 50  0000 L CNN
F 1 "100n" H 850 6200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1125 6200 50  0001 C CNN
F 3 "~" H 1125 6200 50  0001 C CNN
	1    1125 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 61188035
P 1325 6200
AR Path="/61188035" Ref="C?"  Part="1" 
AR Path="/61086BEF/61188035" Ref="C24"  Part="1" 
F 0 "C24" H 1425 6300 50  0000 L CNN
F 1 "100n" H 1425 6200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 1325 6200 50  0001 C CNN
F 3 "~" H 1325 6200 50  0001 C CNN
	1    1325 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1125 6100 1125 5975
Wire Wire Line
	1125 6300 1125 6375
Wire Wire Line
	1125 6375 1225 6375
$Comp
L power:GND #PWR?
U 1 1 6118803E
P 1225 6375
AR Path="/6118803E" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/6118803E" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 1225 6125 50  0001 C CNN
F 1 "GND" H 1230 6202 50  0000 C CNN
F 2 "" H 1225 6375 50  0001 C CNN
F 3 "" H 1225 6375 50  0001 C CNN
	1    1225 6375
	1    0    0    -1  
$EndComp
Connection ~ 1225 6375
Wire Wire Line
	1325 5975 1325 6100
Wire Wire Line
	1125 5975 1325 5975
Wire Wire Line
	1325 6375 1325 6300
Wire Wire Line
	1225 6375 1325 6375
Wire Wire Line
	1325 5975 1925 5975
Wire Wire Line
	1925 5825 1925 5975
Connection ~ 1325 5975
Connection ~ 1925 5975
Wire Wire Line
	1925 5975 1925 6225
Text GLabel 1550 3800 0    50   Input ~ 0
SDA
Text GLabel 1550 3900 0    50   Input ~ 0
SCL
Wire Wire Line
	1550 3800 1700 3800
Wire Wire Line
	1550 3900 1700 3900
$Comp
L power:GND #PWR?
U 1 1 611D0017
P 2100 4900
AR Path="/611D0017" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/611D0017" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 2100 4650 50  0001 C CNN
F 1 "GND" H 2105 4727 50  0000 C CNN
F 2 "" H 2100 4900 50  0001 C CNN
F 3 "" H 2100 4900 50  0001 C CNN
	1    2100 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1575 4100 1575 4200
Wire Wire Line
	1575 4725 2100 4725
Wire Wire Line
	2100 4725 2100 4900
Wire Wire Line
	2100 4725 2100 4600
Connection ~ 2100 4725
Wire Wire Line
	1700 4200 1575 4200
Connection ~ 1575 4200
Wire Wire Line
	1700 4300 1575 4300
Wire Wire Line
	1575 4200 1575 4300
Connection ~ 1575 4300
Wire Wire Line
	1575 4300 1575 4725
Wire Wire Line
	1575 4100 1700 4100
$Comp
L power:+5V #PWR?
U 1 1 611DC614
P 2400 3100
AR Path="/611DC614" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/611DC614" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 2400 2950 50  0001 C CNN
F 1 "+5V" H 2415 3273 50  0000 C CNN
F 2 "" H 2400 3100 50  0001 C CNN
F 3 "" H 2400 3100 50  0001 C CNN
	1    2400 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 611DC61A
P 2600 1500
AR Path="/611DC61A" Ref="C?"  Part="1" 
AR Path="/61086BEF/611DC61A" Ref="C20"  Part="1" 
F 0 "C20" H 2425 1600 50  0000 L CNN
F 1 "100n" H 2325 1500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2600 1500 50  0001 C CNN
F 3 "~" H 2600 1500 50  0001 C CNN
	1    2600 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 611DC620
P 2800 3325
AR Path="/611DC620" Ref="C?"  Part="1" 
AR Path="/61086BEF/611DC620" Ref="C21"  Part="1" 
F 0 "C21" H 2900 3425 50  0000 L CNN
F 1 "100n" H 2900 3325 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 2800 3325 50  0001 C CNN
F 3 "~" H 2800 3325 50  0001 C CNN
	1    2800 3325
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3100 2800 3225
$Comp
L power:GND #PWR?
U 1 1 611DE0AA
P 2800 3500
AR Path="/611DE0AA" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/611DE0AA" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 2800 3250 50  0001 C CNN
F 1 "GND" H 2805 3327 50  0000 C CNN
F 2 "" H 2800 3500 50  0001 C CNN
F 3 "" H 2800 3500 50  0001 C CNN
	1    2800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3500 2800 3425
Wire Wire Line
	2400 3100 2100 3100
Wire Wire Line
	2100 3100 2100 3600
Connection ~ 2400 3100
$Comp
L Device:Jumper_NC_Small JP?
U 1 1 611E9B92
P 5625 6550
AR Path="/611E9B92" Ref="JP?"  Part="1" 
AR Path="/61086BEF/611E9B92" Ref="JP3"  Part="1" 
F 0 "JP3" H 5550 6650 50  0000 L CNN
F 1 "NC" H 5575 6475 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5625 6550 50  0001 C CNN
F 3 "~" H 5625 6550 50  0001 C CNN
	1    5625 6550
	1    0    0    -1  
$EndComp
Text GLabel 5825 6550 2    50   Input ~ 0
RESET
Wire Wire Line
	5425 6550 5525 6550
Wire Wire Line
	5725 6550 5825 6550
$Comp
L Power_Management:STWD100 U8
U 1 1 613EEF4A
P 5325 6600
F 0 "U8" H 5100 7115 50  0000 C CNN
F 1 "STWD100" H 5100 7024 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5325 6600 50  0001 C CNN
F 3 "" H 5325 6600 50  0001 C CNN
	1    5325 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613F33AF
P 5075 6875
AR Path="/613F33AF" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/613F33AF" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 5075 6625 50  0001 C CNN
F 1 "GND" H 5080 6702 50  0000 C CNN
F 2 "" H 5075 6875 50  0001 C CNN
F 3 "" H 5075 6875 50  0001 C CNN
	1    5075 6875
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 613F3A3C
P 5525 5875
AR Path="/613F3A3C" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/613F3A3C" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 5525 5725 50  0001 C CNN
F 1 "+5V" H 5540 6048 50  0000 C CNN
F 2 "" H 5525 5875 50  0001 C CNN
F 3 "" H 5525 5875 50  0001 C CNN
	1    5525 5875
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 613F468E
P 5825 6075
AR Path="/613F468E" Ref="C?"  Part="1" 
AR Path="/61086BEF/613F468E" Ref="C22"  Part="1" 
F 0 "C22" H 5925 6125 50  0000 L CNN
F 1 "100n" H 5925 6025 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5825 6075 50  0001 C CNN
F 3 "~" H 5825 6075 50  0001 C CNN
	1    5825 6075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 613F469D
P 5825 6225
AR Path="/613F469D" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/613F469D" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 5825 5975 50  0001 C CNN
F 1 "GND" H 5830 6052 50  0000 C CNN
F 2 "" H 5825 6225 50  0001 C CNN
F 3 "" H 5825 6225 50  0001 C CNN
	1    5825 6225
	1    0    0    -1  
$EndComp
Wire Wire Line
	5825 6175 5825 6225
Wire Wire Line
	5825 5975 5525 5975
Wire Wire Line
	5525 5975 5525 6350
Wire Wire Line
	5525 6350 5425 6350
Connection ~ 5525 5975
Text GLabel 4575 6350 0    50   Input ~ 0
PD5
Text GLabel 4575 6550 0    50   Input ~ 0
PD6
Wire Wire Line
	4575 6350 4775 6350
Wire Wire Line
	4575 6550 4775 6550
Wire Wire Line
	5525 5875 5525 5975
Wire Wire Line
	5075 6800 5075 6875
Text GLabel 2625 4000 2    50   Input ~ 0
TEMP_INT
Wire Wire Line
	2500 4000 2625 4000
Wire Wire Line
	2100 1700 2200 1700
Connection ~ 2200 1700
$Comp
L power:+5V #PWR?
U 1 1 60DF881C
P 5050 1350
AR Path="/60DF881C" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60DF881C" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60DF881C" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 5050 1200 50  0001 C CNN
F 1 "+5V" H 5065 1523 50  0000 C CNN
F 2 "" H 5050 1350 50  0001 C CNN
F 3 "" H 5050 1350 50  0001 C CNN
	1    5050 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60DF8822
P 6375 2050
AR Path="/60DF8822" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60DF8822" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60DF8822" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 6375 1800 50  0001 C CNN
F 1 "GND" H 6380 1877 50  0000 C CNN
F 2 "" H 6375 2050 50  0001 C CNN
F 3 "" H 6375 2050 50  0001 C CNN
	1    6375 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1775 6375 1775
Wire Wire Line
	6300 1975 6375 1975
Wire Wire Line
	6375 1975 6375 2050
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60DF882B
P 6000 1875
AR Path="/60DF882B" Ref="J?"  Part="1" 
AR Path="/60A409E3/60DF882B" Ref="J?"  Part="1" 
AR Path="/61086BEF/60DF882B" Ref="J10"  Part="1" 
F 0 "J10" H 6050 2192 50  0000 C CNN
F 1 "I2C" H 6050 2101 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6000 1875 50  0001 C CNN
F 3 "~" H 6000 1875 50  0001 C CNN
	1    6000 1875
	1    0    0    -1  
$EndComp
Text GLabel 4775 1975 0    50   Input ~ 0
SDA
Text GLabel 4775 1875 0    50   Input ~ 0
SCL
Wire Wire Line
	4775 1875 4900 1875
Wire Wire Line
	4775 1975 5200 1975
$Comp
L Device:R_Small R?
U 1 1 60DF8835
P 4900 1550
AR Path="/60DF8835" Ref="R?"  Part="1" 
AR Path="/60A409E3/60DF8835" Ref="R?"  Part="1" 
AR Path="/61086BEF/60DF8835" Ref="R39"  Part="1" 
F 0 "R39" H 4775 1450 50  0000 C CNN
F 1 "4K7" H 4750 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 4900 1550 50  0001 C CNN
F 3 "~" H 4900 1550 50  0001 C CNN
	1    4900 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60DF883B
P 5200 1550
AR Path="/60DF883B" Ref="R?"  Part="1" 
AR Path="/60A409E3/60DF883B" Ref="R?"  Part="1" 
AR Path="/61086BEF/60DF883B" Ref="R40"  Part="1" 
F 0 "R40" H 5075 1450 50  0000 C CNN
F 1 "4K7" H 5050 1550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 5200 1550 50  0001 C CNN
F 3 "~" H 5200 1550 50  0001 C CNN
	1    5200 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1650 4900 1875
Connection ~ 4900 1875
Wire Wire Line
	5200 1650 5200 1975
Connection ~ 5200 1975
Wire Wire Line
	4900 1450 4900 1350
Wire Wire Line
	4900 1350 5050 1350
Wire Wire Line
	5200 1350 5200 1450
Connection ~ 5050 1350
Wire Wire Line
	5050 1350 5200 1350
Connection ~ 5200 1350
$Comp
L power:+12P #PWR?
U 1 1 60DF884B
P 6550 1600
AR Path="/60DF884B" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60DF884B" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60DF884B" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 6550 1450 50  0001 C CNN
F 1 "+12P" H 6565 1773 50  0000 C CNN
F 2 "" H 6550 1600 50  0001 C CNN
F 3 "" H 6550 1600 50  0001 C CNN
	1    6550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1875 6550 1875
Wire Wire Line
	6550 1875 6550 1600
Wire Wire Line
	5800 1775 5800 1350
Wire Wire Line
	5200 1350 5800 1350
Wire Wire Line
	4900 1875 5800 1875
Wire Wire Line
	5200 1975 5800 1975
Text GLabel 6375 1625 1    50   Input ~ 0
VBAT_SUP
Wire Wire Line
	6375 1775 6375 1625
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60E0CD69
P 9475 5700
AR Path="/60E0CD69" Ref="J?"  Part="1" 
AR Path="/60A409E3/60E0CD69" Ref="J?"  Part="1" 
AR Path="/61086BEF/60E0CD69" Ref="J12"  Part="1" 
F 0 "J12" H 9525 6017 50  0000 C CNN
F 1 "AUX" H 9525 5926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 9475 5700 50  0001 C CNN
F 3 "~" H 9475 5700 50  0001 C CNN
	1    9475 5700
	1    0    0    -1  
$EndComp
Text GLabel 9125 5600 0    50   Input ~ 0
MFP
Wire Wire Line
	9125 5600 9275 5600
$Comp
L power:GND #PWR?
U 1 1 60E0CD73
P 9925 5850
AR Path="/60E0CD73" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60E0CD73" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60E0CD73" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 9925 5600 50  0001 C CNN
F 1 "GND" H 9930 5677 50  0000 C CNN
F 2 "" H 9925 5850 50  0001 C CNN
F 3 "" H 9925 5850 50  0001 C CNN
	1    9925 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9775 5800 9825 5800
Wire Wire Line
	9925 5800 9925 5850
$Comp
L power:+5V #PWR?
U 1 1 60E0CD7B
P 10225 5475
AR Path="/60E0CD7B" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60E0CD7B" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60E0CD7B" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 10225 5325 50  0001 C CNN
F 1 "+5V" H 10240 5648 50  0000 C CNN
F 2 "" H 10225 5475 50  0001 C CNN
F 3 "" H 10225 5475 50  0001 C CNN
	1    10225 5475
	1    0    0    -1  
$EndComp
$Comp
L power:+12P #PWR?
U 1 1 60E0CD81
P 10000 5475
AR Path="/60E0CD81" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60E0CD81" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60E0CD81" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 10000 5325 50  0001 C CNN
F 1 "+12P" H 10015 5648 50  0000 C CNN
F 2 "" H 10000 5475 50  0001 C CNN
F 3 "" H 10000 5475 50  0001 C CNN
	1    10000 5475
	1    0    0    -1  
$EndComp
Wire Wire Line
	9775 5600 10000 5600
Wire Wire Line
	10000 5600 10000 5475
Wire Wire Line
	9775 5700 10025 5700
Wire Wire Line
	10225 5700 10225 5475
$Comp
L power:+5V #PWR?
U 1 1 60E0CD8B
P 8475 5425
AR Path="/60E0CD8B" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60E0CD8B" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60E0CD8B" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 8475 5275 50  0001 C CNN
F 1 "+5V" H 8490 5598 50  0000 C CNN
F 2 "" H 8475 5425 50  0001 C CNN
F 3 "" H 8475 5425 50  0001 C CNN
	1    8475 5425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E0CD91
P 8475 5800
AR Path="/60E0CD91" Ref="#PWR?"  Part="1" 
AR Path="/60A409E3/60E0CD91" Ref="#PWR?"  Part="1" 
AR Path="/61086BEF/60E0CD91" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 8475 5550 50  0001 C CNN
F 1 "GND" H 8480 5627 50  0000 C CNN
F 2 "" H 8475 5800 50  0001 C CNN
F 3 "" H 8475 5800 50  0001 C CNN
	1    8475 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5525 8475 5525
Wire Wire Line
	8475 5525 8475 5425
Wire Wire Line
	8400 5725 8475 5725
Wire Wire Line
	8475 5725 8475 5800
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 60E0CD9B
P 8100 5625
AR Path="/60E0CD9B" Ref="J?"  Part="1" 
AR Path="/60A409E3/60E0CD9B" Ref="J?"  Part="1" 
AR Path="/61086BEF/60E0CD9B" Ref="J11"  Part="1" 
F 0 "J11" H 8150 5942 50  0000 C CNN
F 1 "ICSP" H 8150 5851 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 8100 5625 50  0001 C CNN
F 3 "~" H 8100 5625 50  0001 C CNN
	1    8100 5625
	1    0    0    -1  
$EndComp
Text GLabel 8475 5625 2    50   Input ~ 0
MOSI
Wire Wire Line
	8400 5625 8475 5625
Text GLabel 7800 5725 0    50   Input ~ 0
RESET
Text GLabel 7800 5625 0    50   Input ~ 0
SCK
Text GLabel 7800 5525 0    50   Input ~ 0
MISO
Wire Wire Line
	7800 5525 7900 5525
Wire Wire Line
	7800 5625 7900 5625
Wire Wire Line
	7800 5725 7900 5725
Wire Wire Line
	2450 6800 2725 6800
Wire Wire Line
	2450 6625 2450 6800
Wire Wire Line
	2600 6925 2600 6700
Wire Wire Line
	2600 6700 2725 6700
Wire Wire Line
	2325 6925 2600 6925
Wire Wire Line
	9275 5800 9275 5950
Wire Wire Line
	9275 5950 9825 5950
Wire Wire Line
	9825 5950 9825 5800
Connection ~ 9825 5800
Wire Wire Line
	9825 5800 9925 5800
Wire Wire Line
	9275 5700 9150 5700
Wire Wire Line
	9150 5700 9150 6125
Wire Wire Line
	9150 6125 10025 6125
Wire Wire Line
	10025 6125 10025 5700
Connection ~ 10025 5700
Wire Wire Line
	10025 5700 10225 5700
Wire Wire Line
	2400 3100 2800 3100
$EndSCHEMATC
