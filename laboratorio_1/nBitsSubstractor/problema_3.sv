module problema_3#(
    parameter int n = 6
)

(
	input logic reset, dec, num1, num2, num3,
	output logic [n - 1:0] count = 0,  
	output logic [6:0] segA, segB
);

	
	logic [n - 1:0] a,b,s;
	logic rgr;
	
	assign a = count;
	assign b = 1;
	
	nBitsSubstractor #(.n(n)) subs(
		.a(a),
		.b(b),
		.s(s),
		.cout(rgr)
	);
	
	bcd_6bits bcd(
		.bits(count),
		.segA(segA), 
		.segB(segB)
	);

	always_ff @(posedge reset or posedge dec or posedge num1 or posedge num2 or posedge num3) begin
		if (reset)
        count <= 0;
    else if (num1)
        count <= 1;
    else if (num2)
        count <= 2**(n-1);  
    else if (num3)
        count <= 2**n - 1;
    else if (dec) begin
        if (!rgr)
            count <= '1;
        else
            count <= s;
    end
	end


endmodule