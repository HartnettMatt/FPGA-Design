module reset (clock, ext_reset_n, lock, reset_n);
input clock, ext_reset_n, lock;
output reg reset_n;

reg q0, q1;
wire asynch_reset_n;

assign asynch_reset_n  = ext_reset_n & lock;

always @ (posedge clock or negedge asynch_reset_n)
    if (asynch_reset_n == 1'b0)
        begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            reset_n <= 1'b0;
        end
    else
        begin
            q0 <= 1'b1;
            q1 <= q0;
            reset_n <= q1;
        end 

endmodule