set master_path [lindex [get_service_paths master] 0]
set mpath [claim_service master $master_path “”]
set jpath [lindex [get_service_paths jtag_debug] 0]
jtag_debug_reset_system $jpath
set clk [jtag_debug_sense_clock $jpath]
set rst [jtag_debug_sample_reset $jpath]

master_write_16 $mpath 0x0 0x5555
puts 500
master_write_16 $mpath 0x0 0xffff
puts 500
master_write_16 $mpath 0x0 0x0000
close_service master $mpath
