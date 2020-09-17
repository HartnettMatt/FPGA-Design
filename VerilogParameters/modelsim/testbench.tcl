# stop any simulation that is currently running
quit -sim
# create the default "work" library
vlib work;
# compile the Verilog source code in the source folder
vlog ../source/top.v ../source/clkdiv.v +incdir+../source
#vlog ../source/*.v +incdir+../source
#vlog ../source/*.v
# compile the Verilog testbench
# the +incdir+ is necessary so that the params.vh file is found
vlog ../source/tb_modelsim.v +incdir+../source
#vlog ../testbench.v
# start the Simulator, including some libraries that may be needed
vsim work.tb_modelsim -Lf 220model -Lf altera_mf_ver -Lf verilog
# show waveforms specified in wave.do
do wave.do
# advance the simulation the desired amount of time
run 2 us
