module counter (input clock, input reset_n, output reg [7:0] countout);

always @ (posedge clock, negedge reset_n)
    if (reset_n == 1'b0)
        countout <= 8'b0;
    else
        countout <= countout + 1'b1;

endmodule