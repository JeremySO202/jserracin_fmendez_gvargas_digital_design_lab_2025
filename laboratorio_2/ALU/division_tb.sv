/**
 * Módulo: division_tb
 * Descripción: Testbench para probar el módulo `division` con un ancho de 4 bits.
 *              Incluye tres casos de prueba:
 *              1. División de 8 entre 2.
 *              2. División de 10 entre 3.
 *              3. División por cero (5 entre 0).
 */
module division_tb;

    // Señales de entrada y salida
    logic [3:0] dividendo;
    logic [3:0] divisor;
    logic [3:0] cociente;
    logic [3:0] residuo;

    // Instanciar el módulo divisor (DUT)
    division dut (
        .dividendo(dividendo),
        .divisor(divisor),
        .cociente(cociente),
        .residuo(residuo)
    );

    /**
     * Bloque initial: Ejecuta los casos de prueba.
     * Descripción:
     *   1. Asigna valores a las entradas.
     *   2. Espera un tiempo para que el módulo calcule el resultado.
     *   3. Imprime los resultados en la consola.
     */
    initial begin
        // Caso de prueba 1: 8 / 2
        dividendo = 8;
        divisor  = 2;
        #10;
        $display("Caso 1: 8 / 2");
        $display("  Cociente: %d, Resto: %d", cociente, residuo);

        // Caso de prueba 2: 10 / 3
        dividendo = 10;
        divisor  = 3;
        #10;
        $display("Caso 2: 10 / 3");
        $display("  Cociente: %d, Resto: %d", cociente, residuo);

        // Caso de prueba 3: División por cero (5 / 0)
        dividendo = 5;
        divisor  = 0;
        #10;
        $display("Caso 3: 5 / 0");
        $display("  Cociente: %d, Resto: %d", cociente, residuo);
    end

endmodule