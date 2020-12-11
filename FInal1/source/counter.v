module counter (input clk, reset_n, output [9:0] q);

reg [27:0] count;

always @ (posedge clk or negedge reset_n)
    if (reset_n == 1'b0)
        count <= 0;
    else
        count <= count + 1'b1;

assign q = count [27:18];

endmodule