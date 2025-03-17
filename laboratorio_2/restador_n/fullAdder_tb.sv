module fullAdder_tb;

    // Señales de prueba
    logic a, b, cin;
    logic cout, s;

    // Instancia del módulo bajo prueba (UUT - Unit Under Test)
    fullAdder adder (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .cout(cout), 
        .s(s)
    );

    initial begin
        // Mostrar encabezado
        $display("Time | a | b | cin | cout | s");
        $display("-----------------------------");

        // Prueba todas las combinaciones posibles (0 a 7)
        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i; // Asigna valores de prueba
            #10; // Espera 10 ns
            $display("%4t | %b | %b |  %b  | %b |  %b", $time, a, b, cin, cout, s);
        end
    end

endmodule
