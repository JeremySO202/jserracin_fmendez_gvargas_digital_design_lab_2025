module shift_right_tb;

    // Señales de prueba
    logic [3:0] data_in;
    logic [3:0] data_out;

    // Instancia del módulo bajo prueba
    shift_right #(.n(4)) dut (
        .a(data_in),
        .s(data_out)
    );

    initial begin
        // Mostrar encabezado
        $display("Time | data_in | data_out");
        $display("-------------------------");

        data_in = 4'b0001; #10;
        $display("%4t | %b | %b", $time, data_in, data_out);

        data_in = 4'b0010; #10;
        $display("%4t | %b | %b", $time, data_in, data_out);

        data_in = 4'b0100; #10;
        $display("%4t | %b | %b", $time, data_in, data_out);

        data_in = 4'b1000; #10;
        $display("%4t | %b | %b", $time, data_in, data_out);

        data_in = 4'b1111; #10;
        $display("%4t | %b | %b", $time, data_in, data_out);

        // Finalizar simulación
        $finish;
    end

endmodule