module distortion_ce (
  input  logic                   clk,
  input  logic                   ce,          
  input  logic signed [15:0]     input_sig,  
  output logic signed [15:0]     output_sig
);
  localparam FS = 16'h7FFF;

  logic        neg;
  logic [15:0] x;
  logic [17:0] threeX;
  logic [15:0] y_pos;

  always_comb begin
    neg = input_sig[15];
    x   = neg ? (~input_sig + 16'sd1) : input_sig;
  end

  always_ff @(posedge clk) begin
    if (ce) begin
      threeX <= x + x + x;

      if (threeX <= FS) begin
        y_pos <= x << 1;
      end else if (threeX <= (FS << 1)) begin
        // y = (3*FS - ((2*FS - 3x)^2)/FS) / 3
        logic [17:0]  t;
        logic [35:0]  t2;
        t   = (FS << 1) - threeX;
        t2  = t * t;
        y_pos <= ( (3*FS) - (t2/FS) ) / 3;
      end else begin
        y_pos <= FS;
      end

      output_sig <= neg ? -$signed({1'b0,y_pos}) : $signed({1'b0,y_pos});
    end
  end
endmodule
