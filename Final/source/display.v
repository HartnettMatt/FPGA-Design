module display (count_in, HEX4, HEX3, HEX2);
input [9:0] count_in;
output reg [6:0] HEX4, HEX3, HEX2;

`include "params.vh"

always @ (posedge count_in[2])
	case (count_in[5:3])
		3'h0:   begin
					HEX4 = top;
					HEX3 = off;
					HEX2 = off;
				end
		3'h1:   begin
					HEX4 = off;
					HEX3 = top;
					HEX2 = off;
				end
		3'h2:   begin
					HEX4 = off;
					HEX3 = off;
					HEX2 = top;
				end
		3'h3:   begin
					HEX4 = off;
					HEX3 = off;
					HEX2 = upper_right;
				end
		3'h4:   begin
					HEX4 = off;
					HEX3 = off;
					HEX2 = lower_right;
				end
		3'h5:   begin
					HEX4 = off;
					HEX3 = off;
					HEX2 = bottom;
				end
		3'h6:   begin
					HEX4 = off;
					HEX3 = bottom;
					HEX2 = off;
				end
		3'h7:   begin
					HEX4 = bottom;
					HEX3 = off;
					HEX2 = off;
				end
	endcase
endmodule