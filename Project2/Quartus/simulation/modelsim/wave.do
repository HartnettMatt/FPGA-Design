add wave -divider "Top Level"
add wave testKEY[1:0]
# add wave testKEY[1]
# add wave clock
add wave DUT/reset
add wave -label ts DUT/ts
add wave DUT/CS
add wave DUT/ack

add wave -divider "I2C"
add wave -label SCLK testFPGA_I2C_SCLK
add wave -label SDAT testFPGA_I2C_SDAT
add wave -label Counter -radix unsigned DUT/i2c_U0/counter
add wave -label CS DUT/i2c_U0/CS
add wave -label Address DUT/i2c_U0/OL/address
add wave -radix binary -label Data_out DUT/i2c_U0/OL/data_out

add wave -divider "PLL"
add wave -label Clock DUT/clk_U0/PLL1/outclk_0
# add wave DUT/clk_U0/PLL1/rst
# add wave DUT/clk_U0/PLL1/locked

# wave -divider "Clock.v"
# add wave DUT/clk_U0/clock_out
# add wave DUT/clk_U0/lock
