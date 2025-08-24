module memory_reading(
	input clk,
	input [9:0] addr,
	output reg [7:0] data
);

reg [7:0] mem_array [0:1023];

initial begin
	$readmemh("data.mem", mem_array);
end

integer i;
initial begin
    for (i = 0; i < 4; i = i + 1)
        $display("mem[%0d] = %h", i, mem_array[i]);
end

always @(posedge clk) begin
	data <= mem_array[addr];
end

endmodule