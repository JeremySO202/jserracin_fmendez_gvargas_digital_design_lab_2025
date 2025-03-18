module alu #(
	parameter int W=4
)(

		input logic [W-1:0] A, B,
		
		//operation(identificador que hay que aumentar por la cantidad de cosillas que queramos implementar)
		input logic [9:0] op,
		
		output logic [W-1:0] op_result,
		
		//lo pongo como un bus por mientras pero se puede tratar como cada una señal por aparte
		output logic [3:0] flags
  
);
	
	//variables para la suma
	logic [W-1:0] sum_y;
	logic sum_cout;

	sum_N #(.m(W)) sumN (
		.a(A),
		.b(B),
		.y(sum_y),
		.cout(sum_cout)
	);
	
	//variables para la suma
	logic [W-1:0] subs_y;
	logic subs_cout;
	
	nBitsSubstractor #(.n(W)) subs (
		.a(A),
		.b(B),
		.s(subs_y),
		.cout(subs_cout)
	);
	

always_comb begin

	flags = 4'b0000;

	case(op)
	//pongo la asignación del flag ahí solo pq es la suma, si lo pongo afuera se asigna siempre pero no sé como se use sin la suma
		4'b0000: begin
		op_result = sum_y;
		flags[0] = sum_cout;
		end
		4'b0001: op_result = subs_y; // agregarle las flags a la resta
		4'b0010: op_result = A * B;
		4'b0011: op_result = A / B;
		4'b0100: op_result = A % B;
		4'b0101: op_result = A & B;
		4'b0110: op_result = A | B;
		4'b0111: op_result = A ^ B;
		4'b1000: op_result = A << 1;
		4'b1001: op_result = A >> 1;
		default: op_result = 0;
		endcase
	end
		
endmodule
