`timescale 1ns / 1ps

module tb_verificarJugador;

    logic clk, reset, enable;
    logic btnIzq, btnDer, btnEnt;
    logic jugador;
    logic FT;
    logic [6:0] posicion;
    logic [5:0][6:0] tablero;
    logic [5:0][6:0] fichas;

    // Instancia del módulo bajo prueba (DUT)
    verificarJugador dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .btnIzq(btnIzq),
        .btnDer(btnDer),
        .btnEnt(btnEnt),
        .jugador(jugador),
        .FT(FT),
        .posicion(posicion),
        .tablero(tablero),
        .fichas(fichas)
    );

    // Generación de reloj
    initial clk = 0;
    always #5 clk = ~clk; // Periodo de 10ns

    // Procedimiento de prueba
    initial begin
        // Inicialización
        reset = 1;
        enable = 0;
        btnIzq = 0;
        btnDer = 0;
        btnEnt = 0;
        jugador = 0;
        #10;

        reset = 0;
        enable = 1;

        // Esperar unos ciclos
        #20;

        // Mover a la derecha dos veces
		  btnIzq = 1; #10; btnIzq = 0; #10;
        btnDer = 1; #10; btnDer = 0; #10;
        btnDer = 1; #10; btnDer = 0; #10;

        // Cambiar jugador a 1
        jugador = 1;

        // Presionar ENTER para colocar ficha
        btnEnt = 1; #10; btnEnt = 0; #10;

        // Cambiar jugador a 0 y colocar otra ficha
        jugador = 0;
        btnEnt = 1; #10; btnEnt = 0; #10;

        // Mover a la izquierda una vez
        btnIzq = 1; #10; btnIzq = 0; #10;

        // Presionar ENTER de nuevo
        btnEnt = 1; #10; btnEnt = 0; #10;

        // Deshabilitar módulo
        enable = 0;

        // Terminar simulación
        #50;
        $finish;
    end

endmodule
