module bcd_4bits_tb;
    logic [3:0] num;
    logic [6:0] y;

    bcd_4bits dut (
        .num(num),
        .y(y)
    );

    
    logic [6:0] expected_outputs [0:15] = '{
        7'b0000001,  // 0
        7'b1001111,  // 1
        7'b0010010,  // 2
        7'b0000110,  // 3
        7'b1001100,  // 4
        7'b0100100,  // 5
        7'b0100000,  // 6
        7'b0001111,  // 7
        7'b0000000,  // 8
        7'b0001100,  // 9
        7'b1111111,  // 10
        7'b1111111,  // 11
        7'b1111111,  // 12
        7'b1111111,  // 13
        7'b1111111,  // 14
        7'b1111111   // 15
    };

    initial begin
        

        for (int i = 0; i < 16; i++) begin
            num = i;
            #10;
				
            if (y !== expected_outputs[i]) begin
                $error("Error en num=%b: esperado %b, obtenido %b", num, expected_outputs[i], y);
            end else begin
                $display("num=%b -> y=%b ✅", num, y);
            end
        end

       
    end
endmodule
