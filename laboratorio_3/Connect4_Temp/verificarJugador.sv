module verificarJugador(
    input logic clk, reset, enable,
    input logic btnIzq_raw, btnDer_raw, btnEnt_raw, // Entradas crudas de los botones (ya con debounce)
    input logic jugador, // Jugador actual
    output logic FT,
    output logic [6:0] posicion, // Posición del jugador
    output logic [5:0][6:0] tablero, // Matriz de 6x7 para el tablero
    output logic [5:0][6:0] fichas   // Matriz de 6x7 para las fichas
);

    // Señales para almacenar el estado anterior de los botones
    logic btnIzq_prev, btnDer_prev, btnEnt_prev;

    // Señales para detectar el flanco positivo
    logic btnIzq_posedge, btnDer_posedge, btnEnt_posedge;

    // Registros para las salidas
    reg [6:0] posicionReg; // Posición del jugador
    reg [5:0][6:0] tableroReg; // Matriz de 6x7 para el tablero
    reg [5:0][6:0] fichasReg; // Matriz de 6x7 para las fichas

    // Sincronización de salidas
    assign posicion = posicionReg;
    assign tablero = tableroReg;
    assign fichas = fichasReg;

    // Detectar flancos positivos
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            btnIzq_prev <= 0;
            btnDer_prev <= 0;
            btnEnt_prev <= 0;
        end else begin
            btnIzq_prev <= btnIzq_raw;
            btnDer_prev <= btnDer_raw;
            btnEnt_prev <= btnEnt_raw;
        end
    end

    assign btnIzq_posedge = btnIzq_raw && !btnIzq_prev;
    assign btnDer_posedge = btnDer_raw && !btnDer_prev;
    assign btnEnt_posedge = btnEnt_raw && !btnEnt_prev;

    // Lógica principal
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Inicialización de registros
            posicionReg <= 7'b1000000;
            tableroReg <= '{default: 0};
            fichasReg <= '{default: 0};
            FT <= 0;
        end else begin
            if (enable) begin
                if (btnIzq_posedge) begin
                    if (posicionReg[6]) begin
                        posicionReg <= 7'b0000001;
                    end else begin
                        posicionReg <= posicionReg << 1; // Mueve a la izquierda
                    end
                end else if (btnDer_posedge) begin
                    if (posicionReg[0]) begin
                        posicionReg <= 7'b1000000; // Mueve a la derecha
                    end else begin
                        posicionReg <= posicionReg >> 1;
                    end
                end else if (btnEnt_posedge) begin
                    for (int j = 0; j < 7; j++) begin
                        if (posicionReg[j]) begin
                            for (int i = 0; i < 6; i++) begin
                                if (tableroReg[i][j] == 0) begin
                                    tableroReg[i][j] <= 1; // Coloca la ficha
                                    fichasReg[i][j] <= jugador; // Actualiza la matriz de fichas
                                    FT <= 1;
                                    break;
                                end
                            end
                        end
                    end
                end else begin
                    FT <= 0; // Ningún botón presionado
                end
            end
        end
    end

endmodule

