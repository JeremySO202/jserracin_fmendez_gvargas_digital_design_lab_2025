module lfsr_3bit (
    input logic clk,
    input logic rst,
    input logic en,
    output logic [2:0] rnd
);

    logic [2:0] lfsr;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            lfsr <= 3'b001;  // Semilla no nula
        else if (en) begin
            lfsr[0] <= lfsr[2];
            lfsr[1] <= lfsr[0];
            lfsr[2] <= lfsr[1] ^ lfsr[2];  // Tap feedback
        end
    end

    assign rnd = lfsr;

endmodule
