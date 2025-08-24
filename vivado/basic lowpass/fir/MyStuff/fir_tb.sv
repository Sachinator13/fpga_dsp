//cordic used to make 30mhz and 2mhz sine time
`timescale 1ns / 10ps

module fir_tb();

localparam CORDIC_CLK_PERIOD = 2;
localparam FIR_CLK_PERIOD = 10;
localparam signed [15:0] PI_POS = 16'h 6488;
localparam signed [15:0] PI_NEG = 16'h 9B78;
localparam PHASE_INC_2MHz = 200;
localparam PHASE_INC_30MHz = 3000;

reg cordic_clk = 1'b0;
reg fir_clk = 1'b0;
reg phase_tvalid = 1'b0;
reg signed [15:0] phase_2MHz = 0;
reg signed [15:0] phase_30MHz = 0;
wire sincos_2MHz_tvalid;
wire signed [15:0] sin_2MHz, cos_2MHz;
wire sincos_30MHz_tvalid;
wire signed [15:0] sin_30MHz, cos_30MHz;

reg signed [15:0] noisy_signal = 0;
wire signed [15:0] filtered_signal;

reg signed [15:0] coeff [0:8] = { 16'h 04F6,
                                  16'h 0AE4,
                                  16'h 1089,
                                  16'h 1496,
                                  16'h 160F,
                                  16'h 1496,
                                  16'h 1089,
                                  16'h 0AE4,
                                  16'h 04F6};
                                  
                                  
reg signed [15:0] coeff2 [0:8] = { 16'h 0111,
                                  16'h 0AAA,
                                  16'h 1BBB,
                                  16'h 1CCC,
                                  16'h 1DDD,
                                  16'h 1EEE,
                                  16'h 1FFF,
                                  16'h 0EEE,
                                  16'h 0DDD};
                                  


cordic_0 cordic_inst_0 (
    .aclk                   (cordic_clk),
    .s_axis_phase_tvalid    (phase_tvalid),
    .s_axis_phase_tdata     (phase_2MHz),
    .m_axis_dout_tvalid     (sincos_2MHz_tvalid),
    .m_axis_dout_tdata      ({sin_2MHz, cos_2MHz})
);


cordic_0 cordic_inst_1 (
    .aclk                   (cordic_clk),
    .s_axis_phase_tvalid    (phase_tvalid),
    .s_axis_phase_tdata     (phase_30MHz),
    .m_axis_dout_tvalid     (sincos_30MHz_tvalid),
    .m_axis_dout_tdata      ({sin_30MHz, cos_30MHz})
);


always @(posedge cordic_clk)
begin
    phase_tvalid <= 1'b1;
    
    if (phase_2MHz + PHASE_INC_2MHz < PI_POS) begin
        phase_2MHz <= phase_2MHz + PHASE_INC_2MHz;
    end else begin
        phase_2MHz <= PI_NEG + (phase_2MHz + PHASE_INC_2MHz - PI_POS);
    end
    
    if (phase_30MHz + PHASE_INC_30MHz < PI_POS) begin
        phase_30MHz <= phase_30MHz + PHASE_INC_30MHz;
    end else begin
        phase_30MHz <= PI_NEG + (phase_30MHz + PHASE_INC_30MHz - PI_POS);
    end
    
end




always begin
    cordic_clk = #(CORDIC_CLK_PERIOD/2) ~cordic_clk;
end

always begin
    fir_clk = #(FIR_CLK_PERIOD/2) ~fir_clk;
end


always @(posedge fir_clk)
begin
    noisy_signal <= (sin_2MHz + sin_30MHz) / 2;
end

//fir fir_inst (
//    .clk(fir_clk),
//    .noisy_signal(noisy_signal),
//    .filtered_signal(filtered_signal)
//);


fir_transposed u0(
    .clk(fir_clk),
    .x(noisy_signal),
    .h(coeff),
    .y(filtered_signal)
);
endmodule






    
    
    

