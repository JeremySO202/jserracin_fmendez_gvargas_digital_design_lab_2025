/**
 * Módulo: multiplicador
 * Descripción: Implementa un multiplicador combinacional para dos números de 4 bits.
 * Parámetros:
 *   - m: Ancho de los operandos (por defecto 4 bits).
 * Entradas:
 *   - a: Primer operando.
 *   - b: Segundo operando.
 * Salidas:
 *   - result: Resultado de la multiplicación (a * b).
 */
module multiplicacion #(parameter m = 4) (
    input  logic [m-1:0] a,      // Primer operando (multiplicando)
    input  logic [m-1:0] b,      // Segundo operando (multiplicador)
    output logic [m-1:0] result // Resultado de la multiplicación
);

    /**
     * Bloque always_comb: Calcula el resultado de la multiplicación.
     * Descripción:
     *   - Multiplica los dos operandos y asigna el resultado a la salida.
     */
    always_comb begin
        result = a * b; // Multiplicación directa
    end

endmodule