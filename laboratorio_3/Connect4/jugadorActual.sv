module jugadorActual(
    input logic clk, reset, enable,
    output logic jugador
);

    reg jugadorReg; 

   
    assign jugador = jugadorReg;


    always @(posedge clk or posedge reset) begin
        if (reset) begin
         
            jugadorReg <= 1'b0; 
        end else if (enable) begin
           
            jugadorReg <= ~jugadorReg;
        end
    end



endmodule