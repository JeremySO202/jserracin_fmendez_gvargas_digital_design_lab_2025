module RGB_Controller(
    input logic [6:0] posicion,
    input logic [5:0][6:0] tablero, 
    input logic [5:0][6:0] fichas,  
    input logic jugador, 
    input logic finJuego, 
    input logic [9:0] x, y,
    output logic [7:0] r, g, b 
);

    parameter WHITE = 2'b00;
    parameter RED = 2'b01;
    parameter BLUE = 2'b10;
    parameter BLACK = 2'b11;

    logic [1:0] color;
    integer columna;
    integer fila;

    logic showWinner; 

    WinnerScreen winnerScreen_inst (
        .x(x),
        .y(y),
        .finJuego(finJuego),
        .columna(columna),
        .show(showWinner)
    );


    
    always_comb begin
       
        color = BLACK;

        
        columna = 6 -  x / 92; // 88 de grosor y 4 de línea divisora
        fila = 5 - (y-28) / 76;

		// líneas divisorias
		if ((x % 92) >= 88 && (x % 92) < 92) begin
			color = WHITE; 
		end
		// fichas
		else if (fila >= 0 && fila < 6 && columna >= 0 && columna < 7 && tablero[fila][columna]) begin
			color = fichas[fila][columna] ? RED : BLUE; 
		end
		// cursor
		else if (y < 29 && columna >= 0 && columna < 7 && posicion[columna]) begin
            
			color = showWinner ? WHITE : (jugador ? RED : BLUE); 
		end

        // para asignar los colores
        case (color)
            WHITE: begin
                r = 8'hFF;
                g = 8'hFF;
                b = 8'hFF;
            end
            RED: begin
                r = 8'hFF;
                g = 8'h00;
                b = 8'h00;
            end
            BLUE: begin
                r = 8'h00;
                g = 8'h00;
                b = 8'hFF;
            end
            BLACK: begin
                r = 8'h00;
                g = 8'h00;
                b = 8'h00;
            end
            default: begin
                r = 8'h00;
                g = 8'h00;
                b = 8'h00;
            end
        endcase
    end

endmodule