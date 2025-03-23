module nBitsSubstractor_tb;

    parameter int n = 4;

    logic [n-1:0] a, b;
    logic [n-1:0] s;
    logic cout;

    // Instanciar el módulo bajo prueba (DUT)
    nBitsSubstractor #(.n(n)) dut (
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );

    initial begin
        $display("Tiempo |   A   |   B   |   S   | C_out");
        $monitor("%5t  | %b | %b | %b |  %b", $time, a, b, s, cout);
        
        // Prueba 1: 5 - 3
        a = 4'b0101; // 5
        b = 4'b0011; // 3
        #10;

        // Prueba 2: 7 - 2
        a = 4'b0111; // 7
        b = 4'b0010; // 2
        #10;

        // Prueba 3: 10 - 5
        a = 4'b1010; // 10
        b = 4'b0101; // 5
        #10;

        $finish;
    end

endmodule