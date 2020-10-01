module PG(
  input           hPixel,
  input           line,
  input           video_active,
  input    [2:0]  KEY,
  input    [9:0]  SW,
  output	 [7:0]  VGA_B,
	output   [7:0]	VGA_G,
	output   [7:0]	VGA_R
);

assign VGA_R = 8'hFF;
assign VGA_G = 8'hFF;
assign VGA_B = 8'hFF;

endmodule
