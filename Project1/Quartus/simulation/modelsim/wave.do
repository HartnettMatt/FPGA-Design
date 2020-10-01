add wave -divider "Top Level"
add wave testKEY[0]
add wave clock
add wave DUT/reset

add wave -divider "VGA Out"
add wave testVGA_HS
add wave testVGA_VS
add wave testVGA_R
add wave testVGA_G
add wave testVGA_B

add wave -divider "PLL"
add wave DUT/U0/PLL1/outclk_0
add wave DUT/U0/PLL1/rst
add wave DUT/U0/PLL1/locked

add wave -divider "Clock.v"
add wave DUT/U0/clock_out
add wave DUT/U0/reset

add wave -divider "VTC.v"
add wave DUT/U1/vSync
add wave DUT/U1/hSync
add wave -radix decimal DUT/U1/hPixel
add wave -radix decimal DUT/U1/line
add wave DUT/U1/video_active
add wave DUT/U1/vActive
