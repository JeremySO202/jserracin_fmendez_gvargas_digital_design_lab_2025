module laboratorio_2 #(
	parameter int W=4
)(

		input logic [W-1:0] A, B,
		
		//operation(identificador que hay que aumentar por la cantidad de cosillas que queramos implementar)
		input logic [3:0] op,
		
		output logic [W-1:0] op_result,
		output logic [0:6] seg_A, seg_B,
		//lo pongo como un bus por mientras pero se puede tratar como cada una señal por aparte
		output logic N, Z, C, V
  
);

	alu #(.W(W)) u_alu (
        .A(A),
        .B(~B),
        .op(op),
        .op_result(op_result),
        .N(N),
        .Z(Z),
        .C(C),
        .V(V)
    );

	bcd_4bits bcd(
		.num(op_result),
		.y_A(seg_A),
		.y_B(seg_B)
	);

endmodule