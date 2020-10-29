set master_path [lindex [get_service_paths master] 0]
set mpath [claim_service master $master_path “”]
set jpath [lindex [get_service_paths jtag_debug] 0]
jtag_debug_reset_system $jpath
set clk [jtag_debug_sense_clock $jpath]
set rst [jtag_debug_sample_reset $jpath]

#Need to verify that the memory location is correct before knowing if this works. Also need to see if value being written is valid (might be too wide)
master_write_8 $mpath 0x10 0x55
