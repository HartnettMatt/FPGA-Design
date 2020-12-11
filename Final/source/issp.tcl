# Run this script using the quartus_stp Tcl console

project_open Final_3002

set usb [lindex [get_hardware_names] 0]
# this will return DE-SoC [USB-1]

set device_name [lindex [get_device_names -hardware_name $usb] 1]
# this will return the device
# note, if you use a 0 instead of a one, it will find the SOC block, not the fpga
# returns @2: 5CS3BA6(.|ES)/5CSEMA6/.. (ox02D020DD)

start_insystem_source_probe -device_name $device_name -hardware_name $usb

# reset PLLs
puts "Reset PLLs..........."
write_source_data -instance_index 0 -value 10
after 5000
# take PLLs out of reset
puts "Should be running..........."
write_source_data -instance_index 0 -value 11
after 5000
# reset counters
puts "Reset counters..........."
write_source_data -instance_index 0 -value 01
after 5000
# release counters
puts "Running.........."
write_source_data -instance_index 0 -value 11

end_insystem_source_probe