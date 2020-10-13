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

//modified by RR
always@(posedge clock_in)
// Create hSync signal
          if((hPixel >= dispTimeH + fPorchH) && (hPixel < dispTimeH + fPorchH + pulseWidthH))
              hSync = 0;
          else
              hSync = 1;

// modified by RR
always @(posedge clock_in)
// Create vSync signal
          if(line >= (dispTimeV + fPorchV) && (line < dispTimeV + fPorchV + pulseWidthV))
              vSync = 0;
          else
              vSync = 1;

// modified by RR
// Create video_active signal
  // Horizontal Active
  always@(posedge clock_in)
      if(hPixel < dispTimeH)
          hActive = 1;
      else
          hActive = 0;

// modified by RR
// Vertical Active
  always@(posedge clock_in)
      if(line < dispTimeV)
          vActive = 1;
      else
          vActive = 0;
  assign video_active = hActive & vActive;

endmodule
