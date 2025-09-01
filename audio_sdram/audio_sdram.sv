
//`define ENABLE_HPS

module audio_sdram(

      ///////// ADC /////////
      output             ADC_CONVST,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
);


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire 								HEX0P;
wire 								HEX1P;
wire 								HEX2P;
wire 								HEX3P;
wire 								HEX4P;
wire 								HEX5P;

//=======================================================
//  Structural coding
//=======================================================

reg signed [15:0] [0:38] taps  = { 16'h 00C4,
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

reg signed [15:0] [0:8] coeff  = { 16'h 04F6,
                                  16'h 0AE4,
                                  16'h 1089,
                                  16'h 1496,
                                  16'h 160F,
                                  16'h 1496,
                                  16'h 1089,
                                  16'h 0AE4,
                                  16'h 04F6};
											 
localparam int N = 39;
localparam logic signed [N*16-1:0] COEFFS39 = {
  16'sh00C4, 16'shFF6E, 16'shFE02, 16'shFE6B, 16'sh00B6,
  16'sh0181, 16'shFF39, 16'shFD9F, 16'sh002B, 16'sh0334,
  16'sh00DF, 16'shFBEE, 16'shFD5B, 16'sh04D9, 16'sh05AE,
  16'shFA86, 16'shF3FC, 16'sh05E2, 16'sh2835, 16'sh39FB,
  16'sh2835, 16'sh05E2, 16'shF3FC, 16'shFA86, 16'sh05AE,
  16'sh04D9, 16'shFD5B, 16'shFBEE, 16'sh00DF, 16'sh0334,
  16'sh002B, 16'shFD9F, 16'shFF39, 16'sh0181, 16'sh00B6,
  16'shFE6B, 16'shFE02, 16'shFF6E, 16'sh00C4
};


wire reset_n;

assign reset_n = 1'b1;

wire [15:0] init_audio;
wire [15:0] final_audio;
wire [15:0] final_audio_2;
wire [15:0] final_audio_3;
wire [15:0] final_audio_4;

// ===================== 48 kHz CE from LRCLK =====================
// Sync AUD_DACLRC (or AUD_ADCLRCK) into CLOCK_50 and make a 1-cycle pulse at 48 kHz.
reg [2:0] lr_sync;
always @(posedge CLOCK_50) lr_sync <= {lr_sync[1:0], AUD_DACLRCK};  // or AUD_ADCLRCK
wire ce_48k = (lr_sync[2:1] == 2'b01);  // rising-edge pulse @ ~48 kHz

// ===================== FINAL AUDIO PATHS ========================

// 1) final_audio — always pass-through @ CLOCK_50
reg [15:0] final_audio_r;
always @(posedge CLOCK_50) begin
  final_audio_r <= init_audio;
end
assign final_audio = final_audio_r;

// 2) final_audio_2 — pass-through only on 48 kHz CE
reg [15:0] final_audio_2_r;
always @(posedge CLOCK_50) begin
  if (ce_48k) final_audio_2_r <= init_audio;
end
assign final_audio_2 = final_audio_2_r;

// 3) final_audio_3 — distortion, stepped by 48 kHz CE
//    Add a CE to the distortion module (see CE-enabled version below)
wire [15:0] distortion_out;
distortion_ce hopeful (
  .clk        (CLOCK_50),
  .ce         (ce_48k),
  .input_sig  (init_audio),
  .output_sig (distortion_out)
);
assign final_audio_3 = distortion_out;

// 4) final_audio_4 — filter 'filt' stepped by 48 kHz CE
//    Use a CE-enabled wrapper of your 'filter' (same algorithm, just gated)
wire [15:0] filt_out;  // downsize to 16 here; adjust if you want more headroom
// Transposed form
new_fir_transposed_flat #(.N(39), .DATA_W(16), .COEF_W(16)) u_fir (
  .clk    (CLOCK_50),
  .ce     (ce_48k),
  .x_in   (init_audio),
  .coeffs_flat (TAPSS),          // <-- just wire the array
  .y_out  (filt_out)
);
// simple truncation; replace with rounding/saturation as you like
assign final_audio_4 = filt_out[15:0];  // keep 16 MSBs

	audio_feed u0 (
		.clk_clk                            (CLOCK_50),                            //                         clk.clk
		.reset_reset_n                      (reset_n),                      //                       reset.reset_n
//		.pll_locked_export                  (<connected-to-pll_locked_export>),                  //                  pll_locked.export
		
		.pll_sdam_clk                       (DRAM_CLK),                       //                    pll_sdam.clk
		.sdram_wire_addr                    (DRAM_ADDR),                    //                  sdram_wire.addr
		.sdram_wire_ba                      (DRAM_BA),                      //                            .ba
		.sdram_wire_cas_n                   (DRAM_CAS_N),                   //                            .cas_n
		.sdram_wire_cke                     (DRAM_CKE),                     //                            .cke
		.sdram_wire_cs_n                    (DRAM_CS_N),                    //                            .cs_n
		.sdram_wire_dq                      (DRAM_DQ),                      //                            .dq
		.sdram_wire_dqm                     ({DRAM_UDQM,DRAM_LDQM}),                     //                            .dqm
		.sdram_wire_ras_n                   (DRAM_RAS_N),                   //                            .ras_n
		.sdram_wire_we_n                    (DRAM_WE_N),                    //                            .we_n
	
		.key_external_connection_export     (KEY),     //     key_external_connection.export
		.seg7_conduit_end_export            ({
                                           HEX5P, HEX5, HEX4P, HEX4, 
                                           HEX3P, HEX3, HEX2P, HEX2,
                                           HEX1P, HEX1, HEX0P, HEX0}),            //            seg7_conduit_end.export
		.pio_0_external_connection_export   (LEDR),   //   pio_0_external_connection.export
		.sw_external_connection_export      (SW),      //      sw_external_connection.export
		.i2c_scl_external_connection_export (FPGA_I2C_SCLK), // i2c_scl_external_connection.export
		.i2c_sda_external_connection_export (FPGA_I2C_SDAT), // i2c_sda_external_connection.export
		
		.audio_conduit_end_XCK              (AUD_XCK),              //           audio_conduit_end.XCK
		.audio_conduit_end_ADCDAT           (AUD_ADCDAT),           //                            .ADCDAT
		.audio_conduit_end_ADCLRC           (AUD_ADCLRCK),           //                            .ADCLRC
		.audio_conduit_end_DACDAT           (AUD_DACDAT),           //                            .DACDAT
		.audio_conduit_end_DACLRC           (AUD_DACLRCK),           //                            .DACLRC
		.audio_conduit_end_BCLK             (AUD_BCLK),             //                            .BCLK
//		.altpll_audio_locked_export         (<connected-to-altpll_audio_locked_export>)          //         altpll_audio_locked.export
		.init_audio_external_connection_export  (init_audio),  //  init_audio_external_connection.export
		.final_audio_external_connection_export (final_audio),  // final_audio_external_connection.export
		.audio_clock_export_clk                 (clk_18432),
		.final_audio_3_external_connection_export (final_audio_2), // final_audio_3_external_connection.export
		.final_audio_2_external_connection_export (final_audio_3), // final_audio_2_external_connection.export
		.final_audio_4_external_connection_export (final_audio_4)  // final_audio_4_external_connection.export
	);
	
	
	
endmodule