# Copyright (C) 2019  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: adc.tcl
# Generated on: Tue Jun 02 14:32:11 2020

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "adc"]} {
		puts "Project adc is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists adc]} {
		project_open -revision adc adc
	} else {
		project_new -revision adc adc
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSXFC6D6F31C6
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 16.0.2
	set_global_assignment -name LAST_QUARTUS_VERSION "19.1.0 Lite Edition"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "11:50:34 MAY 31,2020"
	set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
	set_global_assignment -name VERILOG_FILE ../source/seg7.v
	set_global_assignment -name VERILOG_FILE ../source/bin2bcd.v
	set_global_assignment -name VERILOG_FILE ../source/adc_control.v
	set_global_assignment -name VERILOG_FILE ../source/adc.v
	set_global_assignment -name SDC_FILE adc.SDC
	set_global_assignment -name QIP_FILE pll.qip
	set_global_assignment -name SIP_FILE pll.sip
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name NUM_PARALLEL_PROCESSORS 4
	set_global_assignment -name SIGNALTAP_FILE stp1.stp
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK2_50
	set_instance_assignment -name IO_STANDARD "2.5 V" -to CLOCK3_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK4_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
	set_location_assignment PIN_AA16 -to CLOCK2_50
	set_location_assignment PIN_Y26 -to CLOCK3_50
	set_location_assignment PIN_K14 -to CLOCK4_50
	set_location_assignment PIN_AF14 -to CLOCK_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[3]
	set_location_assignment PIN_AJ4 -to KEY[0]
	set_location_assignment PIN_AK4 -to KEY[1]
	set_location_assignment PIN_AA14 -to KEY[2]
	set_location_assignment PIN_AA15 -to KEY[3]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[0]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[1]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[2]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[3]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[4]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[5]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[6]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[7]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[8]
	set_instance_assignment -name IO_STANDARD "2.5 V" -to SW[9]
	set_location_assignment PIN_AB30 -to SW[0]
	set_location_assignment PIN_Y27 -to SW[1]
	set_location_assignment PIN_AB28 -to SW[2]
	set_location_assignment PIN_AC30 -to SW[3]
	set_location_assignment PIN_W25 -to SW[4]
	set_location_assignment PIN_V25 -to SW[5]
	set_location_assignment PIN_AC28 -to SW[6]
	set_location_assignment PIN_AD30 -to SW[7]
	set_location_assignment PIN_AC29 -to SW[8]
	set_location_assignment PIN_AA30 -to SW[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[9]
	set_location_assignment PIN_AA24 -to LEDR[0]
	set_location_assignment PIN_AB23 -to LEDR[1]
	set_location_assignment PIN_AC23 -to LEDR[2]
	set_location_assignment PIN_AD24 -to LEDR[3]
	set_location_assignment PIN_AG25 -to LEDR[4]
	set_location_assignment PIN_AF25 -to LEDR[5]
	set_location_assignment PIN_AE24 -to LEDR[6]
	set_location_assignment PIN_AF24 -to LEDR[7]
	set_location_assignment PIN_AB22 -to LEDR[8]
	set_location_assignment PIN_AC22 -to LEDR[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5[6]
	set_location_assignment PIN_W17 -to HEX0[0]
	set_location_assignment PIN_V18 -to HEX0[1]
	set_location_assignment PIN_AG17 -to HEX0[2]
	set_location_assignment PIN_AG16 -to HEX0[3]
	set_location_assignment PIN_AH17 -to HEX0[4]
	set_location_assignment PIN_AG18 -to HEX0[5]
	set_location_assignment PIN_AH18 -to HEX0[6]
	set_location_assignment PIN_AF16 -to HEX1[0]
	set_location_assignment PIN_V16 -to HEX1[1]
	set_location_assignment PIN_AE16 -to HEX1[2]
	set_location_assignment PIN_AD17 -to HEX1[3]
	set_location_assignment PIN_AE18 -to HEX1[4]
	set_location_assignment PIN_AE17 -to HEX1[5]
	set_location_assignment PIN_V17 -to HEX1[6]
	set_location_assignment PIN_AA21 -to HEX2[0]
	set_location_assignment PIN_AB17 -to HEX2[1]
	set_location_assignment PIN_AA18 -to HEX2[2]
	set_location_assignment PIN_Y17 -to HEX2[3]
	set_location_assignment PIN_Y18 -to HEX2[4]
	set_location_assignment PIN_AF18 -to HEX2[5]
	set_location_assignment PIN_W16 -to HEX2[6]
	set_location_assignment PIN_Y19 -to HEX3[0]
	set_location_assignment PIN_W19 -to HEX3[1]
	set_location_assignment PIN_AD19 -to HEX3[2]
	set_location_assignment PIN_AA20 -to HEX3[3]
	set_location_assignment PIN_AC20 -to HEX3[4]
	set_location_assignment PIN_AA19 -to HEX3[5]
	set_location_assignment PIN_AD20 -to HEX3[6]
	set_location_assignment PIN_AD21 -to HEX4[0]
	set_location_assignment PIN_AG22 -to HEX4[1]
	set_location_assignment PIN_AE22 -to HEX4[2]
	set_location_assignment PIN_AE23 -to HEX4[3]
	set_location_assignment PIN_AG23 -to HEX4[4]
	set_location_assignment PIN_AF23 -to HEX4[5]
	set_location_assignment PIN_AH22 -to HEX4[6]
	set_location_assignment PIN_AF21 -to HEX5[0]
	set_location_assignment PIN_AG21 -to HEX5[1]
	set_location_assignment PIN_AF20 -to HEX5[2]
	set_location_assignment PIN_AG20 -to HEX5[3]
	set_location_assignment PIN_AE19 -to HEX5[4]
	set_location_assignment PIN_AF19 -to HEX5[5]
	set_location_assignment PIN_AB21 -to HEX5[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CONVST
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_DIN
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_DOUT
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCLK
	set_location_assignment PIN_Y21 -to ADC_CONVST
	set_location_assignment PIN_W22 -to ADC_DIN
	set_location_assignment PIN_V23 -to ADC_DOUT
	set_location_assignment PIN_W24 -to ADC_SCLK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[16]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[17]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[18]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[19]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[20]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[21]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[22]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[23]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[24]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[25]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[26]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[27]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[28]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[29]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[30]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[31]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[32]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[33]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[34]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[35]
	set_location_assignment PIN_W15 -to GPIO[0]
	set_location_assignment PIN_AK2 -to GPIO[1]
	set_location_assignment PIN_Y16 -to GPIO[2]
	set_location_assignment PIN_AK3 -to GPIO[3]
	set_location_assignment PIN_AJ1 -to GPIO[4]
	set_location_assignment PIN_AJ2 -to GPIO[5]
	set_location_assignment PIN_AH2 -to GPIO[6]
	set_location_assignment PIN_AH3 -to GPIO[7]
	set_location_assignment PIN_AH4 -to GPIO[8]
	set_location_assignment PIN_AH5 -to GPIO[9]
	set_location_assignment PIN_AG1 -to GPIO[10]
	set_location_assignment PIN_AG2 -to GPIO[11]
	set_location_assignment PIN_AG3 -to GPIO[12]
	set_location_assignment PIN_AG5 -to GPIO[13]
	set_location_assignment PIN_AG6 -to GPIO[14]
	set_location_assignment PIN_AG7 -to GPIO[15]
	set_location_assignment PIN_AG8 -to GPIO[16]
	set_location_assignment PIN_AF4 -to GPIO[17]
	set_location_assignment PIN_AF5 -to GPIO[18]
	set_location_assignment PIN_AF6 -to GPIO[19]
	set_location_assignment PIN_AF8 -to GPIO[20]
	set_location_assignment PIN_AF9 -to GPIO[21]
	set_location_assignment PIN_AF10 -to GPIO[22]
	set_location_assignment PIN_AE7 -to GPIO[23]
	set_location_assignment PIN_AE9 -to GPIO[24]
	set_location_assignment PIN_AE11 -to GPIO[25]
	set_location_assignment PIN_AE12 -to GPIO[26]
	set_location_assignment PIN_AD7 -to GPIO[27]
	set_location_assignment PIN_AD9 -to GPIO[28]
	set_location_assignment PIN_AD10 -to GPIO[29]
	set_location_assignment PIN_AD11 -to GPIO[30]
	set_location_assignment PIN_AD12 -to GPIO[31]
	set_location_assignment PIN_AC9 -to GPIO[32]
	set_location_assignment PIN_AC12 -to GPIO[33]
	set_location_assignment PIN_AB12 -to GPIO[34]
	set_location_assignment PIN_AA12 -to GPIO[35]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
