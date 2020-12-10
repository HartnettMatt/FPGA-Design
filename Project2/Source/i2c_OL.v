module i2c_OL (
  input wire clk,
  input wire reset_n,
  input wire [3:0] CS,
  input wire [3:0] NS,
  input wire start,
  output reg [4:0] counter,
  output reg i2c_sdat,
  output reg i2c_sclk,
  output reg ts,
  output reg ready
  );
`include "i2c_states.vh"
`include "address.vh"

reg [15:0] data_out;
reg [7:0] address_out;
reg [15:0] data;
reg [7:0] address;
reg [3:0] sendCounter;
always @ ( posedge clk, negedge reset_n) begin
  if(reset_n == 0) begin
    counter <= 0;
  end
  else begin
    if(counter == 0)
      if(start == 0)
        counter <= 1;
      else
        counter <= 0;
    else
      counter <= counter + 1;
  end
end

always @ (posedge clk or negedge reset_n) begin
  if(reset_n == 1'b0)
    sendCounter = 0;
  case(CS)
    Wait_STATE:     begin
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                      ts = 1'b0;
                    end
    Start_STATE:    begin
                      ts = 1'b0;
                      i2c_sdat = 1'b0;
                      i2c_sclk = 1'b0;
                      address_out = address;
                      data_out = data;
                    end
    Address_STATE:  begin
                      ts = 1'b0;
                      if(clk == 1'b1) begin
                        i2c_sdat = address_out[7];
                        address_out = address_out << 1;
                      end
                    end
    Ack1_STATE:     ts = 1'b1;
    Data1_STATE:    begin
                      ts = 1'b0;
                      if(clk == 1'b1) begin
                        i2c_sdat = data_out[15];
                        data_out = data_out << 1;
                      end
                    end
    Ack2_STATE:     ts = 1'b1;
    Data2_STATE:    begin
                      ts = 1'b0;
                      if(clk == 1'b1) begin
                        i2c_sdat = data_out[15];
                        data_out = data_out << 1;
                      end
                    end
    Ack3_STATE:     ts = 1'b1;
    Stop_STATE:     if(clk == 1'b1) begin
                      ts = 1'b0;
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                      sendCounter = sendCounter + 1;
                    end
    default:        begin
                      ts = 1'b0;
                      i2c_sdat = 1'b1;
                      i2c_sclk = 1'b1;
                    end
  endcase
end
always @ ( * ) begin
if(reset_n == 1'b0) begin
  ready = 1'b0;
end
case(sendCounter)
  0: begin
      address = i2c_data_1[23:16];
      data = i2c_data_1[15:0];
    end
  1: begin
      address = i2c_data_2[23:16];
      data = i2c_data_2[15:0];
    end
  2: begin
      address = i2c_data_3[23:16];
      data = i2c_data_3[15:0];
    end
  3: begin
      address = i2c_data_4[23:16];
      data = i2c_data_4[15:0];
    end
  4: begin
      address = i2c_data_5[23:16];
      data = i2c_data_5[15:0];
    end
  5: begin
      address = i2c_data_6[23:16];
      data = i2c_data_6[15:0];
    end
  6: begin
      address = i2c_data_7[23:16];
      data = i2c_data_7[15:0];
      ready = 1'b1;
    end
  endcase
end

endmodule // i2c_OL
