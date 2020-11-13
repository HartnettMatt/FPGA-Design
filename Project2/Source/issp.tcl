project_open Project2
set usb [lindex [get_hardware_names] 0]
set device_name [lindex [get_device_names -hardware_name $usb] 1]
start_insystem_source_probe -device_name $device_name -hardware_name $usb
set ack_n [read_probe_data -instance_index 0]
puts "Beginning sda = $ack_n"

# start frame:
write_source_data -instance_index 0 -value 011
after 500
write_source_data -instance_index 0 -value 011
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Start sda = $ack_n"
after 500

# Transmit device ID 00110100
write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Bit 7 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Bit 6 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 001
write_source_data -instance_index 0 -value 011
write_source_data -instance_index 0 -value 001
set ack_n [read_probe_data -instance_index 0]
puts "Bit 5 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 001
write_source_data -instance_index 0 -value 011
write_source_data -instance_index 0 -value 001
set ack_n [read_probe_data -instance_index 0]
puts "Bit 4 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Bit 3 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 001
write_source_data -instance_index 0 -value 011
write_source_data -instance_index 0 -value 001
set ack_n [read_probe_data -instance_index 0]
puts "Bit 2 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Bit 1 sda = $ack_n"
after 500

write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 000
set ack_n [read_probe_data -instance_index 0]
puts "Bit 0 sda = $ack_n"
after 500

# Read for an ACK
write_source_data -instance_index 0 -value 100
set ack_n [read_probe_data -instance_index 0]
puts "Turn off tristate = $ack_n"
after 500
write_source_data -instance_index 0 -value 110
set ack_n [read_probe_data -instance_index 0]
puts "Rising edge = $ack_n"
after 500
write_source_data -instance_index 0 -value 100
set ack_n [read_probe_data -instance_index 0]
puts "Falling edge = $ack_n"
after 500

# send stop condition
write_source_data -instance_index 0 -value 000
write_source_data -instance_index 0 -value 010
write_source_data -instance_index 0 -value 011
after 500

end_insystem_source_probe
project_close
