module clock(
  input wire       clock_in,
  input wire       reset,
  output wire      clock_out
);

wire pll_Out;
wire lock;

video_pll PLL(.refclk(clock_in), .rst(~reset), .outclk_0(pll_Out), .locked(lock));

assign clock_out = pll_Out & lock & !reset;

endmodule
