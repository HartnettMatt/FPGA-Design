
module Project2(

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
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,


	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// I2C for Audio //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT
);

// `include "i2c_states.vh"
parameter n = 3;
//=======================================================
//  REG/WIRE declarations
//=======================================================
wire reset, lock, clk;
wire sda_in, sda_out, ts;
assign reset = KEY[0] & lock;


//=======================================================
//  Structural coding
//=======================================================
clock clk_U0(.clock_in(CLOCK_50), .lock(lock), .clock_out(clk));
assign AUD_XCK = clk;

issp issp_U0(.probe(FPGA_I2C_SDAT), .source_clk(clk), .source({ts, FPGA_I2C_SCLK, sda_out}));

assign FPGA_I2C_SDAT = ts ? 1'bZ : sda_out;

endmodule
