module alu_tb;

    parameter W = 4;

    logic [W-1:0] A, B;
    logic [9:0] op;
    logic [W-1:0] op_result;
    logic N, Z, C, V;
	 logic [0:6] seg_A, seg_B;

    alu #(.W(W)) u_alu (
        .A(A),
        .B(B),
        .op(op),
        .op_result(op_result),
		  .seg_A(seg_A),
		  .seg_B(seg_B),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );

    initial begin
        // Caso de prueba 1: Suma (5 + 3)
        A = 0;
        B = 0;
        op = 4'b0000; // Suma
        #10;
        $display("Caso 1: %b + %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 2: Resta (3 - 5)
        A = 3;
        B = 5;
        op = 4'b0001; // Resta
        #10;
        $display("Caso 2: %b - %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);
		  
		  A = 5;
        B = 5;
        op = 4'b0001; // Resta
        #10;
        $display("Caso 2: %b - %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);
		  
		  A = 5;
        B = 3;
        op = 4'b0001; // Resta
        #10;
        $display("Caso 2: %b - %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 3: Multiplicación (5 * 3)
        A = 5;
        B = 4;
        op = 4'b0010; // Multiplicación
        #10;
        $display("Caso 3: %b * %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);
		  

        // Caso de prueba 4: División (10 / 2)
        A = 10;
        B = 2;
        op = 4'b0011; // División (cociente)
        #10;
        $display("Caso 4: %b / %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 5: División (10 % 2)
        A = 10;
        B = 3;
        op = 4'b0100; // División (residuo)
        #10;
        $display("Caso 5: %b %% %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 6: AND (5 & 3)
        A = 5;
        B = 3;
        op = 4'b0101; // AND
        #10;
        $display("Caso 6: %b & %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 7: OR (5 | 3)
        A = 5;
        B = 3;
        op = 4'b0110; // OR
        #10;
        $display("Caso 7: %b | %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 8: XOR (5 ^ 3)
        A = 5;
        B = 3;
        op = 4'b0111; // XOR
        #10;
        $display("Caso 8: %b ^ %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 9: Shift Left (5 << 1)
        A = 5;
        B = 1;
        op = 4'b1000; // Shift Left
        #10;
        $display("Caso 9: %b << %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);

        // Caso de prueba 10: Shift Right (5 >> 1)
        A = 5;
        B = 1;
        op = 4'b1001; // Shift Right
        #10;
        $display("Caso 10: %b >> %b", A, B);
        $display("  Resultado: %b, N: %b, Z: %b, C: %b, V: %b", op_result, N, Z, C, V);
    end

endmodule