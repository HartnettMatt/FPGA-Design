
module  i2c_NSL(
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  output reg [3:0] NS,
  input wire [4:0] counter,
  input wire i2c_sdat
  );

`include "i2c_states.vh"

always @ (*)
  case(CS)
    Wait_STATE:     if(counter == 1)
                      NS = Start_STATE;
                    else
                      NS = Wait_STATE;
    Start_STATE:    NS = Address_STATE;
    Address_STATE:  if(counter == 10)
                      NS = Ack1_STATE;
                    else
                      NS = Address_STATE;
    Ack1_STATE:     if(counter == 11 && i2c_sdat == 0)
                      NS = Data1_STATE;
                    else
                      NS = Wait_STATE;
    Data1_STATE:  if(counter == 19)
                      NS = Ack2_STATE;
                    else
                      NS = Data1_STATE;
    Ack2_STATE:     if(counter == 20)
                      NS = Data2_STATE;
                    else
                      NS = Wait_STATE;
    Data2_STATE:  if(counter == 28)
                      NS = Ack3_STATE;
                    else
                      NS = Data2_STATE;
    Ack3_STATE:     if(counter == 29)
                      NS = Stop_STATE;
                    else
                      NS = Wait_STATE;
    Stop_STATE:     NS = Wait_STATE;
    default:
      NS = Wait_STATE;
  endcase
endmodule // i2c_NSL
