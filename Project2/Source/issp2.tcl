project_open Project2
set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $usb] 1]
start_insystem_source_probe -device_name $device_name -hardware_name $usb

write_source_data -instance_index 0 -value 11

# Assert and deassert reset
after 500
write_source_data -instance_index 0 -value 10
after 500
write_source_data -instance_index 0 -value 11
after 500
# Start the state machine
write_source_data -instance_index 0 -value 01
set read [read_probe_data -instance_index 0]
puts "Beginning read = $read"
set ack [expr { $read & 1}]
while {$ack == 0} {
  set read [read_probe_data -instance_index 0]
  puts $read
  set ack [expr {$read & 1}]
}
set read [read_probe_data -instance_index 0]
puts "Ending CS = $read"

end_insystem_source_probe
project_close
