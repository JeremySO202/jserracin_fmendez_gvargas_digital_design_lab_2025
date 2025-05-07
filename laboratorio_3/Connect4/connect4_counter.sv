module connect4_counter (
    input logic clk,
    input logic rst,
    output logic done
);

    // 29 bits son suficientes para contar hasta 500 millones (2^29 ≈ 536 millones)
    logic [28:0] counter;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            done <= 0;
        end else begin
            if (!done) begin
                if (counter < 29'd500_000_000 - 1) begin
                    counter <= counter + 1;
                    done <= 0;
                end else begin
                    done <= 1;  // Señal que indica que pasaron 10 segundos
                end
            end
            
        end
    end

endmodule

