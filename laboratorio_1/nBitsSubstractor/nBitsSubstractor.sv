module nBitsSubstractor #(
    parameter int n = 2
)(
    input logic [n-1:0] a, b,
    output logic [n-1:0] s,
    output logic cout
);

	logic [n-1:0] b_inv;
	logic [n:0] carry;
	
	assign b_inv = ~b;
	assign carry[0] = 1;
	
	genvar i;
	generate
        for (i = 0; i < n; i++) begin : adder_loop
            fullAdder adder (
                .a(a[i]),
                .b(b_inv[i]),
                .cin(carry[i]), 
                .cout(carry[i+1]), 
                .s(s[i])
            );
        end
    endgenerate
	
	assign cout = carry[n];

	

endmodule