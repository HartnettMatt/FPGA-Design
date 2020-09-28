module ResetTiming (
input 		     CLOCK_50,
input      [0:0] KEY,
input      [1:0] SW,
output reg [7:0] LEDR
);

wire [7:0] U0_out, U1_out, U2_out, U3_out;
wire reset_n;
reg reset_n_0, reset_n_1, reset_n_2, reset_n_3;  /*  synthesis keep */

// Instantiate reset module
reset U4 (.clock(CLOCK_50), .ext_reset_n(KEY[0]), .lock(1'b1), .reset_n(reset_n));

 // Mux the counter outputs to LEDRs
always @ (*)
    case (SW)
        2'b00:  LEDR = U0_out;
        2'b01:  LEDR = U1_out;
        2'b10:  LEDR = U2_out;
        2'b11:  LEDR = U3_out;
    endcase

//  Start here, look at reset timing with common reset

// Create 4 counters with common reset signals
// counter U0 (.clock (CLOCK_50), .reset_n (reset_n), .countout (U0_out));
// counter U1 (.clock (CLOCK_50), .reset_n (reset_n), .countout (U1_out));
// counter U2 (.clock (CLOCK_50), .reset_n (reset_n), .countout (U2_out));
// counter U3 (.clock (CLOCK_50), .reset_n (reset_n), .countout (U3_out));

//  This block of code creates 4 unique reset signal
// Create 4 counters with unique reset signals
counter U0 (.clock (CLOCK_50), .reset_n (reset_n_0), .countout (U0_out));
counter U1 (.clock (CLOCK_50), .reset_n (reset_n_1), .countout (U1_out));
counter U2 (.clock (CLOCK_50), .reset_n (reset_n_2), .countout (U2_out));
counter U3 (.clock (CLOCK_50), .reset_n (reset_n_3), .countout (U3_out));

// Create 4 unique reset signals
always @ (posedge CLOCK_50)
    begin
        reset_n_0 <= reset_n;
        reset_n_1 <= reset_n;
        reset_n_2 <= reset_n;
        reset_n_3 <= reset_n;
    end

endmodule
