`timescale 1ns/1ps

module VGA_tb;

  logic clk;
  logic vgaclk;
  logic hsync, vsync;
  logic sync_b, blank_b;
  logic [7:0] r, g, b;
  logic [9:0] x, y;

  VGA dut (
    .clk(clk),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .sync_b(sync_b),
    .blank_b(blank_b),
    .r(r),
    .g(g),
    .b(b)
  );
  

  initial clk = 0;
  always #20 clk = ~clk;

  initial begin
    #16666667; 
    $stop;
  end

endmodule