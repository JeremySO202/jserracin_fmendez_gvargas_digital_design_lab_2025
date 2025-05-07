`timescale 1ns / 1ps

//este test bench verifica jugador, simula el worflow del mismo
module tb_verificarJugador;

    logic clk, reset, enable;
    logic btnIzq, btnDer, btnEnt;
    logic jugador;
    logic FT;
    logic [6:0] posicion;
    logic [5:0][6:0] tablero;
    logic [5:0][6:0] fichas;

  
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

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Iniciando testbench...");

        reset = 1;
        enable = 0;
        btnIzq = 0;
        btnDer = 0;
        btnEnt = 0;
        jugador = 0;
        #10;
        $display("Paso 1: Reset activado");

        reset = 0;
        enable = 1;
        $display("Paso 2: Habilitado y reset desactivado");

        #20;

        btnIzq = 1; #10; btnIzq = 0; #10;
        $display("Paso 3: Botón Izquierda presionado y liberado");

        btnDer = 1; #10; btnDer = 0; #10;
        $display("Paso 4: Botón Derecha presionado y liberado");

        btnDer = 1; #10; btnDer = 0; #10;
        $display("Paso 5: Botón Derecha presionado y liberado nuevamente");

        jugador = 1;
        $display("Paso 6: Jugador activado");

        btnEnt = 1; #10; btnEnt = 0; #10;
        $display("Paso 7: Botón Enter presionado y liberado");

        jugador = 0;
        btnEnt = 1; #10; btnEnt = 0; #10;
        $display("Paso 8: Jugador desactivado y botón Enter presionado y liberado");

        btnIzq = 1; #10; btnIzq = 0; #10;
        $display("Paso 9: Botón Izquierda presionado y liberado");

        btnEnt = 1; #10; btnEnt = 0; #10;
        $display("Paso 10: Botón Enter presionado y liberado");

        enable = 0;
        $display("Paso 11: Deshabilitado");

        #50;
        $finish;
    end

endmodule