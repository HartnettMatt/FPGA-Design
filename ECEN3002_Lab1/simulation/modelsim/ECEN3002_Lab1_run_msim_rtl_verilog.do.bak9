transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Matt\ Hartnett/Documents/FPGA-Design/ECEN3002_Lab1 {C:/Users/Matt Hartnett/Documents/FPGA-Design/ECEN3002_Lab1/ecen3002_lab1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Matt\ Hartnett/Documents/FPGA-Design/ECEN3002_Lab1 {C:/Users/Matt Hartnett/Documents/FPGA-Design/ECEN3002_Lab1/ecen3002_lab1_clockdivider.v}

vlog -vlog01compat -work work +incdir+C:/Users/Matt\ Hartnett/Documents/FPGA-Design/ECEN3002_Lab1 {C:/Users/Matt Hartnett/Documents/FPGA-Design/ECEN3002_Lab1/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
