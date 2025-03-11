module bcd_4bits
(
	input logic [0:3] num,
	output logic [0:6] y
);

	logic a,b,c,d;
	
	assign a = num[0];
	assign b = num[1];
	assign c = num[2];
	assign d = num[3];
	
	assign y[0] = ~a&~b&~c&d|~a&b&~c&~d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y[1] = ~a&b&~c&d|~a&b&c&~d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y[2] = ~a&~b&c&~d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y[3] = ~a&~b&~c&d|~a&b&~c&~d|~a&b&c&d|a&~b&~c&d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y[4] = ~a&~b&~c&d|~a&~b&c&d|~a&b&~c&~d|~a&b&~c&d|~a&b&c&d|a&~b&~c&d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;
						
	assign y[5] = ~a&~b&~c&d|~a&~b&c&~d|~a&~b&c&d|~a&b&c&d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;

	assign y[6] = ~a&~b&~c&~d|~a&~b&~c&d|~a&b&c&d|a&~b&c&~d|a&~b&c&d|a&b&~c&~d|a&b&~c&d|a&b&c&~d|a&b&c&d;


endmodule
	