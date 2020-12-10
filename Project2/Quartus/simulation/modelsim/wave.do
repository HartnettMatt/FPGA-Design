add wave -divider "Top Level"
add wave -label KEY testKEY[1:0]
# add wave testKEY[1]
# add wave clock
add wave -label reset_n DUT/reset
add wave -label ts DUT/ts

add wave -divider "I2C"
add wave -label SCLK testFPGA_I2C_SCLK
add wave -label SDAT testFPGA_I2C_SDAT
add wave -label Counter -radix unsigned DUT/i2c_U0/counter
add wave -label CS DUT/i2c_U0/CS
add wave -label Address_out DUT/i2c_U0/OL/address_out
add wave -label Data_out DUT/i2c_U0/OL/data_out
add wave -label sendCounter DUT/i2c_U0/OL/sendCounter
add wave -label start DUT/i2c_U0/OL/start
add wave -label clk DUT/i2c_U0/OL/clk

add wave -divider "PLL"
add wave -label Clock DUT/clk_U0/PLL1/outclk_0
# add wave DUT/clk_U0/PLL1/rst
# add wave DUT/clk_U0/PLL1/locked

add wave -divider "Audio.v"
add wave -label Pulse DUT/audio_U0/pulse
add wave -label pulseCounter DUT/audio_U0/pulseCounter
