set master_path [lindex [get_service_paths master] 0] 
set mpath [claim_service master $master_path “”] 

set ModeReg 0x0
set StatusReg 0x4
set StartReg 0x8
set McounterReg 0x10
set CcounterRegWrite 0x14
set CcounterRegRead 0x28
set freq1 0x00000606
set freq2 0x00000c0c
set freq3 0x00001818

# Write to Mode Register (not sure this has to be done)
master_write_32 $mpath $ModeReg 0x0 1
# Write to C counter
master_write_32 $mpath $CcounterRegWrite $freq1
master_write_32 $mpath $StartReg 0x0
after 10000
puts "Keep watching....."
master_write_32 $mpath $CcounterRegWrite $freq2
master_write_32 $mpath $StartReg 0x0
after 10000
puts "Longer....."
master_write_32 $mpath $CcounterRegWrite $freq3
master_write_32 $mpath $StartReg 0x0
after 10000
puts "All done.........."
master_write_32 $mpath $CcounterRegWrite $freq1
master_write_32 $mpath $StartReg 0x0

close_service master $mpath