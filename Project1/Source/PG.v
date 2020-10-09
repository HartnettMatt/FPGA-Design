module PG(
  input           hPixel,
  input           line,
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

reg [39:0] box1;
reg [23:0] box1Color;

reg [39:0] box2;
reg [23:0] box2Color;

reg [7:0] red;
reg [7:0] green;
reg [7:0] blue;

// assign VGA_R[7:0] = red[7:0];
// assign VGA_G[7:0] = green[7:0];
// assign VGA_B[7:0] = blue[7:0];
assign VGA_R[7:0] = 8'b00000000;
assign VGA_G[7:0] = 8'b11110000;
assign VGA_B[7:0] = 8'b11111111;
always @(posedge clk)
begin
  if(hPixel >= box1[39:30] && hPixel <= box1[29:20] && line >= box1[19:10] && line <= box1[9:0])
  begin
    red[7:0] = box1Color[23:16];
    green[7:0] = box1Color[15:8];
    blue[7:0] = box1Color[7:0];
  end
  else if(hPixel > box2[39:30] && hPixel < box2[29:20] && line > box2[19:10] && line < box2[9:0])
  begin
    red[7:0] = box2Color[23:16];
    green[7:0] = box2Color[15:8];
    blue[7:0] = box2Color[7:0];
  end
  else
  begin
    red[7:0] = 0;
    green[7:0] = 0;
    blue[7:0] = 0;
  end
end

// always@(negedge vSync)
//   begin
//   // Neither are pressed
//     if(KEY[2:1] == 2'b11)
//     begin
//       box1[39:30] =
//
//   end
endmodule
