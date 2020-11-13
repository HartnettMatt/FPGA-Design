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
# File: signalprobe_qsf.tcl
# Generated on: Thu Nov 12 16:02:31 2020

# Note: This file contains a Tcl script generated from the Signal Probe Gui.
#       You can use this script to restore Signal Probes after deleting the DB
#       folder; at the command line use "quartus_cdb -t signalprobe_qsf.tcl".

package require ::quartus::chip_planner
package require ::quartus::project
project_open Project2 -revision Project2
read_netlist
set had_failure 0

############
# Index: 1 #
############
set result [ make_sp  -src_name "|Project2|FPGA_I2C_SDAT~input" -loc PIN_A10 -pin_name "FPGA_I2C_SDAT_signalProbe" -io_std "2.5 V" ] 
if { $result == 0 } { 
	 puts "FAIL (FPGA_I2C_SDAT_signalProbe): make_sp  -src_name \"|Project2|FPGA_I2C_SDAT~input\" -loc PIN_A10 -pin_name \"FPGA_I2C_SDAT_signalProbe\" -io_std \"2.5 V\""
} else { 
 	 puts "SET  (FPGA_I2C_SDAT_signalProbe): make_sp  -src_name \"|Project2|FPGA_I2C_SDAT~input\" -loc PIN_A10 -pin_name \"FPGA_I2C_SDAT_signalProbe\" -io_std \"2.5 V\""
} 

