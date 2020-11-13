module  i2c_CLS(
  input wire clk,
  input wire reset_n,
  output reg [3:0] CS,
  input wire [3:0] NS
  );
`include "i2c_states.vh"

always @ (posedge clk, negedge reset_n)
  if(reset_n == 0)
    CS <= Wait_STATE;
  else
    CS <= NS;

endmodule // i2c_CSL
