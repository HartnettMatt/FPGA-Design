module audio (
  input clk,
  input reset_n,
  input ready,
  input adcdat,
  output adclrck,
  output bclk,
  output dacdat,
  output daclrck,
  output xck
  );

reg pulse, data;
reg [7:0] pulseCounter;
reg [7:0] address;
wire [15:0] q;

assign bclk = clk;
assign xck = clk;
assign dacdat = data;
assign daclrck = pulse;

parameter max_count = 250;

// Need to comment out to run test bench
// rom rom_U0(.address(address), .clock(clk), .q(q));

always @ ( posedge pulse ) begin
  if(reset_n == 1'b0)
    address = 0;
  else if (address >= 24055)
    address = 0;
  else if(ready)
    address = address + 1;
end

always @ (negedge clk or negedge reset_n) begin
  if(reset_n == 1'b0) begin
    pulse = 0;
    pulseCounter = 0;
  end
  else begin
    if (pulseCounter == max_count) begin
      pulse = 1;
      pulseCounter = 0;
    end
    else begin
      pulse = 0;
      pulseCounter = pulseCounter + 1;
    end
  end
end

always @ ( negedge clk ) begin
  case(pulseCounter-1)
    8'h00: data <= q[15];
    8'h01: data <= q[14];
    8'h02: data <= q[13];
    8'h03: data <= q[12];
    8'h04: data <= q[11];
    8'h05: data <= q[10];
    8'h06: data <= q[9];
    8'h07: data <= q[8];
    8'h08: data <= q[7];
    8'h09: data <= q[6];
    8'h0a: data <= q[5];
    8'h0b: data <= q[4];
    8'h0c: data <= q[3];
    8'h0d: data <= q[2];
    8'h0e: data <= q[1];
    8'h0f: data <= q[0];

    8'h10: data <= q[15];
    8'h11: data <= q[14];
    8'h12: data <= q[13];
    8'h13: data <= q[12];
    8'h14: data <= q[11];
    8'h15: data <= q[10];
    8'h16: data <= q[9];
    8'h17: data <= q[8];
    8'h18: data <= q[7];
    8'h19: data <= q[6];
    8'h1a: data <= q[5];
    8'h1b: data <= q[4];
    8'h1c: data <= q[3];
    8'h1d: data <= q[2];
    8'h1e: data <= q[1];
    8'h1f: data <= q[0];
  endcase

end

endmodule // aud
