module ECEN3002_Lab1_ClockDivider(clock_in, reset_n, divide_by, clock_out);

input clock_in;
input reset_n;
input [31:0] divide_by;

output reg clock_out;

// clock_divider is used to keep track of how many clock_in cycles have happend since the last clock_out edge
reg [31:0] clock_divider = 0;

initial begin
  clock_out = 0;
  clock_divider = 0;
end

always @(posedge clock_in or negedge reset_n)
  begin
    // Reset block:
    if (~reset_n)
      begin
        clock_out = 0;
        clock_divider = 0;
      end
    else
      begin
      // Keep track of cycles
        if(clock_divider != divide_by - 1)
          clock_divider <= clock_divider + 1;
        else
        // Create clock_out edge
          begin
            clock_divider <= 0;
            clock_out <= ~clock_out;
          end
      end
  end
endmodule
