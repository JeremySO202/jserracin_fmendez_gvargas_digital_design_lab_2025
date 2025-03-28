`timescale 1ns / 1ps

module alu_cmp_tb_test;

    // Parámetro de ancho de datos
    parameter int W = 4;

    // Señales del banco de pruebas
    logic clk, reset;
    logic [W-1:0] A_in, B_in;
    logic [3:0] op;
    logic [W-1:0] result_out;
    logic N_out, Z_out, C_out, V_out;

    // Instancia del módulo de prueba
    alu_cmp_tb #(.W(W)) dut (
        .clk(clk),
        .reset(reset),
        .A_in(A_in),
        .B_in(B_in),
        .op(op),
        .result_out(result_out),
        .N_out(N_out),
        .Z_out(Z_out),
        .C_out(C_out),
        .V_out(V_out)
    );

    // Generación de reloj
    always #5 clk = ~clk;

    // Proceso de prueba
    initial begin
        // Inicialización
        clk = 0;
        reset = 1;
        A_in = 0;
        B_in = 0;
        op = 4'b0000;
        #10;

        // Liberar reset
        reset = 0;
        #10;

        // Prueba: A = 3, B = 2, operación ADD (0001)
        A_in = 4'b0011; // 3 en binario
        B_in = 4'b0010; // 2 en binario
        op = 4'b0000;   // Código de operación para ADD
        #10;

        // Fin de la simulación
        $finish;
    end

endmodule
