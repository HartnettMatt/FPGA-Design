# Copyright (C) 2020  Intel Corporation. All rights reserved.
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
# File: HW13_2.tcl
# Generated on: Sun Nov 29 17:00:40 2020

# Load Quartus Prime Tcl Project package
package require ::quartus::project
package require ::quartus::flow

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "HW13"]} {
		puts "Project HW13 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists HW13]} {
		project_open -revision HW13 HW13
	} else {
		project_new -revision HW13 HW13
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name POST_MODULE_SCRIPT_FILE "quartus_sh:../Source/pins.tcl"
	set_global_assignment -name POST_FLOW_SCRIPT_FILE "quartus_stp:prog.tcl"
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSXFC6D6F31C6
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 16.0.2
	set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Standard Edition"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:24:09 NOVEMBER 29,2020"
	set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
	set_global_assignment -name VERILOG_FILE ../Source/HW13.v
	set_global_assignment -name SDC_FILE HW13.SDC
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
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
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	execute_flow -compile

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}