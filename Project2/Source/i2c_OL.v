module i2c_OL (
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  input wire [3:0] NS,
  input wire key,
  output reg [5:0] counter,
  output reg i2c_sdat,
  output reg ts
  );
`include "i2c_states.vh"


always @ ( posedge clk ) begin
  if(counter == 0)
    if(key == 0)
      counter = 1;
    else
      counter = 0;
  else
    counter <= counter + 1;
end

always @ (*)
  case(CS)
    Wait_STATE:     begin
                      i2c_sdat = 1;
                      ts = 1'b0;
                    end
    Start_STATE:    i2c_sdat = 1'b0;
    // Address_STATE:
    // Ack1_STATE:
    // Data1_STATE:
    // Ack2_STATE:
    // Data2_STATE:
    // Ack3_STATE:
    // Stop_STATE:
    // default:
  endcase
endmodule // i2c_OL
