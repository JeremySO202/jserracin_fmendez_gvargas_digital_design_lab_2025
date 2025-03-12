`timescale 1ns/1ps

module bcd_4bits_tb;
    logic [3:0] num;
    logic [6:0] y_A, y_B;  // Salidas del DUT

    // Instancia del módulo bajo prueba (DUT)
    bcd_4bits dut (
        .num(num),
        .y_A(y_A),
        .y_B(y_B)
    );

    logic [6:0] expected_y_A [0:15];  
    logic [6:0] expected_y_B [0:15];  

    initial begin
        expected_y_A = '{
            7'b0000001, 7'b1001111, 7'b0010010, 7'b0000110, 
            7'b1001100, 7'b0100100, 7'b0100000, 7'b0001111, 
            7'b0000000, 7'b0001100, 7'b0000001, 7'b1001111, 
				7'b0010010, 7'b0000110, 7'b1001100, 7'b0100100
        };
        
        expected_y_B = '{
            7'b0000001, 7'b0000001, 7'b0000001, 7'b0000001, 
            7'b0000001, 7'b0000001, 7'b0000001, 7'b0000001, 
            7'b0000001, 7'b0000001, 7'b1001111, 7'b1001111, 
            7'b1001111, 7'b1001111, 7'b1001111, 7'b1001111
        };

        $display("Iniciando pruebas...");

        for (int i = 0; i < 16; i++) begin
            num = i; // Asignar entrada
            #10; // Esperar estabilización

            // Verificar y_A
            if (y_A !== expected_y_A[i]) begin
                $error("Error en num=%b: y_A esperado %b, obtenido %b", num, expected_y_A[i], y_A);
            end else begin
                $display("num=%b -> y_A=%b ✅", num, y_A);
            end

            // Verificar y_B
            if (y_B !== expected_y_B[i]) begin
                $error("Error en num=%b: y_B esperado %b, obtenido %b", num, expected_y_B[i], y_B);
            end else begin
                $display("num=%b -> y_B=%b ✅", num, y_B);
            end
        end
		  
        $finish;
    end
endmodule
