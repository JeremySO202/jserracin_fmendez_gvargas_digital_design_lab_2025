/**
 * Módulo: multiplicacion_tb
 * Descripción: Testbench para probar el módulo `multiplicacion`.
 *              Incluye tres casos de prueba:
 *              1. Multiplicación de 3 por 4.
 *              2. Multiplicación de 5 por 2.
 *              3. Multiplicación de 15 por 15 (caso máximo para 4 bits).
 */
module multiplicacion_tb;

    // Señales de entrada y salida
    logic [3:0] a;
    logic [3:0] b;
    logic [7:0] result;

    // Instanciar el módulo multiplicacion
    multiplicacion dut (
        .a(a),
        .b(b),
        .result(result)
    );

    /**
     * Bloque initial: Ejecuta los casos de prueba.
     * Descripción:
     *   1. Asigna valores a las entradas.
     *   2. Espera un tiempo para que el módulo calcule el resultado.
     *   3. Imprime los resultados en la consola.
     */
    initial begin
        // Caso de prueba 1: 3 * 4
        a = 3;
        b = 4;
        #10;
        $display("Caso 1: 3 * 4");
        $display("  Resultado: %d", result);

        // Caso de prueba 2: 5 * 2
        a = 5;
        b = 2;
        #10;
        $display("Caso 2: 5 * 2");
        $display("  Resultado: %d", result);

        // Caso de prueba 3: 15 * 15 (caso máximo para 4 bits)
        a = 15;
        b = 15;
        #10;
        $display("Caso 3: 15 * 15");
        $display("  Resultado: %d", result);
    end

endmodule