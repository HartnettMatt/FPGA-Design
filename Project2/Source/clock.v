module clock(
  input wire       clock_in,
  output           lock,
  output wire      clock_out
);

wire pll_Out;

pll PLL1(.refclk(clock_in), .rst(1'b0), .outclk_0(pll_Out), .locked(lock));

assign clock_out = pll_Out;

endmodule
