/*  This module is some strange code that will take a 12 bit binary input 
    and output 4 BCD values (0000 - 4095).
    Seems like magic, and using loops is not recommended, but it works. 
    https://my.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html

    When simulating this code, allow a delay before printing the output value.
    If just the $monitor statement is used, incorrect output values may be shown.
*/
module bin2bcd (input [11:0] binary_in, output reg [15:0] bcd_out);

integer i;

always @ (binary_in)
    begin
        bcd_out = 16'd0; 
        for (i = 11; i >= 0; i = i-1)
            begin
                if (bcd_out[15:12] >= 5)
                    bcd_out[15:12] = bcd_out[15:12] + 4'd3;
                if (bcd_out[11: 8] >= 5)
                    bcd_out[11: 8] = bcd_out[11: 8] + 4'd3;                
                if (bcd_out[ 7: 4] >= 5)
                    bcd_out[ 7: 4] = bcd_out[ 7: 4] + 4'd3;
                if (bcd_out[ 3: 0] >= 5)
                    bcd_out[ 3: 0] = bcd_out[ 3: 0] + 4'd3;

                bcd_out[15:12] = bcd_out[15:12] << 1;
                bcd_out[12]    = bcd_out[11];
                bcd_out[11: 8] = bcd_out[11:8] << 1;
                bcd_out[ 8]    = bcd_out[7];
                bcd_out[ 7: 4] = bcd_out[7:4] << 1;
                bcd_out[ 4]    = bcd_out[3];
                bcd_out[ 3: 0] = bcd_out[3:0] << 1;
                bcd_out[ 0]    = binary_in[i];
            end
    end

endmodule
         
       


