transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+F:/FPGADesign/lab10/quartus {F:/FPGADesign/lab10/quartus/pll.vo}
vlib pll
vmap pll pll
vlog -sv -work pll +incdir+F:/FPGADesign/lab10/quartus/pll {F:/FPGADesign/lab10/quartus/pll/pll_0002.v}
vlog -sv -work work +incdir+F:/FPGADesign/lab10/source {F:/FPGADesign/lab10/source/bin2bcd.sv}
vlog -sv -work work +incdir+F:/FPGADesign/lab10/source {F:/FPGADesign/lab10/source/adc_control.sv}
vlog -sv -work work +incdir+F:/FPGADesign/lab10/source {F:/FPGADesign/lab10/source/seg7.sv}
vlog -sv -work work +incdir+F:/FPGADesign/lab10/source {F:/FPGADesign/lab10/source/adc.sv}

vlog -sv -work work +incdir+F:/FPGADesign/lab10/quartus/../source {F:/FPGADesign/lab10/quartus/../source/tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L pll -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
