module verificarJugador(
    input logic clk, reset, enable,
    input logic btnIzq, btnDer, btnEnt, 
    input logic jugador, 
    input logic finPartida, 
    output logic [6:0] posicion, 
    output logic [5:0][6:0] tablero,
    output logic [5:0][6:0] fichas, 
    output logic FT 
);

    reg [6:0] posicionReg; 
    reg [5:0][6:0] tableroReg; 
    reg [5:0][6:0] fichasReg; 

    assign posicion = posicionReg;
    assign tablero = tableroReg;
    assign fichas = fichasReg;

    
    always @(negedge clk or posedge reset) begin
        if (reset) begin
          
            posicionReg <= 7'b1000000;
            tableroReg <= '{default: 0};
            fichasReg <= '{default: 0};
            FT <= 0;
        end else begin
            if (finPartida) begin
                posicionReg <= 7'b0001000;
            end
            if (enable) begin
                if (btnIzq) begin
                    // para moverse a la izquierda
                    if (posicionReg[6]) begin
                        posicionReg <= 7'b0000001; //limite
                    end else begin
                        posicionReg <= posicionReg << 1;
                    end
                end else if (btnDer) begin
                    // ahora a la derecha
                    if (posicionReg[0]) begin
                        posicionReg <= 7'b1000000; // limite
                    end else begin
                        posicionReg <= posicionReg >> 1;
                    end
                end else if (btnEnt) begin
                    // se coloca la ficha
                    for (int j = 0; j < 7; j++) begin
                        if (posicionReg[j]) begin
                            for (int i = 0; i < 6; i++) begin
                                if (tableroReg[i][j] == 0) begin
                                    tableroReg[i][j] <= 1; //se actualiza
                                    fichasReg[i][j] <= jugador; // las ficjas tambien
                                    FT <= 1; //se devuelve que el turno terminó
                                    break;
                                end
                            end
                        end
                    end
                end 
            end else begin
                FT <= 0;
            end
        end
    end

endmodule

