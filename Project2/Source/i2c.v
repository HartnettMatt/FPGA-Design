module i2c (
  input wire clk,
  input wire reset_n,
  input wire i2c_sdat,
  input wire [3:0] key,
  output wire ts
  );


wire [3:0] CS;
wire [3:0] NS;
wire [3:0] sm_in;
assign sm_in[0] = key[1];

i2c_CSL CSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS));
i2c_NSL NSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS), .sm_in(sm_in));
i2c_OL OL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS), .sm_in(sm_in), .i2c_sdat(FPGA_I2C_SDAT), .ts(ts));

endmodule // i2c
