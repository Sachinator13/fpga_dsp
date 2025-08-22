module fullfsm(
	input logic clk,
	input logic full,
	output logic read
);


typedef enum {waiting, reading} states;
states current, next;

always_ff @(posedge clk)
	current <= next;
	
	
always_comb
	case (current)
		waiting: if(full == 1'b1) next = reading;
					else 				  next = waiting;
		reading:	next = reading;
		default: next = waiting;
	endcase
	
	
always_comb
	case(current)
		waiitng: read = 1'b0;
		reading: read = 1'b1;
	endcase
	
endmodule