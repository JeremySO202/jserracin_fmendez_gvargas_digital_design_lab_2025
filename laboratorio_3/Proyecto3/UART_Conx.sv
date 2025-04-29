module UART_Conx (
    input  logic        clk,rst,rx,             
    input  logic [2:0]  recep,     
    input  logic [15:0] BaudRate,  
    output logic        rxReady, 
    output logic [7:0]  rxOut      
);


logic Tick;

BaudRate baud_gen(
	.clk(clk),
	.rst_n(rst),
	.tick(Tick),
	.baudRate(BaudRate)
);
 
Sec_conx uart_rx(
	.clk(clk),
	.rst(rst),
	.rx(rx),
	.rx_e(1'b1),   
	.tick(Tick),    
	.recep(recep),
	.rxReady(rxReady),
	.rxOut(rxOut)
);

endmodule
