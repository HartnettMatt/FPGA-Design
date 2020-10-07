project_open ECEN3002_Lab1
set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $usb] 1]
start_insystem_source_probe -device_name $device_name -hardware_name $usb

read_probe_data -instance_index 0
write_source_data -instance_index 0 -value 11

puts "Running normal operation"
set var1 [read_probe_data -instance_index 0]
puts "KEY value:"
puts $var1

after 5000
puts "Resetting the counter"
write_source_data -instance_index 0 -value 10
set var2 [read_probe_data -instance_index 0]
puts "KEY value:"
puts $var2

after 5000
puts "Loading LEDs"
write_source_data -instance_index 0 -value 01
set var3 [read_probe_data -instance_index 0]
puts "KEY value:"
puts $var3

after 5000
puts "Continue normal operation"
write_source_data -instance_index 0 -value 11
set var4 [read_probe_data -instance_index 0]
puts "KEY value:"
puts $var4

end_insystem_source_probe
project_close
