`timescale 1ns / 10ps

module fir_tb();

localparam CORDIC_CLK_PERIOD = 2;
localparam FIR_CLK_PERIOD = 10;
localparam int CLK_PERIOD_NS = 20833;
localparam signed [15:0] PI_POS = 16'h 6488;
localparam signed [15:0] PI_NEG = 16'h 9B78;
localparam PHASE_INC_2MHz = 2;
localparam PHASE_INC_30MHz = 1;

reg cordic_clk = 1'b0;
reg fir_clk = 1'b0;
reg ns_clk = 1'b0;
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
                                  
                                  
reg signed [15:0] coeff2 [0:10] = { 16'h 0111,
                                  16'h 0AAA,
                                  16'h 1BBB,
                                  16'h 1CCC,
                                  16'h 1DDD,
                                  16'h 1EEE,
                                  16'h 1FFF,
                                  16'h 0EEE,
                                  16'h 0DDD,
                                  16'h 0000,
                                  16'h 0000};

reg signed [15:0] coeff3 [0:38] = { 16'h 00C4,
                                   16'h FF6E,
                                   16'h FE02,
                                   16'h FE6B,
                                   16'h 00B6,
                                   16'h 0181,
                                   16'h FF39,
                                   16'h FD9F,
                                   16'h 002B,
                                   16'h 0334,
                                   16'h 00DF,
                                   16'h FBEE,
                                   16'h FD5B,
                                   16'h 04D9,
                                   16'h 05AE,
                                   16'h FA86,
                                   16'h F3FC,
                                   16'h 05E2,
                                   16'h 2835,
                                   16'h 39FB,
                                   16'h 2835,
                                   16'h 05E2,
                                   16'h F3FC,
                                   16'h FA86,
                                   16'h 05AE,
                                   16'h 04D9,
                                   16'h FD5B,
                                   16'h FBEE,
                                   16'h 00DF,
                                   16'h 0334,
                                   16'h 002B,
                                   16'h FD9F,
                                   16'h FF39,
                                   16'h 0181,
                                   16'h 00B6,
                                   16'h FE6B,
                                   16'h FE02,
                                   16'h FF6E,
                                   16'h 00C4};



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
    cordic_clk = #(CLK_PERIOD_NS/2) ~ns_clk;
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


fir_transposed#(
    .N(39),
    .DATA_W(16),
    .COEF_W(16)
) u0(
    .clk(ns_clk),
//    .N(8'b00001001),
    .x(noisy_signal),
    .h(coeff3),
    .y(filtered_signal)
);
endmodule






    
    
    

