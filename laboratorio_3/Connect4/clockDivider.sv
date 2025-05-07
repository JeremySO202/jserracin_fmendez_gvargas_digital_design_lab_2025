module clockDivider(
	input logic in_clock,
	output logic out_clock
);

	logic pos_edge;
	
	initial begin
		pos_edge = 0;
	end
	
	always @(posedge in_clock) begin
		pos_edge <= ~pos_edge;
	end
	
	assign out_clock = pos_edge;
	

endmodule