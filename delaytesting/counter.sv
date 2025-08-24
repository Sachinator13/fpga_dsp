module counter#(
    parameter WIDTH =16
)(
	input clk,
	input logic rst,
	input logic en,
	output logic [WIDTH-1:0] count
);

	always_ff@(posedge clk) begin
		if (rst) count <= {WIDTH{1'b0}};
		else count <= count +1;

	end



endmodule