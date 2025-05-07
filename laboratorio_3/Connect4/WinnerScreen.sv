module WinnerScreen (
    input logic [9:0] x, y,
    input logic finJuego, // Fin del juego
    input logic [2:0] columna, // columna activa (0-6)
    output logic show
);

    logic [9:0] cursorX;
    logic [9:0] cursorY;

    always_comb begin
        // Posición superior izquierda donde empieza la palabra
        cursorX = columna * 92 + 10;
        cursorY = 0;

        show = 0;
        if (finJuego) begin
            // Letra E
            if ((x >= cursorX && x < cursorX + 5 && y >= cursorY && y < cursorY + 30) || // barra vertical izquierda
                (x >= cursorX + 5 && x < cursorX + 15 &&
                ((y >= cursorY && y < cursorY + 3) || (y >= cursorY + 11 && y < cursorY + 14) || (y >= cursorY + 22 && y < cursorY + 30)))) // barras horizontales
                show = 1;

            // Letra N
            else if ((x >= cursorX + 20 && x < cursorX + 25 && y >= cursorY && y < cursorY + 30) || // barra izquierda
                    (x >= cursorX + 35 && x < cursorX + 40 && y >= cursorY && y < cursorY + 30) || // barra derecha
                    ((x - (cursorX + 20)) == (y - cursorY) && // diagonal
                    x >= cursorX + 20 && x < cursorX + 40 && y >= cursorY && y < cursorY + 30))
                show = 1;

            // Letra D
            else if ((x >= cursorX + 50 && x < cursorX + 55 && y >= cursorY && y < cursorY + 30) || // barra izquierda
                    (x >= cursorX + 55 && x < cursorX + 65 &&
                    ((y >= cursorY && y < cursorY + 3) || (y >= cursorY + 27 && y < cursorY + 30))) || // barras horizontales
                    (x >= cursorX + 65 && x < cursorX + 70 && y >= cursorY + 3 && y < cursorY + 27)) // barra derecha
                show = 1;
        end
    end

        
endmodule
