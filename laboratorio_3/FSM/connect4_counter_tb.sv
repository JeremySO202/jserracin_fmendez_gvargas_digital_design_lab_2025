`timescale 1ns/1ps

module connect4_counter_tb;

    logic clk, rst;
    logic done;

    // Instancia del DUT
    connect4_counter dut (
        .clk(clk),
        .rst(rst),
        .done(done)
    );

    // Generador de reloj: 50 MHz (periodo = 20 ns)
    always #10 clk = ~clk;

    initial begin
        $display("Inicio del test");
        clk = 0;
        rst = 1;
        #40;
        rst = 0;

        #20000

        $stop;
    end

endmodule
