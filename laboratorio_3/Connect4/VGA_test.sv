module VGA_test(
	input logic [9:0] x,y,
	output logic [7:0] r,g,b);
	
	assign r = ((x > 143 && x < 784) && (y > 34 && y < 515)) ? 8'hFF : 8'h00;
	assign g = ((x > 143 && x < 784) && (y > 34 && y < 515)) ? 8'hFF : 8'h00;
	assign b = ((x > 143 && x < 784) && (y > 34 && y < 515)) ? 8'hFF : 8'h00;
	
endmodule