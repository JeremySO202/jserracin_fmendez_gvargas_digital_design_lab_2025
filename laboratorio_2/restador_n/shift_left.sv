module shift_left #(
    parameter int n = 2
)
(
    input logic [n - 1:0] a,
    output logic [n - 1:0] s
);

    /* Desplazador a la izquierda.

    Entradas:
    - a: n bits de entrada.

    Salidas:
    - s: n bits de salida.
    
    */

    assign s = a << 1;

endmodule