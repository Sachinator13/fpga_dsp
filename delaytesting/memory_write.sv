module memory_writing(
	input clk,
	input we,
	input [15:0] addr,
	input [15:0] din,
	output reg [15:0] dout
);

reg [15:0] mem [0:650399];

initial begin

    $readmemh("data.mem", mem);

end


always @(posedge clk) begin
	if(we)
		mem[addr] <= din;
	dout <= mem[addr];
end

endmodule