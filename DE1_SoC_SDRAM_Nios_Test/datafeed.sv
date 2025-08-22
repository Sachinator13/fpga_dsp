module datafeed(
	clk,
	button,
	data_out,
	clkdiv50
);

input clk;
input [3:0] button;
output [15:0] data_out;
output clkdiv50;
reg [15:0] data_out;
reg clkdiv50;


clktick divby50 (
	.clk(clk),
	.rst(1'b0),
	.en(1'b1),
	.N(30'd49999999),
	.tick(clkdiv50)
);

always_ff @(posedge clkdiv50)
	if(button[0] == 1'b0) data_out <= data_out + 1'b1;
	else if (data_out > 16'd64) data_out <= 16'b0;
	else data_out <= 16'b110;
	
endmodule