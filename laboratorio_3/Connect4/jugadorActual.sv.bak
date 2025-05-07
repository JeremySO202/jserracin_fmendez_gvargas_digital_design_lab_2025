module jugadorActual(
    input logic clk, reset, enable,
    output logic jugador
);

    // Registros para las salidas
    reg jugadorReg; // Jugador actual

    // Sincronización de salidas
    assign jugador = jugadorReg;

    // Lógica principal
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Inicialización de registros
            jugadorReg <= 1'b0; // Jugador 1 inicia el juego
        end else if (enable) begin
            // Alternar entre jugadores
            jugadorReg <= ~jugadorReg;
        end
    end



endmodule