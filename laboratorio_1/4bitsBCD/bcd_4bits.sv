module bcd_4bits
(
	input logic [0:3] num,
	output logic [0:6] y_A, y_B
);

	logic a,b,c,d;
	
	//variables para facil manejo de las entradas
	assign a = num[0];
	assign b = num[1];
	assign c = num[2];
	assign d = num[3];
	
	assign y_A[0] = ~a&~b&~c&d|~a&b&~c&~d|a&~b&c&d|a&b&c&~d;
						
	assign y_A[1] = ~a&b&~c&d|~a&b&c&~d|a&b&c&d;
						
	assign y_A[2] = ~a&~b&c&~d|a&b&~c&~d;
						
	assign y_A[3] = ~a&~b&~c&d|~a&b&~c&~d|~a&b&c&d|a&~b&~c&d|a&~b&c&d|a&b&c&~d;
						
	assign y_A[4] = ~a&~b&~c&d|~a&~b&c&d|~a&b&~c&~d|~a&b&~c&d|~a&b&c&d|a&~b&~c&d|a&~b&c&d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y_A[5] = ~a&~b&~c&d|~a&~b&c&~d|~a&~b&c&d|~a&b&c&d|a&~b&c&d|a&b&~c&~d|a&b&~c&d;

	assign y_A[6] = ~a&~b&~c&~d|~a&~b&~c&d|~a&b&c&d|a&~b&c&~d|a&~b&c&d;
	
	assign y_B[0] = a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
	
	//Siempre encendido					
	assign y_B[1] = 0;
						
	assign y_B[2] = 0;
						
	assign y_B[3] = a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y_B[4] = a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y_B[5] = a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
	
	//Siempre apagado
	assign y_B[6] = 1;


endmodule
	