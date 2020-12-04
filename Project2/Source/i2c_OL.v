module i2c_OL (
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  input wire [3:0] NS,
  input wire key,
  input wire [15:0] data,
  output reg [4:0] counter,
  output reg i2c_sdat,
  output reg i2c_sclk,
  output reg ts
  );
`include "i2c_states.vh"

reg [15:0] data_out;
reg [7:0] address;
always @ ( posedge clk, negedge reset_n) begin
  if(reset_n == 0) begin
    counter <= 0;
  end
  else begin
    if(counter == 0)
      if(key == 0)
        counter <= 1;
      else
        counter <= 0;
    else
      counter <= counter + 1;
  end
end

always @ (*)
  case(CS)
    Wait_STATE:     begin
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                      ts = 1'b0;
                      address = 8'b0011_0100;
                      data_out = data;
                    end
    Start_STATE:    begin
                      i2c_sdat = 1'b0;
                      i2c_sclk = 1'b0;
                    end
    Address_STATE:  begin
                      if(clk == 1'b0) begin
                        i2c_sdat = address[7];
                        address = address << 1;
                      end
                    end
    Ack1_STATE:     ts = 1'b1;
    Data1_STATE:    begin
                      ts = 1'b0;
                      if(clk == 1'b0) begin
                        i2c_sdat = data_out[15];
                        data_out = data_out << 1;
                      end
                    end
    Ack2_STATE:     ts = 1'b1;
    Data2_STATE:    begin
                      ts = 1'b0;
                      if(clk == 1'b0) begin
                        i2c_sdat = data_out[15];
                        data_out = data_out << 1;
                      end
                    end
    Ack3_STATE:     ts = 1'b1;
    Stop_STATE:     if(clk == 1'b1) begin
                      ts = 1'b0;
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                    end
    default:        begin
                      ts = 1'b0;
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                    end
  endcase
endmodule // i2c_OL
