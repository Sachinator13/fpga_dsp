module fir_transposed#(
    parameter integer N=9,
    parameter integer DATA_W = 16,
    parameter integer COEF_W = 16
)(
    input wire          clk,
    input wire signed [DATA_W-1:0] x,
    input wire signed [COEF_W-1:0] h [0:N-1],
    output reg signed [DATA_W-1:0] y
);
    localparam integer PROD_W = DATA_W + COEF_W;
    localparam integer ACC_W = PROD_W + $clog2(N) + 1;
    
    reg signed [ACC_W-1:0] r [0:N-2];
    wire signed [PROD_W-1:0] m [0:N-1];
    
    genvar k;
    generate
        for (k=0; k<N; k=k+1) begin : mults
            assign m[k] = x* h[k];
        end
    endgenerate
    
    integer i;
    
    always @(posedge clk) begin
        y <= (m[0] + r[0]) >>> 15;
        for (i=0; i<N-2; i=i+1)
            r[i] <= m[i+1] + r[i+1];
        r[N-2] <= m[N-1];
    end
endmodule




