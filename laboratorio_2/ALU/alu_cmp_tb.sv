module alu_cmp_tb #(
    parameter int W = 4  
)(
    input  logic clk, reset, 
    input  logic [W-1:0] A_in, B_in,
    input  logic [3:0] op,
    output logic [W-1:0] result_out,
    output logic N_out, Z_out, C_out, V_out
);

    // Registros para operandos
    logic [W-1:0] Reg_A, Reg_B;
    // Registro para el resultado
    logic [W-1:0] Reg_out;

    // Variables para capturar la salida de la ALU
    logic [W-1:0] alu_result;
    logic N, Z, C, V;

    // Registros para almacenar las flags
    logic N_reg, Z_reg, C_reg, V_reg;

    // Instancia de la ALU
    alu #(.W(W)) my_alu (
        .A(Reg_A),
        .B(Reg_B),
        .op(op),
        .op_result(alu_result),
        .seg_A(), .seg_B(),
        .N(N), .Z(Z), .C(C), .V(V) // Flags
    );

    // Registro de entrada: Captura operandos en flanco positivo de reloj
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Reg_A <= 0;
            Reg_B <= 0;
        end else begin
            Reg_A <= A_in;
            Reg_B <= B_in;
        end
    end

    // Registro de salida: Captura el resultado de la ALU y las flags
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Reg_out <= 0;
            N_reg <= 0;
            Z_reg <= 0;
            C_reg <= 0;
            V_reg <= 0;
        end else begin
            Reg_out <= alu_result;
            N_reg <= N;
            Z_reg <= Z;
            C_reg <= C;
            V_reg <= V;
        end
    end

    // Salidas finales del circuito
    assign result_out = Reg_out;
    assign N_out = N_reg;
    assign Z_out = Z_reg;
    assign C_out = C_reg;
    assign V_out = V_reg;

endmodule

