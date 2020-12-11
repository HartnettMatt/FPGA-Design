transcript on
if ![file isdirectory Final_3002_iputf_libs] {
	file mkdir Final_3002_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib Final_3002_iputf_libs/in_system_sources_probes_0
vmap in_system_sources_probes_0 ./Final_3002_iputf_libs/in_system_sources_probes_0
vlib Final_3002_iputf_libs/pll_reconfig_0_mgmt_avalon_slave_translator
vmap pll_reconfig_0_mgmt_avalon_slave_translator ./Final_3002_iputf_libs/pll_reconfig_0_mgmt_avalon_slave_translator
vlib Final_3002_iputf_libs/master_0_master_translator
vmap master_0_master_translator ./Final_3002_iputf_libs/master_0_master_translator
vlib Final_3002_iputf_libs/p2b_adapter
vmap p2b_adapter ./Final_3002_iputf_libs/p2b_adapter
vlib Final_3002_iputf_libs/b2p_adapter
vmap b2p_adapter ./Final_3002_iputf_libs/b2p_adapter
vlib Final_3002_iputf_libs/transacto
vmap transacto ./Final_3002_iputf_libs/transacto
vlib Final_3002_iputf_libs/p2b
vmap p2b ./Final_3002_iputf_libs/p2b
vlib Final_3002_iputf_libs/b2p
vmap b2p ./Final_3002_iputf_libs/b2p
vlib Final_3002_iputf_libs/fifo
vmap fifo ./Final_3002_iputf_libs/fifo
vlib Final_3002_iputf_libs/timing_adt
vmap timing_adt ./Final_3002_iputf_libs/timing_adt
vlib Final_3002_iputf_libs/jtag_phy_embedded_in_jtag_master
vmap jtag_phy_embedded_in_jtag_master ./Final_3002_iputf_libs/jtag_phy_embedded_in_jtag_master
vlib Final_3002_iputf_libs/rst_controller
vmap rst_controller ./Final_3002_iputf_libs/rst_controller
vlib Final_3002_iputf_libs/mm_interconnect_0
vmap mm_interconnect_0 ./Final_3002_iputf_libs/mm_interconnect_0
vlib Final_3002_iputf_libs/pll_reconfig_0
vmap pll_reconfig_0 ./Final_3002_iputf_libs/pll_reconfig_0
vlib Final_3002_iputf_libs/pll_0
vmap pll_0 ./Final_3002_iputf_libs/pll_0
vlib Final_3002_iputf_libs/master_0
vmap master_0 ./Final_3002_iputf_libs/master_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog     "F:/FPGADesign/Final/quartus/issp/simulation/submodules/altsource_probe.v"                       -work in_system_sources_probes_0                 
vlog     "F:/FPGADesign/Final/quartus/issp/simulation/issp.v"                                                                                              
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_merlin_slave_translator.sv"   -work pll_reconfig_0_mgmt_avalon_slave_translator
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_merlin_master_translator.sv"  -work master_0_master_translator                 
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_master_0_p2b_adapter.sv"    -work p2b_adapter                                
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_master_0_b2p_adapter.sv"    -work b2p_adapter                                
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_packets_to_master.v"   -work transacto                                  
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_packets_to_bytes.v" -work p2b                                        
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_bytes_to_packets.v" -work b2p                                        
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_sc_fifo.v"             -work fifo                                       
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_master_0_timing_adt.sv"     -work timing_adt                                 
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_jtag_interface.v"   -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_jtag_dc_streaming.v"          -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_jtag_sld_node.v"              -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_jtag_streaming.v"             -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_clock_crosser.v"    -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_std_synchronizer_nocut.v"     -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_pipeline_base.v"    -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_idle_remover.v"     -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_idle_inserter.v"    -work jtag_phy_embedded_in_jtag_master           
vlog -sv "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_avalon_st_pipeline_stage.sv"  -work jtag_phy_embedded_in_jtag_master           
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_reset_controller.v"           -work rst_controller                             
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_reset_synchronizer.v"         -work rst_controller                             
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_mm_interconnect_0.v"        -work mm_interconnect_0                          
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_pll_reconfig_top.v"           -work pll_reconfig_0                             
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_pll_reconfig_core.v"          -work pll_reconfig_0                             
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/altera_std_synchronizer.v"           -work pll_reconfig_0                             
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_pll_0.vo"                   -work pll_0                                      
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/submodules/jtag_pll_master_0.v"                 -work master_0                                   
vlog     "F:/FPGADesign/Final/quartus/jtag_pll/simulation/jtag_pll.v"                                                                                      
vlog     "F:/FPGADesign/Final/quartus/pll_sim/pll.vo"                                                                                                      

vlog -vlog01compat -work work +incdir+F:/FPGADesign/Final/quartus {F:/FPGADesign/Final/quartus/pll.vo}
vlog -vlog01compat -work work +incdir+F:/FPGADesign/Final/source {F:/FPGADesign/Final/source/counter.v}
vlog -vlog01compat -work work +incdir+F:/FPGADesign/Final/source {F:/FPGADesign/Final/source/Final_3002.v}
vlib pll
vmap pll pll
vlog -vlog01compat -work pll +incdir+F:/FPGADesign/Final/quartus/pll {F:/FPGADesign/Final/quartus/pll/pll_0002.v}

vlog -vlog01compat -work work +incdir+F:/FPGADesign/Final/quartus/../source {F:/FPGADesign/Final/quartus/../source/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L pll -L in_system_sources_probes_0 -L pll_reconfig_0_mgmt_avalon_slave_translator -L master_0_master_translator -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_0 -L pll_reconfig_0 -L pll_0 -L master_0 -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
