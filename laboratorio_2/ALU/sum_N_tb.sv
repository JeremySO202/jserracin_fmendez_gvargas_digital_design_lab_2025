`timescale 1ns/1ps

module sum_N_tb;

    // Parámetro para definir el tamaño del sumador
    parameter int m = 4;

    // Señales de prueba
    logic [m-1:0] a, b;
    logic cout;
    logic [m-1:0] y;

    // Instancia del módulo sumador
    sum_N #(.m(m)) uut (
        .a(a),
        .b(b),
        .cout(cout),
        .y(y)
    );

    // Proceso de prueba
    initial begin
        $display("Tiempo | a    | b    | y    | cout ");
        $display("-------|------|------|------|-----");
        
        // Probar todas las combinaciones de entrada posibles
        for (int i = 0; i < (1 << m); i++) begin
            for (int j = 0; j < (1 << m); j++) begin
                a = i;
                b = j;
                #1; // Espera 1ns para estabilizar
                
                // Mostrar resultados
                $display("%5t | %b | %b | %b | %b", $time, a, b, y, cout);
            end
        end

        // Finaliza la simulación
        $finish;
    end

endmodule

