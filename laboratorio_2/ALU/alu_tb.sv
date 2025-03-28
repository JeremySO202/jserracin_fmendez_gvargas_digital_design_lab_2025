module alu_tb;

    parameter W = 4;

    logic [W-1:0] A, B;
    logic [3:0] op;
    logic [W-1:0] op_result;
    logic N, Z, C, V;

    alu #(.W(W)) u_alu (
        .A(A),
        .B(B),
        .op(op),
        .op_result(op_result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );

    initial begin
        $display("Inicio de la prueba de la ALU");
        
        // Suma
        A = 4'b0101; B = 4'b0011; op = 4'b0000; #10;
        if (op_result !== 4'b1000) $error("Error en suma: %b + %b = %b, esperado: 1000", A, B, op_result);
        else $display("Correcto: %b + %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        A = 4'b1111; B = 4'b0001; op = 4'b0000; #10;
        if (op_result !== 4'b0000) $error("Error en suma: %b + %b = %b, esperado: 0000", A, B, op_result);
        else $display("Correcto: %b + %b = %b", A, B, op_result);
		  
		  if (Z !== 1) $error("Error en zero, esperada 1");
		  else $display("Z = %b",Z);
        if (C !== 1) $error("Error en carry, esperada 1");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // Resta
        A = 4'b0011; B = 4'b0101; op = 4'b0001; #10;
        if (op_result !== 4'b1110) $error("Error en resta: %b - %b = %b, esperado: 1110", A, B, op_result);
        else $display("Correcto: %b - %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 1) $error("Error en neg_flag, esperada 1");
		  else $display("N = %b",N);
        
        A = 4'b0101; B = 4'b0101; op = 4'b0001; #10;
        if (op_result !== 4'b0000) $error("Error en resta: %b - %b = %b, esperado: 0000", A, B, op_result);
        else $display("Correcto: %b - %b = %b", A, B, op_result);
		  
		  if (Z !== 1) $error("Error en zero, esperada 1");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // Multiplicación
        A = 4'b0011; B = 4'b0010; op = 4'b0010; #10;
        if (op_result !== 4'b0110) $error("Error en multiplicación: %b * %b = %b, esperado: 0110", A, B, op_result);
        else $display("Correcto: %b * %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        A = 4'b1000; B = 4'b0010; op = 4'b0010; #10;
        if (op_result !== 4'b0000) $error("Error en multiplicación: %b * %b = %b, esperado: 1000", A, B, op_result);
        else $display("Correcto: %b * %b = %b", A, B, op_result);
		  
		  if (Z !== 1) $error("Error en zero, esperada 1");
		  else $display("Z = %b",Z);
        if (C !== 1) $error("Error en carry, esperada 1");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // División cociente
        A = 4'b1000; B = 4'b0010; op = 4'b0011; #10;
        if (op_result !== 4'b0100) $error("Error en división: %b / %b = %b, esperado: 0100", A, B, op_result);
        else $display("Correcto: %b / %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
        A = 4'b1010; B = 4'b0010; op = 4'b0011; #10;
        if (op_result !== 4'b0101) $error("Error en división: %b / %b = %b, esperado: 0100", A, B, op_result);
        else $display("Correcto: %b / %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // División residuo
        A = 4'b1010; B = 4'b0011; op = 4'b0100; #10;
        if (op_result !== 4'b0001) $error("Error en división: %b %% %b = %b, esperado: 0001", A, B, op_result);
        else $display("Correcto: %b %% %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b1010; B = 4'b0010; op = 4'b0100; #10;
        if (op_result !== 4'b0000) $error("Error en división: %b %% %b = %b, esperado: 0001", A, B, op_result);
        else $display("Correcto: %b %% %b = %b", A, B, op_result);
		  
		  if (Z !== 1) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // AND
        A = 4'b0101; B = 4'b0011; op = 4'b0101; #10;
        if (op_result !== 4'b0001) $error("Error en AND: %b & %b = %b, esperado: 0001", A, B, op_result);
        else $display("Correcto: %b & %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b0111; B = 4'b0011; op = 4'b0101; #10;
        if (op_result !== 4'b0011) $error("Error en AND: %b & %b = %b, esperado: 0001", A, B, op_result);
        else $display("Correcto: %b & %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // OR
        A = 4'b0101; B = 4'b0011; op = 4'b0110; #10;
        if (op_result !== 4'b0111) $error("Error en OR: %b | %b = %b, esperado: 0111", A, B, op_result);
        else $display("Correcto: %b | %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b0101; B = 4'b1001; op = 4'b0110; #10;
        if (op_result !== 4'b1101) $error("Error en OR: %b | %b = %b, esperado: 0111", A, B, op_result);
        else $display("Correcto: %b | %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // XOR
        A = 4'b0101; B = 4'b0011; op = 4'b0111; #10;
        if (op_result !== 4'b0110) $error("Error en XOR: %b ^ %b = %b, esperado: 0110", A, B, op_result);
        else $display("Correcto: %b ^ %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b1001; B = 4'b0011; op = 4'b0111; #10;
        if (op_result !== 4'b1010) $error("Error en XOR: %b ^ %b = %b, esperado: 0110", A, B, op_result);
        else $display("Correcto: %b ^ %b = %b", A, B, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // Desplazamiento izquierda
        A = 4'b0001; op = 4'b1000; #10;
        if (op_result !== 4'b0010) $error("Error en shift left: %b << 1 = %b, esperado: 0010", A, op_result);
        else $display("Correcto: %b << 1 = %b", A, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b0010; op = 4'b1000; #10;
        if (op_result !== 4'b0100) $error("Error en shift left: %b << 1 = %b, esperado: 0010", A, op_result);
        else $display("Correcto: %b << 1 = %b", A, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        // Desplazamiento derecha
        A = 4'b1000; op = 4'b1001; #10;
        if (op_result !== 4'b0100) $error("Error en shift right: %b >> 1 = %b, esperado: 0100", A, op_result);
        else $display("Correcto: %b >> 1 = %b", A, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
		  
		  A = 4'b0100; op = 4'b1001; #10;
        if (op_result !== 4'b0010) $error("Error en shift right: %b >> 1 = %b, esperado: 0100", A, op_result);
        else $display("Correcto: %b >> 1 = %b", A, op_result);
		  
		  if (Z !== 0) $error("Error en zero, esperada 0");
		  else $display("Z = %b",Z);
        if (C !== 0) $error("Error en carry, esperada 0");
		  else $display("C = %b",C);
        if (V !== 0) $error("Error en overflow, esperada 0");
		  else $display("V = %b",V);
        if (N !== 0) $error("Error en neg_flag, esperada 0");
		  else $display("N = %b",N);
        
        $display("Fin de la prueba de la ALU");
    end
endmodule
