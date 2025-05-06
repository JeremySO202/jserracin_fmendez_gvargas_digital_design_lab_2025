module VGA(input logic clk, // Debe de ser de 50MHz
	input logic [6:0] posicion, // Posición del jugador (1 bit activo por columna)
	input logic [5:0][6:0] tablero, // Matriz de 6x7 para el tablero
	input logic [5:0][6:0] fichas,   // Matriz de 6x7 para las fichas
	input logic jugador, // Jugador actual (1 o 2)
	input logic finJuego, // Fin del juego
	output logic vgaclk, // 25.175 MHz VGA clock
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b);
	
	 
	 
	
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