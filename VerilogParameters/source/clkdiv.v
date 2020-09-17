/* The DIVIDER parameter can be set to any default value.
   In this example, the expectation is that the calling module must
   provide the value, otherwise compilation will fail.
*/
module clkdiv #(parameter DIVIDER =0) (clk, reset_n, clkout);
input clk, reset_n;
output reg clkout;

// parameter divider = 0;
reg [31:0] counter;

always @ (posedge clk or negedge reset_n)
    if (reset_n == 1'b0)
        begin
            counter <= 0;
            clkout <= 1'b0;
        end
    else if (counter == DIVIDER - 1)
        begin
            counter <= 0;
            clkout <= ~clkout;
        end
    else    
        counter <= counter + 1'b1;

endmodule