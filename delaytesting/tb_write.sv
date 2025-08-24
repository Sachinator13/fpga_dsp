`timescale 1ns / 10ps
module tb_ram_1;

reg clk = 1'b0;
reg rst = 1'b1;
reg we_write;
reg we_read;
reg [15:0] addr_w;
reg [15:0] addr_r;
reg [15:0] next_addr_r;
reg [15:0] next_addr_w;
reg [15:0] next_addr_w_2;
reg [15:0] din_w;
reg [15:0] din_r;
reg [15:0] dout_w;
reg [15:0] dout_r;
reg [15:0] counter;
reg [15:0] proc_output1;
reg [15:0] proc_output2;
reg [15:0] prev_dout;

//sincos generation

localparam CLK_PERIOD = 10;
localparam signed [15:0] PI_POS = 16'b0110_0100_1000_1000;
localparam signed [15:0] PI_NEG = 16'b1001_1011_0111_1000;
localparam PHASE_INC = 256;

reg signed [15:0] phase = 0;
wire signed [14:00] cos,sin;


sincos sincos_inst(
	.clk(clk),
	.phase(phase),
	.cos(cos),
	.sin(sin)
);



//insantiate ram



memory_writing READ (
	.clk(clk),
	.addr(addr_r),
	.we(we_read),
	.din(din_r),
	.dout(dout_r)
);

memory_writing DUT (
    .clk(clk),
    .we(we_write),
    .addr(next_addr_w),
    .din(proc_output1),
    .dout(dout_w)
);

processor mod1 (
	.clk(clk),
	.input_sig(dout_r),
	.delay(16'b0000000000000101),
	.output_sig(proc_output1)
);



always #5 clk = ~clk;

//test sequence


always @(posedge clk) begin 
	addr_r <= addr_r + 1'b1;
	addr_w <= addr_r;
	next_addr_w <= addr_w;
	next_addr_w_2 <= next_addr_w;
	//depending on the delay of the processor, adjust the numbe ro fdelayed cycles here	

end

initial begin

	we_read =1'b0;
	we_write = 1'b0;
	addr_r =1'b0;
	addr_w = 1'b0;
	
	clk = 1'b0;
	rst = 1'b1;
	rst = #(CLK_PERIOD*10) 1'b0;

//	$writememh("output.mem", DUT.mem);
end

always begin
	clk = #(CLK_PERIOD/2) ~clk;
end


always @(posedge clk)
begin
	if(rst) begin
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