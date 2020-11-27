module i2c_OL (
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  input wire [3:0] NS,
  output reg [5:0] counter,
  output reg i2c_sdat,
  output reg ts
  );
`include "i2c_states.vh"

always @ (*)
  case(CS)
    Wait_STATE:     counter = 0;
                    i2c_sdat = 1'b1;
                    ts = 1'b0;
    Start_STATE:    i2c_sdat = 1'b0;
    Address_STATE:
    Ack1_STATE:
    Data1_STATE:
    Ack2_STATE:
    Data2_STATE:
    Ack3_STATE:
    Stop_STATE:
    default:
      NS = Wait_STATE;
  endcase
endmodule // i2c_OL
