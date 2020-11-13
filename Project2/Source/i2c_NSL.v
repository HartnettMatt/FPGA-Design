
module  i2c_NSL(
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  output reg [3:0] NS,
  input wire i2c_sdat
  );
`include "i2c_states.vh"
always @ (*)
  case(CS)
    Wait_STATE:
      NS = Start_STATE;
    Start_STATE:
      NS = Address_STATE;
    default:
      NS = Wait_STATE;
endmodule // i2c_NSL
