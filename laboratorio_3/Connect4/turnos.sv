module turnos(
    input logic clk, reset, enable,
    input logic btnIzq, btnDer, btnEnt,
    output logic pressIzq, pressDer, pressEnt,
    output logic jugada
);

    
    logic btnIzq_prev, btnDer_prev, btnEnt_prev;

    logic btnIzq_posedge, btnDer_posedge, btnEnt_posedge;

    
    logic regIzq, regDer, regEnt, regJugada;

    // Detectar flancos positivos
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            btnIzq_prev <= 0;
            btnDer_prev <= 0;
            btnEnt_prev <= 0;
        end else begin
			if (enable) begin
				btnIzq_prev <= btnIzq;
				btnDer_prev <= btnDer;
				btnEnt_prev <= btnEnt;
			end
        end
    end



    assign btnIzq_posedge = btnIzq && !btnIzq_prev;
    assign btnDer_posedge = btnDer && !btnDer_prev;
    assign btnEnt_posedge = btnEnt && !btnEnt_prev;

	assign pressIzq = regIzq;
	assign pressDer = regDer;
	assign pressEnt = regEnt;

    // Lógica principal
    always_ff @(negedge clk or posedge reset) begin
        if (reset) begin
            jugada <= 0;
            regIzq <= 0;
            regDer <= 0;
            regEnt <= 0;
        end else begin
            if (enable) begin
                // Detectar flancos positivos y activar las señales correspondientes
                if (btnIzq_posedge) begin
                    regIzq <= 1;
                    regDer <= 0;
                    regEnt <= 0;
                    jugada <= 1;
                end else if (btnDer_posedge) begin
                    regIzq <= 0;
                    regDer <= 1;
                    regEnt <= 0;
                    jugada <= 1;
                end else if (btnEnt_posedge) begin
                    regIzq <= 0;
                    regDer <= 0;
                    regEnt <= 1;
                    jugada <= 1;
                end else if (jugada) begin
                	jugada <= 0;
					regIzq <= 0;
					regDer <= 0;
					regEnt <= 0;
				end
            end
        end
    end

endmodule