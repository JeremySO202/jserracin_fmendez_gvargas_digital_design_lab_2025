module fullAdder_tb;

    // Señales de prueba
    wire a, b, cin;
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
        $display("Time | a | b | cin | s | cout");
        $display("-----------------------------");

        // Prueba todas las combinaciones posibles (0 a 7)
        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i; // Asigna valores de prueba
            #10; // Espera 10 ns
            $display("%4t | %b | %b |  %b  | %b |  %b", $time, a, b, cin, s, cout);
        end
    end

endmodule
