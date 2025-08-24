module dualportram #(
    parameter ADDRESS_WIDTH =16,
              DATA_WIDTH =16
)(

    input logic clk,
    input logic wr_en,
    input logic rd_en,
    input logic [ADDRESS_WIDTH-1:0] wr_addr,
    input logic [ADDRESS_WIDTH-1:0] rd_addr,
    input logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];
logic valid;
logic [3:0] count_v;


initial begin
    integer i;
    valid =0;
    count_v=0;
    for (i = 0; i < 2**ADDRESS_WIDTH; i = i + 1) begin
        ram_array[i] = 16'h0000; // or whatever default you want
    end
end




always_ff @(posedge clk) begin


    if (wr_en == 1'b1)
        ram_array[wr_addr] <= din;
    if (rd_en == 1'b1)
        dout <= ram_array [rd_addr];

end



endmodule