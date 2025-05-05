/* no está parametrizable completamente, está pensada para este tamaño 
especificamente pero los puse de esa manera para que luego si se hace algun cambio solo cambiar el resto, si quisiera hacerlo completamente 
parametrizable debería de hacerlo poniendo las fichas como variable también*/
module Ganador#(
    parameter int rows = 6,
    parameter int columns = 7
)(
    input logic jugador,
    input logic [rows-1:0][columns-1:0] board,
    output logic ganador
);
// voy a empezar por iterar revisando horizontalmente en las primeras 4 columnas
/* 0 0 0 0 0 0 0
	0 0 0 0 0 0 0
	0 0 0 0 0 0 0
	0 0 0 0 0 0 0
	0 0 0 0 0 0 0
	0 0 0 0 0 0 0 */
	
	always_comb begin: gane
		ganador = 1'b0;

		for(int c =0; c< columns-3; c++) begin
			for (int r = 0; r<rows; r++) begin
				if (board[r][c] == jugador &&
					board[r][c+1] == jugador &&
					board[r][c+2] == jugador && 
					board[r][c+3] == jugador)begin
					ganador = 1'b1;
					disable gane;
				end
			end
		end
		
		//ahora para los primeros 4 verticales
		for(int c =0; c< columns; c++) begin
			for (int r = 0; r<rows-3; r++) begin
				if (board[r][c] == jugador &&
					board[r+1][c] == jugador &&
					board[r+2][c] == jugador && 
					board[r+3][c] == jugador)begin
					ganador = 1'b1;
					disable gane;
				end
			end
		end

	
		//diagonales para arriba
		for(int c =0; c< columns-3; c++) begin
			for (int r = 0; r<rows-3; r++) begin
				if (board[r][c] == jugador &&
					board[r+1][c+1] == jugador &&
					board[r+2][c+2] == jugador && 
					board[r+3][c+3] == jugador)begin
					ganador = 1'b1;
					disable gane;
				end
			end
		end
		
	
		//diagonales para abajo
		for(int c =0; c< columns-3; c++) begin
			for (int r = 3; r< rows; r++) begin
				if (board[r][c] == jugador &&
					board[r-1][c+1] == jugador &&
					board[r-2][c+2] == jugador && 
					board[r-3][c+3] == jugador)begin
					ganador = 1'b1;
					disable gane;
				end
			end
		end
	end
	

endmodule