module PG_B(
  input  [31:0]         hPixel,
  input  [31:0]         line,
  input           video_active,
  input           vSync,
  input           clk,
  input    [2:0]  KEY,
  input    [9:0]  SW,
  output	 [7:0]  VGA_B,
	output   [7:0]	VGA_G,
	output   [7:0]	VGA_R
);

`define lowRes
`include "params.vh"


reg [39:0] box1;      //Encoding for the location of the box - box1[39:20] is left right bound, box1[19:0] is top bottom bound
reg [23:0] box1Color;

reg [39:0] box2;
reg [23:0] box2Color;

reg [7:0] red;
reg [7:0] green;
reg [7:0] blue;

reg [23:0] buffer_out;
reg [5:0] buffer_address;
wire [23:0] q;
reg [5:0] vCount;

assign VGA_R[7:0] = red[7:0];
assign VGA_G[7:0] = green[7:0];
assign VGA_B[7:0] = blue[7:0];

buffer b0(buffer_address, clk, q);

always @(*)
  begin
  buffer_out[23:0] = q[23:0];
    if(video_active == 1'b1)
      begin
        blue[7:0] = buffer_out[7:0];
        green[7:0] = buffer_out[15:8];
        red[7:0] = buffer_out[23:16];
      end
    else
      begin
      red[7:0] = 0;
      green[7:0] = 0;
      blue[7:0] = 0;
      end
  end
  always @(*)
    begin
      if(line >= 0 && line < 60)
        vCount[5:0] = 6'b000000;
      else if(line < 120)
        vCount[5:0] = 6'b001000;
      else if(line < 180)
        vCount[5:0] = 6'b010000;
      else if(line < 240)
        vCount[5:0] = 6'b011000;
      else if(line < 300)
        vCount[5:0] = 6'b100000;
      else if(line < 360)
        vCount[5:0] = 6'b101000;
      else if(line < 420)
        vCount[5:0] = 6'b110000;
      else if(line < 480)
        vCount[5:0] = 6'b111000;
      else
        vCount[5:0] = 6'b000000;
    end
always @(*)
  begin
    if(hPixel >= 0 && hPixel < 80)
      buffer_address[5:0] = 6'b00_0000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 160)
      buffer_address[5:0] = 6'b00_1000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 240)
      buffer_address[5:0] = 6'b01_0000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 320)
      buffer_address[5:0] = 6'b01_1000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 400)
      buffer_address[5:0] = 6'b10_0000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 480)
      buffer_address[5:0] = 6'b10_1000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 560)
      buffer_address[5:0] = 6'b11_0000 - vCount[5:0];
    else if(hPixel >= 80 && hPixel < 640)
      buffer_address[5:0] = 6'b11_1000 - vCount[5:0];
    else
      buffer_address[5:0] = 6'b00_0000;
  end
endmodule
