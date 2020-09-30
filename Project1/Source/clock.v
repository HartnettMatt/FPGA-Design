module clock(
  input wire       clock_in,
  input wire       key,
  output           reset,
  output wire      clock_out
);

wire pll_Out;
wire lock;

video_pll PLL1(.refclk(clock_in), .rst(~key), .outclk_0(pll_Out), .locked(lock));

// Clean up clock signal with the reset deassert signal shown in lecture
assign clock_out = pll_Out;
assign reset = key & lock;

endmodule
