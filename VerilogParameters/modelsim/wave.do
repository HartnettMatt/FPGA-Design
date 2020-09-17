onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clkin /tb_modelsim/clkin
add wave -noupdate -label reset_n /tb_modelsim/reset_n
add wave -noupdate -label clkout1 /tb_modelsim/clkout1
add wave -noupdate -label clkout2 /tb_modelsim/clkout2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 80
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {15 ns} {1000 ns}
