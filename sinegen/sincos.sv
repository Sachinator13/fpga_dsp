module sincos (
	input clk,
	input [15:0] phase,
	output [14:0] cos,
	output [14:0] sin
);


cordic cordic_inst(
	.clk(clk),
	.areset(1'b0),
	.a(phase),
	.c(cos),
	.s(sin)
);

endmodule