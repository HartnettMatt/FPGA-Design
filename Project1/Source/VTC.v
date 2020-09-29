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

reg hActive;
reg vActive;

always@(posedge clock_in or negedge reset)
// Check reset
  begin
    if(reset == 0)
      begin
        hPixel[31:0] = 0;
        line[31:0] = 0;
        hSync = 0;
        vSync = 0;
        video_active = 0;
      end
    else if(clock_in == 1)
// Increment hPixel and line
      begin
        if(hPixel < syncTimeH-1)
          begin
            hPixel = hPixel + 1;
          end
        else
          begin
            hPixel = 0;
            hSync = 0;
            if(line < syncTimeV-1)
              begin
                line = line + 1;
              end
            else
              begin
                line = 0;
                vSync = 0;
              end
          end
// Create hSync signal
          if(hPixel >= pulseWidthH)
            begin
              hSync = 1;
            end
          else
            begin
              hSync = 0;
            end
// Create vSync signal
          if(line >= pulseWidthV)
            begin
              vSync = 1;
            end
          else
            begin
              vSync = 0;
            end

// Create video_active signal
          if(hSync == 1 && hPixel - pulseWidthH >= bPorchH && hPixel <= syncTimeH - fPorchH - 1)
            begin
              hActive = 1;
            end
          else
            begin
              hActive = 0;
            end
          if(vSync == 1 && line - pulseWidthV >= bPorchV && line <= syncTimeV - fPorchV - 1)
            begin
              vActive = 1;
            end
          else
            begin
              vActive = 0;
            end
            
          video_active = hActive & vActive;

      end
  end

endmodule
