module VGA(input logic clk, // Debe de ser de 50MHz
	output logic vgaclk, // 25.175 MHz VGA clock
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b);
	
	 
	 
	
	logic [9:0] x, y;

	clockDivider clkDiv(clk, vgaclk);
	
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	
	RGB_Controller rgbCont(x,y,r,g,b);

	
	
endmodule