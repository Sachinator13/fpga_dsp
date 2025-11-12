`timescale 1ns / 1ps

module filter(
    input  logic clock,
    input  logic ,
    input  logic signed [15:0] Data_In,
    output logic signed [15:0] Data_Out
);


    parameter int taps = 25;


    parameter logic signed [15:0]
        h0  = 16'sd775,     
        h1  = 16'sd1860,   
        h2  = 16'sd1754,    
        h3  = 16'sd169,     
        h4  = -16'sd1365,  
        h5  = -16'sd568,    
        h6  = 16'sd1426,     
        h7  = 16'sd1364,    
        h8  = -16'sd1632,   
        h9  = -16'sd2982,  
        h10 = 16'sd1729,   
        h11 = 16'sd10284, 
        h12 = 16'sd14591,  
        h13 = 16'sd10284,   
        h14 = 16'sd1729,   
        h15 = -16'sd2982,   
        h16 = -16'sd1632,  
        h17 = 16'sd1364,   
        h18 = 16'sd1426,   
        h19 = -16'sd568,   
        h20 = -16'sd1365,   
        h21 = 16'sd169,     
        h22 = 16'sd1754,  
        h23 = 16'sd1860,   
        h24 = 16'sd775;   

 
    logic signed [15:0] FIR [0:taps-1];

    logic signed [47:0] acc;

    integer i;
    always_comb begin
        acc = '0;
        acc += h0  * FIR[0];
        acc += h1  * FIR[1];
        acc += h2  * FIR[2];
        acc += h3  * FIR[3];
        acc += h4  * FIR[4];
        acc += h5  * FIR[5];
        acc += h6  * FIR[6];
        acc += h7  * FIR[7];
        acc += h8  * FIR[8];
        acc += h9  * FIR[9];
        acc += h10 * FIR[10];
        acc += h11 * FIR[11];
        acc += h12 * FIR[12];
        acc += h13 * FIR[13];
        acc += h14 * FIR[14];
        acc += h15 * FIR[15];
        acc += h16 * FIR[16];
        acc += h17 * FIR[17];
        acc += h18 * FIR[18];
        acc += h19 * FIR[19];
        acc += h20 * FIR[20];
        acc += h21 * FIR[21];
        acc += h22 * FIR[22];
        acc += h23 * FIR[23];
        acc += h24 * FIR[24];
    end

 
    assign Data_Out = acc >>> 15;


    always_ff @(posedge clock) begin
        if (ce) begin
            for (i = 0; i < taps; i++) FIR[i] <= '0;
        end else begin
            FIR[0] <= Data_In;
            for (i = 1; i < taps; i++) FIR[i] <= FIR[i-1];
        end
    end

endmodule
