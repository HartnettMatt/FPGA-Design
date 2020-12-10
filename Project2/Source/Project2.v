
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
parameter divide_by = 200;

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire reset, lock, clk, clk_1;
wire sda_in, sda_out, i2c_sclk, ts, done, ready;
wire [3:0] CS;
reg [15:0] data;
wire [1:0] tempKEY;
reg ack, start;
reg [3:0] doneCounter;
reg [7:0] address;
//Switch if testing with ISSP
assign reset = KEY[0] & lock;
// assign reset = tempKEY[0] & lock;
//=======================================================
//  Structural coding
//=======================================================
clock clk_U0(.clock_in(CLOCK_50), .lock(lock), .clock_out(clk));
clockDivider clk_U1(.clock_in(CLOCK_50), .reset_n(reset), .divide_by(divide_by), .clock_out(clk_1));

audio audio_U0(.clk(clk), .reset_n(reset), .ready(ready), .adcdat(adcdat), .adclrck(adclrck), .bclk(bclk), .dacdat(dacdat), .daclrck(daclrck), .xck(xck));


//This section is for ACK testing using ISSP - current version is issp_U2 and issp2.tcl
// issp issp_U0(.probe(FPGA_I2C_SDAT), .source_clk(clk), .source({ts, FPGA_I2C_SCLK, sda_out}));
// issp1 issp_U1(.probe({FPGA_I2C_SDAT, ts}), .source({tempKEY[1], tempKEY[0]}));
// issp1 issp_U2(.probe({CS[3:0], ts, ack}), .source(tempKEY));
// i2c i2c_TEST(.clk(clk), .reset_n(reset), .i2c_sdat(sda_out), .i2c_sclk(i2c_sclk), .key(tempKEY[1]), .ts(ts), .data(data), .CurrS(CS[3:0]));


i2c i2c_U0(.clk(clk_1), .reset_n(reset), .i2c_sdat(sda_out), .i2c_sclk(i2c_sclk), .start(start), .ts(ts), .ready(ready));

assign FPGA_I2C_SDAT = ts ? 1'bZ : sda_out;
assign FPGA_I2C_SCLK = i2c_sclk ? 1'b1 : clk_1;
always @ ( * ) begin
	if(KEY[1] == 0 && reset != 0)
		start = 1'b0;
end
endmodule
