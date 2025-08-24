`timescale 1ns / 1ps

module testbench_memory;

	reg clk;
	reg [9:0] addr;
	wire [7:0] data;
	
	memory_reading TEST(
		.clk(clk),
		.addr(addr),
		.data(data)
	);
	
	//generate clock, every 5ns switch the bit, essentially a 10ns clock
	
	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		clk = 0;
		addr = 0;
		
		#10;
		
		
		repeat (10) begin
		
			@(posedge clk);
			addr = addr+1;
			@(posedge clk);
			$display("time=%0t ns, addr=%0d, data=%h", $time, addr, data);
		end
		
		#20
		
		$finish;
	end

endmodule