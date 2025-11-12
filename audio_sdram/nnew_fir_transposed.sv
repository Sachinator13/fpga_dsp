module new_fir_transposed_flat #(
  parameter int N=32, DATA_W=16, COEF_W=16,
  parameter int ACC_W = DATA_W + COEF_W + $clog2(N)
)(
  input  logic                         clk, ce,
  input  logic signed [DATA_W-1:0]     x_in,
  input  logic signed [N*COEF_W-1:0]   coeffs_flat,   // packed bus
  output logic signed [DATA_W-1:0]     y_out
);
  logic signed [ACC_W-1:0]             r    [0:N-1];
  logic signed [DATA_W+COEF_W-1:0]     prod [0:N-1];

  genvar i;
  generate
    for (i=0; i<N; i++) begin : G_MUL
      // MSB-first packing: {h[0], h[1], ... h[N-1]}
      wire signed [COEF_W-1:0] h_i = coeffs_flat[(i+1)*COEF_W-1 -: COEF_W];
      assign prod[i] = x_in * h_i;
    end
  endgenerate

  // Update chain once per sample (when ce=1)
  integer k;
  always_ff @(posedge clk) begin
    if (ce) begin
      // Last stage
      r[N-1] <= {{(ACC_W-(DATA_W+COEF_W)){prod[N-1][DATA_W+COEF_W-1]}}, prod[N-1]};
      // Middle stages: r[k] <= r[k+1] + prod[k]
      for (k=N-2; k>=0; k=k-1) begin
        r[k] <= r[k+1] + 
                {{(ACC_W-(DATA_W+COEF_W)){prod[k][DATA_W+COEF_W-1]}}, prod[k]};
      end
    end
  end

  // Simple round & saturate back to DATA_W (Q1.15)
  function automatic logic signed [DATA_W-1:0] round_sat(input logic signed [ACC_W-1:0] a);
    // Right shift by (COEF_W-1) assuming Q1.15 * Q1.15 => Q2.30; tune if your scaling differs
    localparam int SHIFT = (COEF_W-1);
    logic signed [ACC_W-1:0] a_rounded = a + (1 <<< (SHIFT-1));
    logic signed [ACC_W-1:0] s = a_rounded >>> SHIFT;
    // saturate to DATA_W
    logic signed [DATA_W-1:0] maxp = {1'b0, {(DATA_W-1){1'b1}}}; // 0x7FFF
    logic signed [DATA_W-1:0] minn = {1'b1, {(DATA_W-1){1'b0}}}; // 0x8000
    if (s > maxp)       return maxp;
    else if (s < minn)  return minn;
    else                return s[DATA_W-1:0];
  endfunction

  always_ff @(posedge clk) begin
    if (ce) y_out <= round_sat(r[0]);
  end
endmodule
