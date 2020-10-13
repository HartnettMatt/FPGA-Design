
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Project1(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output 		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS
);

`define simulation
`include "params.vh"

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire clk;
// RR, vectors not scalars for hPixel and line
wire [31:0] hPixel;
wire [31:0] line;

wire video_active;
wire reset;
wire vSync;
//=======================================================
//  Structural coding
//=======================================================
assign VGA_BLANK_N = 1;
assign VGA_SYNC_N = 0;
assign VGA_CLK = clk;
assign VGA_VS = vSync;
assign LEDR[9:1] = 9'b000000000;
assign HEX0 = 7'b1111111;
assign HEX1 = 7'b1111111;
assign HEX1 = 7'b1111111;
assign HEX2 = 7'b1111111;
assign HEX3 = 7'b1111111;
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;
assign LEDR[0] = video_active;

clock U0(
	.clock_in(CLOCK_50),
	.reset(reset),
	.key(KEY[0]),
	.clock_out(clk)
	);

VTC U1(
	.clock_in(clk),
	.reset(reset),
	.vSync(vSync),
	.hSync(VGA_HS),
	.hPixel(hPixel),
	.line(line),
	.video_active(video_active)
	);

PG U2(
	.hPixel(hPixel),
	.line(line),
	.video_active(video_active),
	.vSync(vSync),
	.clk(clk),
	.KEY(KEY[3:1]),
	.SW(SW[9:0]),
	.VGA_B(VGA_B),
	.VGA_G(VGA_G),
	.VGA_R(VGA_R)
	);


endmodule
