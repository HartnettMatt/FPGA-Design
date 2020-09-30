transcript on
if ![file isdirectory Project1_iputf_libs] {
	file mkdir Project1_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores
###### End libraries for IPUTF cores
###### MIF file copy and HDL compilation commands for IPUTF cores


vlog "F:/FPGADesign/Project1/Quartus/video_pll_sim/video_pll.vo"

vlog -vlog01compat -work work +incdir+F:/FPGADesign/Project1/Source {F:/FPGADesign/Project1/Source/PG.v}
vlog -vlog01compat -work work +incdir+F:/FPGADesign/Project1/Source {F:/FPGADesign/Project1/Source/clock.v}
vlog -vlog01compat -work work +incdir+F:/FPGADesign/Project1/Source {F:/FPGADesign/Project1/Source/VTC.v}
vlog -vlog01compat -work work +incdir+F:/FPGADesign/Project1/Source {F:/FPGADesign/Project1/Source/Project1.v}

vlog -vlog01compat -work work +incdir+F:/FPGADesign/Project1/Quartus/../Source {F:/FPGADesign/Project1/Quartus/../Source/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

do wave.do
view structure
view signals
run -all
run 10 ns
wave zoom full
