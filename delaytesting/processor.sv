module processor(
	input clk,
	output reg [15:0] output_sig,
	input [15:0] input_sig,
	input [15:0] delay
);
logic [15:0] wr_addr, rd_addr;
reg [15:0] delayed;
logic [15:0] added_output;
logic rst;


//assign added_output = input_sig + 2'b11;


assign wr_addr = rd_addr + delay;

logic [11:0] boot_counter;
logic ready;

always_ff @(posedge clk) begin
	if (rst) begin 
		boot_counter <= 0;
		ready <= 0;
	end
    if (!ready) begin
        boot_counter <= boot_counter + 1;
        if (boot_counter > delay) 
			ready <= 1;
    end
end


always @(posedge clk) begin
	if(ready) output_sig <= delayed;
end

assign added_output = input_sig +(delayed);

initial begin
    rst = 1;
    #10;
    rst = 0;
	delayed = 12'b0;
end

counter COUNT(
	.clk(clk),
	.en(1'b1),
	.rst(rst),
	.count(rd_addr)
);



dualportram RAM(
	.clk(clk),
	.wr_en(1'b1),
	.rd_en(1'b1),
	.wr_addr(wr_addr),
	.rd_addr(rd_addr),
	.din(input_sig),
	.dout(delayed)
);








endmodule



