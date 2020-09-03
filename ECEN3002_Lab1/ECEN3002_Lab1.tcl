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

# Quartus Prime Version 20.1.0 Build 711 06/05/2020 SJ Standard Edition
# File: C:\Users\Matt Hartnett\Documents\FPGA-Design\ECEN3002_Lab1\ECEN3002_Lab1.tcl
# Generated on: Thu Sep 03 16:16:39 2020

package require ::quartus::project


set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]


set_location_assignment PIN_AD29 -to KEY[0]
set_location_assignment PIN_AC27 -to KEY[1]
set_location_assignment PIN_AF14 -to CLOCK_50
