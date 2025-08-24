`timescale 1ns / 10ps

module sincos_tb();


localparam CLK_PERIOD = 10;
localparam signed [15:0] PI_POS = 16'b0110_0100_1000_1000;
localparam signed [15:0] PI_NEG = 16'b1001_1011_0111_1000;
localparam PHASE_INC = 256;

reg clk = 1'b0;
reg rst = 1'b1;

reg signed [15:0] phase = 0;
wire signed [14:0] cos, sin;


sincos sincos_inst(
	.clk(clk),
	.phase(phase),
	.cos(cos),
	.sin(sin)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	rst = #(CLK_PERIOD*10) 1'b0;
end

always begin
	clk = #(CLK_PERIOD/2) ~ clk;
end


always @(posedge clk)
begin
	if (rst) begin
		phase <= 0;
	end else begin
		if(phase + PHASE_INC < PI_POS) begin
			phase <= phase + PHASE_INC;
		end else begin
			phase <= PI_NEG;
		end
	end
end

endmodule
