module VTC(
  input wire        clock_in,
  input             reset,
  output reg        vSync,
  output reg        hSync,
  output reg [31:0] hPixel,
  output reg [31:0] line,
  output reg        video_active
);

`define lowRes
`include "params.vh"


always@(posedge clock_in or negedge reset)
  begin
    if(reset == 0)
      begin
        hPixel[31:0] = 0;
        line[31:0] = 0;
        hSync = 0;
        video_active = 0;
      end
    else if(clock_in == 1)
      begin
        if(hPixel < syncTimeH)
          begin
            hPixel = hPixel + 1;
          end
        else
          begin
            hPixel = 0;
            hSync = 0;
          end

          if(hPixel >= pulseWidthH)
            begin
              hSync = 1;
            end
          else
            begin
              hSync = 0;
            end

          if(hSync == 1 && hPixel - pulseWidthH > bPorchH && hPixel - pulseWidthH - bPorchH - dispTimeH < fPorchH)
            begin
              video_active = 1;
            end
          else
            begin
              video_active = 0;
            end
      end
  end

endmodule
