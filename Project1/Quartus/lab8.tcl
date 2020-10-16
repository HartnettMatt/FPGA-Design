project_open Project1
set usb [lindex [get_hardware_names] 0 ]
set device_name [lindex [get_device_names -hardware_name $usb] 1]
begin_memory_edit -hardware_name $usb -device_name $device_name
set color1 "000000"
set color2 "784F17"
set color3 "FE0000"
set color4 "FD8C00"
set color5 "FFE500"
set color6 "119F0B"
set color7 "0644B3"
set color8 "C22EDC"
write_content_to_memory -instance_index 0 -start_address 0 -word_count 1 -content $color1 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 8 -word_count 1 -content $color2 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 16 -word_count 1 -content $color3 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 24 -word_count 1 -content $color4 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 32 -word_count 1 -content $color5 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 40 -word_count 1 -content $color6 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 48 -word_count 1 -content $color7 -content_in_hex
write_content_to_memory -instance_index 0 -start_address 56 -word_count 1 -content $color8 -content_in_hex

set x1 0
set x2 8
set x3 16
set x4 24
set x5 32
set x6 40
set x7 48
set x8 56
while {$x1 <= 56} {
  write_content_to_memory -instance_index 0 -start_address $x1 -word_count 1 -content $color1 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x2 -word_count 1 -content $color2 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x3 -word_count 1 -content $color3 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x4 -word_count 1 -content $color4 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x5 -word_count 1 -content $color5 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x6 -word_count 1 -content $color6 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x7 -word_count 1 -content $color7 -content_in_hex
  write_content_to_memory -instance_index 0 -start_address $x8 -word_count 1 -content $color8 -content_in_hex
  if {$x1 > 48} {
    set x1 0
  } else {
    set x1 [expr {$x1 + 8}]
  }
  if {$x2 > 48} {
    set x2 0
  } else {
    set x2 [expr {$x2 + 8}]
  }
  if {$x3 > 48} {
    set x3 0
  } else {
    set x3 [expr {$x3 + 8}]
  }
  if {$x4 > 48} {
    set x4 0
  } else {
    set x4 [expr {$x4 + 8}]
  }
  if {$x5 > 48} {
    set x5 0
  } else {
    set x5 [expr {$x5 + 8}]
  }
  if {$x6 > 48} {
    set x6 0
  } else {
    set x6 [expr {$x6 + 8}]
  }
  if {$x7 > 48} {
    set x7 0
  } else {
    set x7 [expr {$x7 + 8}]
  }
  if {$x8 > 48} {
    set x8 0
  } else {
    set x8 [expr {$x8 + 8}]
  }
}

set x2 8
while {$x2 <= 56} {
  puts "x2 is $x2"
  write_content_to_memory -instance_index 0 -start_address $x2 -word_count 1 -content $color2 -content_in_hex
  after 500
  if {$x2 > 48} {
    set x2 0
  } else {
    set x2 [expr {$x2 + 8}]
  }
}
end_memory_edit
project_close
