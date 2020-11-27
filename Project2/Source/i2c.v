module i2c (
  input wire clk,
  input wire reset_n,
  input wire key,
  input wire ts
  );


wire [3:0] CS;
wire [3:0] NS;
wire [5:0] counter;

i2c_CSL CSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS));
i2c_NSL NSL(.clk(clk), .reset_n(reset_n), .CS(CS), .NS(NS), .counter(counter));
i2c_OL OL();

endmodule // i2c
