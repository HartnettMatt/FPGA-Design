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

# Start the state machine
write_source_data -instance_index 0 -value 01
set ts_sdat [read_probe_data -instance_index 0]
set ts [expr { $ts_sdat & 1}]
puts "Beginning ts = $ts"
while {$ts == 0} {
  set ts_sdat [read_probe_data -instance_index 0]
  set ts [expr $ts_sdat & 1]
  puts $ts_sdat
}
set ts_sdat [read_probe_data -instance_index 0]
puts "Ending ts_sdat = $ts_sdat"
set ts [expr { $ts_sdat & 1}]
puts "Ending ts = $ts"

end_insystem_source_probe
project_close
