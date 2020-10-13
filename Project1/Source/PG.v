module PG(
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

reg [39:0] box1;
reg [23:0] box1Color;

reg [39:0] box2;
reg [23:0] box2Color;

reg [7:0] red;
reg [7:0] green;
reg [7:0] blue;

// Quick test
// always @ (*)
//     if ((video_active == 1'b1 ) && (hPixel <= 200))
//         begin
//             red = 8'b0111_1111;
//             green = 8'b0;
//             blue = 8'b0;
//         end
//     else
//         begin
//             red = 8'b0;
//             green = 8'b0;
//             blue = 8'b0;
//         end
//

assign VGA_R[7:0] = red[7:0];
assign VGA_G[7:0] = green[7:0];
assign VGA_B[7:0] = blue[7:0];


// assign VGA_R[7:0] = 8'b00000000;
// assign VGA_G[7:0] = 8'b11110000;
// assign VGA_B[7:0] = 8'b11111111;
always @(*)
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

always@(negedge vSync)
  begin
  // Neither are pressed
  case (KEY[2:1])
    2'b11 :
    begin
      box1[39:30] = 200;
      box1[29:20] = 300;
      box1[19:10] = 100;
      box1[9:0] = 200;
    end

    2'b10 :
    begin
      box1[39:30] = 400;
      box1[29:20] = 500;
      box1[19:10] = 100;
      box1[9:0] = 200;
    end

    2'b01 :
    begin
      box1[39:30] = 200;
      box1[29:20] = 300;
      box1[19:10] = 300;
      box1[9:0] = 400;
    end

    2'b00 :
    begin
      box1[39:30] = 400;
      box1[29:20] = 500;
      box1[19:10] = 300;
      box1[9:0] = 400;
    end

    default :
    begin
      box1[39:30] = 0;
      box1[29:20] = 0;
      box1[19:10] = 0;
      box1[9:0] = 0;
    end
  endcase

  box1Color[6:0] = 7'b1111111 * SW[0];
  box1Color[7] = SW[1];
  box1Color[14:8] = 7'b1111111 * SW[2];
  box1Color[15] = SW[3];
  box1Color[22:16] = 7'b1111111 * SW[4];
  box1Color[23] = SW[5];
  end
endmodule
