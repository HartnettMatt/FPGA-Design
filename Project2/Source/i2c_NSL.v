
module  i2c_NSL(
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  output reg [3:0] NS,
  input wire [3:0] sm_in
  );

`include "i2c_states.vh"

always @ (*)
  case(CS)
    Wait_STATE:     if(sm_in[0] == 1'b1)
                      NS = Start_STATE;
                    else
                      NS = Wait_STATE;
    Start_STATE:    NS = Address_STATE;
    Address_STATE:  if(sm_in[1] == 1'b1)
                      NS = Ack1_STATE;
                    else
                      NS = Address_STATE;
    Ack1_STATE:     if(sm_in[2] == 1'b1)
                      NS = Data1_STATE;
                    else
                      NS = Wait_STATE;
    Data1_STATE:  if(sm_in[1] == 1'b1)
                      NS = Ack2_STATE;
                    else
                      NS = Data1_STATE;
    Ack2_STATE:     if(sm_in[2] == 1'b1)
                      NS = Data2_STATE;
                    else
                      NS = Wait_STATE;
    Data2_STATE:  if(sm_in[1] == 1'b1)
                      NS = Ack3_STATE;
                    else
                      NS = Data2_STATE;
    Ack3_STATE:     if(sm_in[2] == 1'b1)
                      NS = Stop_STATE;
                    else
                      NS = Wait_STATE;
    Stop_STATE:     NS = Wait_STATE;
    default:
      NS = Wait_STATE;
  endcase
endmodule // i2c_NSL
