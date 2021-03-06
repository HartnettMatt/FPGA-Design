module VTC(
  input wire        clock_in,
  input             reset,
  output reg        vSync,
  output reg        hSync,
  output reg [31:0] hPixel,
  output reg [31:0] line,
  output        video_active
);

`define lowRes
`include "params.vh"

reg hActive;
reg vActive;

always @(posedge clock_in, negedge reset)
// Check reset
  begin
    if(reset == 0)
      begin
        hPixel[31:0] = 0;
        line[31:0] = 0;
      end
// Increment hPixel and line
    else if(hPixel < syncTimeH-1)
        hPixel = hPixel + 1;
    else
      begin
        hPixel = 0;
        if(line < syncTimeV-1)
            line = line + 1;
        else
            line = 0;
      end
    end

always@(posedge clock_in)
// Create hSync signal
          if(hPixel < pulseWidthH)
              hSync = 0;
          else
              hSync = 1;
always @(posedge clock_in)
// Create vSync signal
          if(line < pulseWidthV)
              vSync = 0;
          else
              vSync = 1;

// Create video_active signal
  // Horizontal Active
  always@(posedge clock_in)
      if(hSync == 1 && hPixel - pulseWidthH >= bPorchH && hPixel <= syncTimeH - fPorchH - 1)
          hActive = 1;
      else
          hActive = 0;
// Vertical Active
  always@(posedge clock_in)
      if(vSync == 1 && line - pulseWidthV >= bPorchV && line <= syncTimeV - fPorchV - 1)
          vActive = 1;
      else
          vActive = 0;
  assign video_active = hActive & vActive;

endmodule
