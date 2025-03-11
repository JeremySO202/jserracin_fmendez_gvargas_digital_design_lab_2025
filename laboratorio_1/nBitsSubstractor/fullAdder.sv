module fullAdder (
    input logic a, b, cin, 
    output logic cout, s
);
	
	assign s = a ^ b ^ cin;
	assign cout = (a & b) + (a & cin) + (b & cin);

endmodule