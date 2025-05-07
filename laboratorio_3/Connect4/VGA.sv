module VGA(input logic clk, 
	input logic [6:0] posicion, 
	input logic [5:0][6:0] tablero, 
	input logic [5:0][6:0] fichas, 
	input logic jugador, 
	input logic finJuego, 
	output logic vgaclk, // 25.175 MHz 
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b);
	
	 
//fichas se usa para ver que jugador es el de cada ficha
//tablero es donde está la parte de las posiciones
	
	logic [9:0] x, y;

	clockDivider clkDiv(clk, vgaclk);
	
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	
	RGB_Controller rgbCtrl(
		.posicion(posicion),
		.tablero(tablero),
		.fichas(fichas),
		.jugador(jugador),
		.finJuego(finJuego),
		.x(x),
		.y(y),
		.r(r),
		.g(g),
		.b(b)
	);

	
	
endmodule