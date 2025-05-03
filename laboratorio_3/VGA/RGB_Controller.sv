module RGB_Controller(
	input logic [5:0][6:0] tablero, // Matriz de 6x7 para el tablero
    input logic [5:0][6:0] fichas   // Matriz de 6x7 para las fichas
	input logic [9:0] x,y,
	output logic [7:0] r,g,b);
	
	// Espacio para el cursor (flecha) en la parte superior
	logic cursor_area;
	assign cursor_area = (y > 0 && y < 34);

	// Dibujar las líneas verticales para las casillas (6x7)
	logic vertical_lines;
	assign vertical_lines = 
		((x > 143 && x < 153) || (x > 234 && x < 244) || (x > 325 && x < 335) || 
		 (x > 416 && x < 426) || (x > 507 && x < 517) || (x > 598 && x < 608) || 
		 (x > 689 && x < 699)) && (y > 34 && y < 515);

	// Dibujar las fichas en el medio de las líneas
	logic ficha_area;
	assign ficha_area = (tablero[y / 81][x / 91] && fichas[y / 81][x / 91]);

	// Asignar colores
	assign r = ficha_area ? 8'hFF : (vertical_lines ? 8'hFF : (cursor_area ? 8'hFF : 8'h00));
	assign g = ficha_area ? 8'h00 : (vertical_lines ? 8'hFF : (cursor_area ? 8'hFF : 8'h00));
	assign b = ficha_area ? 8'h00 : (vertical_lines ? 8'hFF : (cursor_area ? 8'hFF : 8'h00));
	
endmodule