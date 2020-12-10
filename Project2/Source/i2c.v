module i2c (
  input wire clk,
  input wire reset_n,
  input wire ts,
  inout i2c_sdat,
  input start,
  output i2c_sclk,
  output ready
  );


wire [3:0] CS;
assign CurrS = CS;
wire [3:0] NS;
wire [4:0] counter;
`include "i2c_states.vh"

i2c_CSL CSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS));
i2c_NSL NSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS), .counter(counter), .i2c_sdat(i2c_sdat));
i2c_OL OL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS), .counter(counter), .i2c_sdat(i2c_sdat), .i2c_sclk(i2c_sclk), .ts(ts), .start(start), .ready(ready));
endmodule // i2c
