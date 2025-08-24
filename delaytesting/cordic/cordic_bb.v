
module cordic (
	clk,
	areset,
	a,
	c,
	s);	

	input		clk;
	input		areset;
	input	[15:0]	a;
	output	[14:0]	c;
	output	[14:0]	s;
endmodule
