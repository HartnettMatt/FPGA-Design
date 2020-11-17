set master_path [lindex [get_service_paths master] 0]
set mpath [claim_service master $master_path “”]
set jpath [lindex [get_service_paths jtag_debug] 0]
jtag_debug_reset_system $jpath
set clk [jtag_debug_sense_clock $jpath]
set rst [jtag_debug_sample_reset $jpath]

set read_value [master_read_16 $mpath 0x00 1]
puts "Value read = $read_value"
after 1000
master_write_8 $mpath 0x10 0x55
master_write_8 $mpath 0x01 0x55

close_service master $mpath
