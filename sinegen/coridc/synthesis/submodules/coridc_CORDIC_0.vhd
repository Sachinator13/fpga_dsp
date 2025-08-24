-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 20.1 (Release Build #720)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2020 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from coridc_CORDIC_0
-- VHDL created on Sat Aug 23 16:14:17 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity coridc_CORDIC_0 is
    port (
        a : in std_logic_vector(15 downto 0);  -- sfix16_en13
        c : out std_logic_vector(14 downto 0);  -- sfix15_en13
        s : out std_logic_vector(14 downto 0);  -- sfix15_en13
        clk : in std_logic;
        areset : in std_logic
    );
end coridc_CORDIC_0;

architecture normal of coridc_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal padACst_uid12_sincosTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal absARE_mergedSignalTM_uid18_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal argMPiO2_uid20_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal argMPiO2_uid20_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal absA_uid21_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal cstOneOverK_uid22_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_0_uid26_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_1_uid32_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1CostZeroPaddingA_uid33_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal yip1E_1NA_uid34_sincosTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal invSignOfSelectionSignal_uid36_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1NA_uid38_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_1_mergedSignalTM_uid42_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xMSB_uid44_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid48_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstArcTan2Mi_1_uid58_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_2_uid61_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_2_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid61_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_2_uid63_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_2_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid63_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_2_uid64_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_2_uid64_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_2_uid65_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_2_uid65_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal cstArcTan2Mi_2_uid74_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_3_uid77_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_3_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid77_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_3_uid79_sincosTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_3_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid79_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_3_uid80_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_3_uid80_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_3_uid81_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_3_uid81_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_3_uid90_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_4_uid93_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_4_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid93_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_4_uid95_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_4_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid95_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_4_uid96_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_4_uid96_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_4_uid97_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_4_uid97_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal cstArcTan2Mi_4_uid106_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_5_uid109_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_5_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid109_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_5_uid111_sincosTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid111_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid112_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_5_uid112_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_5_uid113_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_5_uid113_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal cstArcTan2Mi_5_uid122_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_6_uid125_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_6_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid125_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_6_uid127_sincosTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_6_uid127_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid127_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_6_uid128_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_6_uid128_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_6_uid129_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_6_uid129_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid130_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid130_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid131_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid133_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid136_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal twoToMiSiYip_uid137_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal cstArcTan2Mi_6_uid138_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_7_uid140_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_7_uid140_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid140_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_7_uid141_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_7_uid141_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_7_uid143_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_7_uid143_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7_uid143_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_7_uid144_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_7_uid144_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid145_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_7_uid145_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid146_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid146_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid147_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid149_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal twoToMiSiYip_uid153_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cstArcTan2Mi_7_uid154_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_8_uid156_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_8_uid156_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_8_uid157_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_8_uid157_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_8_uid159_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_8_uid159_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8_uid159_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_8_uid160_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_8_uid160_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid161_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_8_uid161_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid162_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid162_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid163_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid165_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid168_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiYip_uid169_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cstArcTan2Mi_8_uid170_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_9_uid172_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_9_uid172_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid172_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_9_uid173_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_9_uid173_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid173_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid175_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid175_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid176_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_9high_uid177_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_9high_uid177_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid177_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_9_uid178_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_9_uid179_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_9_uid179_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_9_uid180_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid181_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid181_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid182_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid184_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid187_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid188_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal cstArcTan2Mi_9_uid189_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_10_uid191_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_10_uid191_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid191_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_10_uid192_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_10_uid192_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid192_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid194_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid194_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid195_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_10high_uid196_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_10high_uid196_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10high_uid196_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_10_uid197_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_10_uid198_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_10_uid198_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid199_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_10_uid199_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid200_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid200_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid201_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid203_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid206_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid207_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_10_uid208_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_11_uid210_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid210_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid210_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_11_uid211_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_11_uid211_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid211_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid213_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid213_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid214_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_11high_uid215_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_11high_uid215_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11high_uid215_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_11_uid216_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_11_uid217_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_11_uid217_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid218_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_11_uid218_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid219_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid219_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid220_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid222_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid225_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid226_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cstArcTan2Mi_11_uid227_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_12_uid229_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_12_uid229_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid229_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_12_uid230_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_12_uid230_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid230_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid232_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid232_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid233_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_12high_uid234_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_12high_uid234_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12high_uid234_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_12_uid235_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_12_uid236_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_12_uid236_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid237_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_12_uid237_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid238_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid238_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid239_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid241_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid244_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid245_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_12_uid246_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_13_uid248_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_13_uid248_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid248_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_13_uid249_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_13_uid249_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid249_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid251_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid251_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid252_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_13high_uid253_sincosTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_13high_uid253_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13high_uid253_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_13_uid254_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_13_uid255_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_13_uid255_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid256_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_13_uid256_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid257_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid257_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid258_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid260_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid263_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid264_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_13_uid265_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_14_uid267_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_14_uid267_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid267_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_14_uid268_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_14_uid268_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid268_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lowRangeA_uid270_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid270_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid271_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_14high_uid272_sincosTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_14high_uid272_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14high_uid272_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_14_uid273_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_14_uid274_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_14_uid274_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid275_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_14_uid275_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid276_sincosTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid276_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid277_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid279_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid282_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid283_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_15_uid286_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_15_uid286_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid286_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal yip1E_15_uid287_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal yip1E_15_uid287_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid287_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xip1_15_uid293_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_15_uid293_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_15_uid294_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal yip1_15_uid294_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xSumPreRnd_uid296_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal xSumPreRnd_uid296_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xSumPostRnd_uid299_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal xSumPostRnd_uid299_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPreRnd_uid300_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal ySumPreRnd_uid300_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal ySumPostRnd_uid303_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal ySumPostRnd_uid303_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xPostExc_uid304_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostExc_uid304_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal yPostExc_uid305_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal yPostExc_uid305_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal invFirstQuadrant_uid306_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid307_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid308_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid310_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid311_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid311_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid313_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal invSinNegCond_uid314_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid315_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal sinPostNeg_uid315_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid315_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal invCosNegCond_uid316_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCosNegCond_uid316_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid317_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal cosPostNeg_uid317_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid317_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostRR_uid318_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid318_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xPostRR_uid319_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid319_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cos_uid320_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal cos_uid320_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal sin_uid321_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal sin_uid321_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal redist0_invCosNegCond_uid316_sincosTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sinNegCond_uid311_sincosTest_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_yPostExc_uid305_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist3_xPostExc_uid304_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist4_ySumPreRnd_uid300_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist5_xSumPreRnd_uid296_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_xMSB_uid277_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_yip1_14_uid275_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist8_xip1_14_uid274_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist9_aip1E_uid257_sincosTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist10_yip1_13_uid256_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist11_xip1_13_uid255_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist12_aip1E_uid238_sincosTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist13_yip1_12_uid237_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist14_xip1_12_uid236_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist15_aip1E_uid219_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist16_yip1_11_uid218_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist17_xip1_11_uid217_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist18_aip1E_uid200_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist19_yip1_10_uid199_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist20_xip1_10_uid198_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist21_aip1E_uid181_sincosTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist22_yip1_9_uid180_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist23_xip1_9_uid179_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist24_aip1E_uid162_sincosTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal redist25_yip1_8_uid161_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist26_xip1_8_uid160_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist27_aip1E_uid146_sincosTest_b_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist28_yip1_7_uid145_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist29_xip1_7_uid144_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist30_aip1E_uid130_sincosTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist31_yip1_6_uid129_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist32_xip1_6_uid128_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist33_aip1E_uid114_sincosTest_b_1_q : STD_LOGIC_VECTOR (20 downto 0);
    signal redist34_yip1_5_uid113_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist35_xip1_5_uid112_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist36_aip1E_uid98_sincosTest_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist37_yip1_4_uid97_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist38_xip1_4_uid96_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist39_aip1E_uid82_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist40_yip1_3_uid81_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist41_xip1_3_uid80_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist42_aip1E_uid66_sincosTest_b_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist43_yip1_2_uid65_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist44_xip1_2_uid64_sincosTest_b_1_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist45_aip1E_uid50_sincosTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist46_firstQuadrant_uid15_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist47_firstQuadrant_uid15_sincosTest_b_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_absAR_uid10_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist49_invSignA_uid8_sincosTest_q_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_signA_uid7_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "1100100100001111111";

    -- signA_uid7_sincosTest(BITSELECT,6)@0
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(a(15 downto 15));

    -- invSignA_uid8_sincosTest(LOGICAL,7)@0
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "0000000000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@0
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => constantZero_uid6_sincosTest_q(15)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => a(15)) & a));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(16 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@0
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(14 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(14 downto 0);

    -- redist48_absAR_uid10_sincosTest_b_1(DELAY,369)
    redist48_absAR_uid10_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => absAR_uid10_sincosTest_b, xout => redist48_absAR_uid10_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- padACst_uid12_sincosTest(CONSTANT,11)
    padACst_uid12_sincosTest_q <= "00000";

    -- aPostPad_uid13_sincosTest(BITJOIN,12)@1
    aPostPad_uid13_sincosTest_q <= redist48_absAR_uid10_sincosTest_b_1_q & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid14_sincosTest(SUB,13)@1
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & cstPiO2_uid11_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(20 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@1
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(20 downto 20));

    -- redist46_firstQuadrant_uid15_sincosTest_b_1(DELAY,367)
    redist46_firstQuadrant_uid15_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist46_firstQuadrant_uid15_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- invFirstQuadrant_uid306_sincosTest(LOGICAL,305)@2
    invFirstQuadrant_uid306_sincosTest_q <= not (redist46_firstQuadrant_uid15_sincosTest_b_1_q);

    -- redist50_signA_uid7_sincosTest_b_2(DELAY,371)
    redist50_signA_uid7_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_sincosTest_b, xout => redist50_signA_uid7_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- sinNegCond2_uid307_sincosTest(LOGICAL,306)@2
    sinNegCond2_uid307_sincosTest_q <= redist50_signA_uid7_sincosTest_b_2_q and invFirstQuadrant_uid306_sincosTest_q;

    -- sinNegCond1_uid308_sincosTest(LOGICAL,307)@2
    sinNegCond1_uid308_sincosTest_q <= redist50_signA_uid7_sincosTest_b_2_q and redist46_firstQuadrant_uid15_sincosTest_b_1_q;

    -- redist49_invSignA_uid8_sincosTest_q_2(DELAY,370)
    redist49_invSignA_uid8_sincosTest_q_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignA_uid8_sincosTest_q, xout => redist49_invSignA_uid8_sincosTest_q_2_q, clk => clk, aclr => areset );

    -- sinNegCond0_uid310_sincosTest(LOGICAL,309)@2
    sinNegCond0_uid310_sincosTest_q <= redist49_invSignA_uid8_sincosTest_q_2_q and invFirstQuadrant_uid306_sincosTest_q;

    -- sinNegCond_uid311_sincosTest(LOGICAL,310)@2 + 1
    sinNegCond_uid311_sincosTest_qi <= sinNegCond0_uid310_sincosTest_q or sinNegCond1_uid308_sincosTest_q or sinNegCond2_uid307_sincosTest_q;
    sinNegCond_uid311_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid311_sincosTest_qi, xout => sinNegCond_uid311_sincosTest_q, clk => clk, aclr => areset );

    -- redist1_sinNegCond_uid311_sincosTest_q_16(DELAY,322)
    redist1_sinNegCond_uid311_sincosTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid311_sincosTest_q, xout => redist1_sinNegCond_uid311_sincosTest_q_16_q, clk => clk, aclr => areset );

    -- invSinNegCond_uid314_sincosTest(LOGICAL,313)@18
    invSinNegCond_uid314_sincosTest_q <= not (redist1_sinNegCond_uid311_sincosTest_q_16_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid147_sincosTest(BITSELECT,146)@9
    xMSB_uid147_sincosTest_b <= STD_LOGIC_VECTOR(redist27_aip1E_uid146_sincosTest_b_1_q(18 downto 18));

    -- cstArcTan2Mi_7_uid154_sincosTest(CONSTANT,153)
    cstArcTan2Mi_7_uid154_sincosTest_q <= "01111111111111111";

    -- xMSB_uid131_sincosTest(BITSELECT,130)@8
    xMSB_uid131_sincosTest_b <= STD_LOGIC_VECTOR(redist30_aip1E_uid130_sincosTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_6_uid138_sincosTest(CONSTANT,137)
    cstArcTan2Mi_6_uid138_sincosTest_q <= "011111111111110101";

    -- xMSB_uid115_sincosTest(BITSELECT,114)@7
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(redist33_aip1E_uid114_sincosTest_b_1_q(20 downto 20));

    -- cstArcTan2Mi_5_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_5_uid122_sincosTest_q <= "0111111111110101011";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@6
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(redist36_aip1E_uid98_sincosTest_b_1_q(21 downto 21));

    -- cstArcTan2Mi_4_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_4_uid106_sincosTest_q <= "01111111110101010111";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@5
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(redist39_aip1E_uid82_sincosTest_b_1_q(22 downto 22));

    -- cstArcTan2Mi_3_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_3_uid90_sincosTest_q <= "011111110101011011101";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@4
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(redist42_aip1E_uid66_sincosTest_b_1_q(23 downto 23));

    -- cstArcTan2Mi_2_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_2_uid74_sincosTest_q <= "0111110101101101110110";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@3
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(redist45_aip1E_uid50_sincosTest_b_1_q(24 downto 24));

    -- cstArcTan2Mi_1_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_1_uid58_sincosTest_q <= "01110110101100011001110";

    -- invSignOfSelectionSignal_uid36_sincosTest(LOGICAL,35)@2
    invSignOfSelectionSignal_uid36_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid26_sincosTest(CONSTANT,25)
    cstArcTan2Mi_0_uid26_sincosTest_q <= "011001001000011111101101";

    -- absARE_bottomRange_uid17_sincosTest(BITSELECT,16)@1
    absARE_bottomRange_uid17_sincosTest_in <= redist48_absAR_uid10_sincosTest_b_1_q(13 downto 0);
    absARE_bottomRange_uid17_sincosTest_b <= absARE_bottomRange_uid17_sincosTest_in(13 downto 0);

    -- absARE_mergedSignalTM_uid18_sincosTest(BITJOIN,17)@1
    absARE_mergedSignalTM_uid18_sincosTest_q <= absARE_bottomRange_uid17_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid20_sincosTest(BITSELECT,19)@1
    argMPiO2_uid20_sincosTest_in <= argMPiO2_uid14_sincosTest_q(18 downto 0);
    argMPiO2_uid20_sincosTest_b <= argMPiO2_uid20_sincosTest_in(18 downto 0);

    -- absA_uid21_sincosTest(MUX,20)@1 + 1
    absA_uid21_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid21_sincosTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            absA_uid21_sincosTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (absA_uid21_sincosTest_s) IS
                WHEN "0" => absA_uid21_sincosTest_q <= argMPiO2_uid20_sincosTest_b;
                WHEN "1" => absA_uid21_sincosTest_q <= absARE_mergedSignalTM_uid18_sincosTest_q;
                WHEN OTHERS => absA_uid21_sincosTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- aip1E_1NA_uid38_sincosTest(BITJOIN,37)@2
    aip1E_1NA_uid38_sincosTest_q <= absA_uid21_sincosTest_q & padACst_uid12_sincosTest_q;

    -- aip1E_1sumAHighB_uid39_sincosTest(ADDSUB,38)@2
    aip1E_1sumAHighB_uid39_sincosTest_s <= invSignOfSelectionSignal_uid36_sincosTest_q;
    aip1E_1sumAHighB_uid39_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid38_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 24 => cstArcTan2Mi_0_uid26_sincosTest_q(23)) & cstArcTan2Mi_0_uid26_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid39_sincosTest_a, aip1E_1sumAHighB_uid39_sincosTest_b, aip1E_1sumAHighB_uid39_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid39_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid39_sincosTest_q <= aip1E_1sumAHighB_uid39_sincosTest_o(25 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@2
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid39_sincosTest_q(24 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(24 downto 0));

    -- redist45_aip1E_uid50_sincosTest_b_1(DELAY,366)
    redist45_aip1E_uid50_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid50_sincosTest_b, xout => redist45_aip1E_uid50_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_2_uid63_sincosTest(ADDSUB,62)@3
    aip1E_2_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_2_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => redist45_aip1E_uid50_sincosTest_b_1_q(24)) & redist45_aip1E_uid50_sincosTest_b_1_q));
    aip1E_2_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => cstArcTan2Mi_1_uid58_sincosTest_q(22)) & cstArcTan2Mi_1_uid58_sincosTest_q));
    aip1E_2_uid63_sincosTest_combproc: PROCESS (aip1E_2_uid63_sincosTest_a, aip1E_2_uid63_sincosTest_b, aip1E_2_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid63_sincosTest_s = "1") THEN
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) + SIGNED(aip1E_2_uid63_sincosTest_b));
        ELSE
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) - SIGNED(aip1E_2_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid63_sincosTest_q <= aip1E_2_uid63_sincosTest_o(25 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@3
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid63_sincosTest_q(23 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(23 downto 0));

    -- redist42_aip1E_uid66_sincosTest_b_1(DELAY,363)
    redist42_aip1E_uid66_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid66_sincosTest_b, xout => redist42_aip1E_uid66_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid79_sincosTest(ADDSUB,78)@4
    aip1E_3_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_3_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => redist42_aip1E_uid66_sincosTest_b_1_q(23)) & redist42_aip1E_uid66_sincosTest_b_1_q));
    aip1E_3_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 22 => cstArcTan2Mi_2_uid74_sincosTest_q(21)) & cstArcTan2Mi_2_uid74_sincosTest_q));
    aip1E_3_uid79_sincosTest_combproc: PROCESS (aip1E_3_uid79_sincosTest_a, aip1E_3_uid79_sincosTest_b, aip1E_3_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid79_sincosTest_s = "1") THEN
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) + SIGNED(aip1E_3_uid79_sincosTest_b));
        ELSE
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) - SIGNED(aip1E_3_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid79_sincosTest_q <= aip1E_3_uid79_sincosTest_o(24 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@4
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid79_sincosTest_q(22 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(22 downto 0));

    -- redist39_aip1E_uid82_sincosTest_b_1(DELAY,360)
    redist39_aip1E_uid82_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid82_sincosTest_b, xout => redist39_aip1E_uid82_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid95_sincosTest(ADDSUB,94)@5
    aip1E_4_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_4_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist39_aip1E_uid82_sincosTest_b_1_q(22)) & redist39_aip1E_uid82_sincosTest_b_1_q));
    aip1E_4_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => cstArcTan2Mi_3_uid90_sincosTest_q(20)) & cstArcTan2Mi_3_uid90_sincosTest_q));
    aip1E_4_uid95_sincosTest_combproc: PROCESS (aip1E_4_uid95_sincosTest_a, aip1E_4_uid95_sincosTest_b, aip1E_4_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid95_sincosTest_s = "1") THEN
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) + SIGNED(aip1E_4_uid95_sincosTest_b));
        ELSE
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) - SIGNED(aip1E_4_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid95_sincosTest_q <= aip1E_4_uid95_sincosTest_o(23 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@5
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid95_sincosTest_q(21 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(21 downto 0));

    -- redist36_aip1E_uid98_sincosTest_b_1(DELAY,357)
    redist36_aip1E_uid98_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid98_sincosTest_b, xout => redist36_aip1E_uid98_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid111_sincosTest(ADDSUB,110)@6
    aip1E_5_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_5_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => redist36_aip1E_uid98_sincosTest_b_1_q(21)) & redist36_aip1E_uid98_sincosTest_b_1_q));
    aip1E_5_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => cstArcTan2Mi_4_uid106_sincosTest_q(19)) & cstArcTan2Mi_4_uid106_sincosTest_q));
    aip1E_5_uid111_sincosTest_combproc: PROCESS (aip1E_5_uid111_sincosTest_a, aip1E_5_uid111_sincosTest_b, aip1E_5_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid111_sincosTest_s = "1") THEN
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) + SIGNED(aip1E_5_uid111_sincosTest_b));
        ELSE
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) - SIGNED(aip1E_5_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid111_sincosTest_q <= aip1E_5_uid111_sincosTest_o(22 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@6
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid111_sincosTest_q(20 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(20 downto 0));

    -- redist33_aip1E_uid114_sincosTest_b_1(DELAY,354)
    redist33_aip1E_uid114_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 21, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid114_sincosTest_b, xout => redist33_aip1E_uid114_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_6_uid127_sincosTest(ADDSUB,126)@7
    aip1E_6_uid127_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_6_uid127_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => redist33_aip1E_uid114_sincosTest_b_1_q(20)) & redist33_aip1E_uid114_sincosTest_b_1_q));
    aip1E_6_uid127_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 19 => cstArcTan2Mi_5_uid122_sincosTest_q(18)) & cstArcTan2Mi_5_uid122_sincosTest_q));
    aip1E_6_uid127_sincosTest_combproc: PROCESS (aip1E_6_uid127_sincosTest_a, aip1E_6_uid127_sincosTest_b, aip1E_6_uid127_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid127_sincosTest_s = "1") THEN
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) + SIGNED(aip1E_6_uid127_sincosTest_b));
        ELSE
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) - SIGNED(aip1E_6_uid127_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid127_sincosTest_q <= aip1E_6_uid127_sincosTest_o(21 downto 0);

    -- aip1E_uid130_sincosTest(BITSELECT,129)@7
    aip1E_uid130_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid127_sincosTest_q(19 downto 0));
    aip1E_uid130_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_in(19 downto 0));

    -- redist30_aip1E_uid130_sincosTest_b_1(DELAY,351)
    redist30_aip1E_uid130_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid130_sincosTest_b, xout => redist30_aip1E_uid130_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_7_uid143_sincosTest(ADDSUB,142)@8
    aip1E_7_uid143_sincosTest_s <= xMSB_uid131_sincosTest_b;
    aip1E_7_uid143_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => redist30_aip1E_uid130_sincosTest_b_1_q(19)) & redist30_aip1E_uid130_sincosTest_b_1_q));
    aip1E_7_uid143_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_6_uid138_sincosTest_q(17)) & cstArcTan2Mi_6_uid138_sincosTest_q));
    aip1E_7_uid143_sincosTest_combproc: PROCESS (aip1E_7_uid143_sincosTest_a, aip1E_7_uid143_sincosTest_b, aip1E_7_uid143_sincosTest_s)
    BEGIN
        IF (aip1E_7_uid143_sincosTest_s = "1") THEN
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) + SIGNED(aip1E_7_uid143_sincosTest_b));
        ELSE
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) - SIGNED(aip1E_7_uid143_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7_uid143_sincosTest_q <= aip1E_7_uid143_sincosTest_o(20 downto 0);

    -- aip1E_uid146_sincosTest(BITSELECT,145)@8
    aip1E_uid146_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid143_sincosTest_q(18 downto 0));
    aip1E_uid146_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_in(18 downto 0));

    -- redist27_aip1E_uid146_sincosTest_b_1(DELAY,348)
    redist27_aip1E_uid146_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid146_sincosTest_b, xout => redist27_aip1E_uid146_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_8_uid159_sincosTest(ADDSUB,158)@9
    aip1E_8_uid159_sincosTest_s <= xMSB_uid147_sincosTest_b;
    aip1E_8_uid159_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => redist27_aip1E_uid146_sincosTest_b_1_q(18)) & redist27_aip1E_uid146_sincosTest_b_1_q));
    aip1E_8_uid159_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => cstArcTan2Mi_7_uid154_sincosTest_q(16)) & cstArcTan2Mi_7_uid154_sincosTest_q));
    aip1E_8_uid159_sincosTest_combproc: PROCESS (aip1E_8_uid159_sincosTest_a, aip1E_8_uid159_sincosTest_b, aip1E_8_uid159_sincosTest_s)
    BEGIN
        IF (aip1E_8_uid159_sincosTest_s = "1") THEN
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) + SIGNED(aip1E_8_uid159_sincosTest_b));
        ELSE
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) - SIGNED(aip1E_8_uid159_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8_uid159_sincosTest_q <= aip1E_8_uid159_sincosTest_o(19 downto 0);

    -- aip1E_uid162_sincosTest(BITSELECT,161)@9
    aip1E_uid162_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid159_sincosTest_q(17 downto 0));
    aip1E_uid162_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_sincosTest_in(17 downto 0));

    -- redist24_aip1E_uid162_sincosTest_b_1(DELAY,345)
    redist24_aip1E_uid162_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid162_sincosTest_b, xout => redist24_aip1E_uid162_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid163_sincosTest(BITSELECT,162)@10
    xMSB_uid163_sincosTest_b <= STD_LOGIC_VECTOR(redist24_aip1E_uid162_sincosTest_b_1_q(17 downto 17));

    -- cstArcTan2Mi_8_uid170_sincosTest(CONSTANT,169)
    cstArcTan2Mi_8_uid170_sincosTest_q <= "0100000000000000";

    -- highABits_uid176_sincosTest(BITSELECT,175)@10
    highABits_uid176_sincosTest_b <= STD_LOGIC_VECTOR(redist24_aip1E_uid162_sincosTest_b_1_q(17 downto 1));

    -- aip1E_9high_uid177_sincosTest(ADDSUB,176)@10
    aip1E_9high_uid177_sincosTest_s <= xMSB_uid163_sincosTest_b;
    aip1E_9high_uid177_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => highABits_uid176_sincosTest_b(16)) & highABits_uid176_sincosTest_b));
    aip1E_9high_uid177_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => cstArcTan2Mi_8_uid170_sincosTest_q(15)) & cstArcTan2Mi_8_uid170_sincosTest_q));
    aip1E_9high_uid177_sincosTest_combproc: PROCESS (aip1E_9high_uid177_sincosTest_a, aip1E_9high_uid177_sincosTest_b, aip1E_9high_uid177_sincosTest_s)
    BEGIN
        IF (aip1E_9high_uid177_sincosTest_s = "1") THEN
            aip1E_9high_uid177_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid177_sincosTest_a) + SIGNED(aip1E_9high_uid177_sincosTest_b));
        ELSE
            aip1E_9high_uid177_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid177_sincosTest_a) - SIGNED(aip1E_9high_uid177_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid177_sincosTest_q <= aip1E_9high_uid177_sincosTest_o(17 downto 0);

    -- lowRangeA_uid175_sincosTest(BITSELECT,174)@10
    lowRangeA_uid175_sincosTest_in <= redist24_aip1E_uid162_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid175_sincosTest_b <= lowRangeA_uid175_sincosTest_in(0 downto 0);

    -- aip1E_9_uid178_sincosTest(BITJOIN,177)@10
    aip1E_9_uid178_sincosTest_q <= aip1E_9high_uid177_sincosTest_q & lowRangeA_uid175_sincosTest_b;

    -- aip1E_uid181_sincosTest(BITSELECT,180)@10
    aip1E_uid181_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid178_sincosTest_q(16 downto 0));
    aip1E_uid181_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid181_sincosTest_in(16 downto 0));

    -- redist21_aip1E_uid181_sincosTest_b_1(DELAY,342)
    redist21_aip1E_uid181_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid181_sincosTest_b, xout => redist21_aip1E_uid181_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid182_sincosTest(BITSELECT,181)@11
    xMSB_uid182_sincosTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid181_sincosTest_b_1_q(16 downto 16));

    -- cstArcTan2Mi_9_uid189_sincosTest(CONSTANT,188)
    cstArcTan2Mi_9_uid189_sincosTest_q <= "010000000000000";

    -- highABits_uid195_sincosTest(BITSELECT,194)@11
    highABits_uid195_sincosTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid181_sincosTest_b_1_q(16 downto 1));

    -- aip1E_10high_uid196_sincosTest(ADDSUB,195)@11
    aip1E_10high_uid196_sincosTest_s <= xMSB_uid182_sincosTest_b;
    aip1E_10high_uid196_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => highABits_uid195_sincosTest_b(15)) & highABits_uid195_sincosTest_b));
    aip1E_10high_uid196_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 15 => cstArcTan2Mi_9_uid189_sincosTest_q(14)) & cstArcTan2Mi_9_uid189_sincosTest_q));
    aip1E_10high_uid196_sincosTest_combproc: PROCESS (aip1E_10high_uid196_sincosTest_a, aip1E_10high_uid196_sincosTest_b, aip1E_10high_uid196_sincosTest_s)
    BEGIN
        IF (aip1E_10high_uid196_sincosTest_s = "1") THEN
            aip1E_10high_uid196_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid196_sincosTest_a) + SIGNED(aip1E_10high_uid196_sincosTest_b));
        ELSE
            aip1E_10high_uid196_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid196_sincosTest_a) - SIGNED(aip1E_10high_uid196_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_10high_uid196_sincosTest_q <= aip1E_10high_uid196_sincosTest_o(16 downto 0);

    -- lowRangeA_uid194_sincosTest(BITSELECT,193)@11
    lowRangeA_uid194_sincosTest_in <= redist21_aip1E_uid181_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid194_sincosTest_b <= lowRangeA_uid194_sincosTest_in(0 downto 0);

    -- aip1E_10_uid197_sincosTest(BITJOIN,196)@11
    aip1E_10_uid197_sincosTest_q <= aip1E_10high_uid196_sincosTest_q & lowRangeA_uid194_sincosTest_b;

    -- aip1E_uid200_sincosTest(BITSELECT,199)@11
    aip1E_uid200_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid197_sincosTest_q(15 downto 0));
    aip1E_uid200_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid200_sincosTest_in(15 downto 0));

    -- redist18_aip1E_uid200_sincosTest_b_1(DELAY,339)
    redist18_aip1E_uid200_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid200_sincosTest_b, xout => redist18_aip1E_uid200_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid201_sincosTest(BITSELECT,200)@12
    xMSB_uid201_sincosTest_b <= STD_LOGIC_VECTOR(redist18_aip1E_uid200_sincosTest_b_1_q(15 downto 15));

    -- cstArcTan2Mi_10_uid208_sincosTest(CONSTANT,207)
    cstArcTan2Mi_10_uid208_sincosTest_q <= "01000000000000";

    -- highABits_uid214_sincosTest(BITSELECT,213)@12
    highABits_uid214_sincosTest_b <= STD_LOGIC_VECTOR(redist18_aip1E_uid200_sincosTest_b_1_q(15 downto 1));

    -- aip1E_11high_uid215_sincosTest(ADDSUB,214)@12
    aip1E_11high_uid215_sincosTest_s <= xMSB_uid201_sincosTest_b;
    aip1E_11high_uid215_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => highABits_uid214_sincosTest_b(14)) & highABits_uid214_sincosTest_b));
    aip1E_11high_uid215_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => cstArcTan2Mi_10_uid208_sincosTest_q(13)) & cstArcTan2Mi_10_uid208_sincosTest_q));
    aip1E_11high_uid215_sincosTest_combproc: PROCESS (aip1E_11high_uid215_sincosTest_a, aip1E_11high_uid215_sincosTest_b, aip1E_11high_uid215_sincosTest_s)
    BEGIN
        IF (aip1E_11high_uid215_sincosTest_s = "1") THEN
            aip1E_11high_uid215_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid215_sincosTest_a) + SIGNED(aip1E_11high_uid215_sincosTest_b));
        ELSE
            aip1E_11high_uid215_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid215_sincosTest_a) - SIGNED(aip1E_11high_uid215_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_11high_uid215_sincosTest_q <= aip1E_11high_uid215_sincosTest_o(15 downto 0);

    -- lowRangeA_uid213_sincosTest(BITSELECT,212)@12
    lowRangeA_uid213_sincosTest_in <= redist18_aip1E_uid200_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid213_sincosTest_b <= lowRangeA_uid213_sincosTest_in(0 downto 0);

    -- aip1E_11_uid216_sincosTest(BITJOIN,215)@12
    aip1E_11_uid216_sincosTest_q <= aip1E_11high_uid215_sincosTest_q & lowRangeA_uid213_sincosTest_b;

    -- aip1E_uid219_sincosTest(BITSELECT,218)@12
    aip1E_uid219_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid216_sincosTest_q(14 downto 0));
    aip1E_uid219_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid219_sincosTest_in(14 downto 0));

    -- redist15_aip1E_uid219_sincosTest_b_1(DELAY,336)
    redist15_aip1E_uid219_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid219_sincosTest_b, xout => redist15_aip1E_uid219_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid220_sincosTest(BITSELECT,219)@13
    xMSB_uid220_sincosTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid219_sincosTest_b_1_q(14 downto 14));

    -- cstArcTan2Mi_11_uid227_sincosTest(CONSTANT,226)
    cstArcTan2Mi_11_uid227_sincosTest_q <= "0100000000000";

    -- highABits_uid233_sincosTest(BITSELECT,232)@13
    highABits_uid233_sincosTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid219_sincosTest_b_1_q(14 downto 1));

    -- aip1E_12high_uid234_sincosTest(ADDSUB,233)@13
    aip1E_12high_uid234_sincosTest_s <= xMSB_uid220_sincosTest_b;
    aip1E_12high_uid234_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid233_sincosTest_b(13)) & highABits_uid233_sincosTest_b));
    aip1E_12high_uid234_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_11_uid227_sincosTest_q(12)) & cstArcTan2Mi_11_uid227_sincosTest_q));
    aip1E_12high_uid234_sincosTest_combproc: PROCESS (aip1E_12high_uid234_sincosTest_a, aip1E_12high_uid234_sincosTest_b, aip1E_12high_uid234_sincosTest_s)
    BEGIN
        IF (aip1E_12high_uid234_sincosTest_s = "1") THEN
            aip1E_12high_uid234_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid234_sincosTest_a) + SIGNED(aip1E_12high_uid234_sincosTest_b));
        ELSE
            aip1E_12high_uid234_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid234_sincosTest_a) - SIGNED(aip1E_12high_uid234_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_12high_uid234_sincosTest_q <= aip1E_12high_uid234_sincosTest_o(14 downto 0);

    -- lowRangeA_uid232_sincosTest(BITSELECT,231)@13
    lowRangeA_uid232_sincosTest_in <= redist15_aip1E_uid219_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid232_sincosTest_b <= lowRangeA_uid232_sincosTest_in(0 downto 0);

    -- aip1E_12_uid235_sincosTest(BITJOIN,234)@13
    aip1E_12_uid235_sincosTest_q <= aip1E_12high_uid234_sincosTest_q & lowRangeA_uid232_sincosTest_b;

    -- aip1E_uid238_sincosTest(BITSELECT,237)@13
    aip1E_uid238_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_12_uid235_sincosTest_q(13 downto 0));
    aip1E_uid238_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid238_sincosTest_in(13 downto 0));

    -- redist12_aip1E_uid238_sincosTest_b_1(DELAY,333)
    redist12_aip1E_uid238_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid238_sincosTest_b, xout => redist12_aip1E_uid238_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid239_sincosTest(BITSELECT,238)@14
    xMSB_uid239_sincosTest_b <= STD_LOGIC_VECTOR(redist12_aip1E_uid238_sincosTest_b_1_q(13 downto 13));

    -- cstArcTan2Mi_12_uid246_sincosTest(CONSTANT,245)
    cstArcTan2Mi_12_uid246_sincosTest_q <= "010000000000";

    -- highABits_uid252_sincosTest(BITSELECT,251)@14
    highABits_uid252_sincosTest_b <= STD_LOGIC_VECTOR(redist12_aip1E_uid238_sincosTest_b_1_q(13 downto 1));

    -- aip1E_13high_uid253_sincosTest(ADDSUB,252)@14
    aip1E_13high_uid253_sincosTest_s <= xMSB_uid239_sincosTest_b;
    aip1E_13high_uid253_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid252_sincosTest_b(12)) & highABits_uid252_sincosTest_b));
    aip1E_13high_uid253_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => cstArcTan2Mi_12_uid246_sincosTest_q(11)) & cstArcTan2Mi_12_uid246_sincosTest_q));
    aip1E_13high_uid253_sincosTest_combproc: PROCESS (aip1E_13high_uid253_sincosTest_a, aip1E_13high_uid253_sincosTest_b, aip1E_13high_uid253_sincosTest_s)
    BEGIN
        IF (aip1E_13high_uid253_sincosTest_s = "1") THEN
            aip1E_13high_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid253_sincosTest_a) + SIGNED(aip1E_13high_uid253_sincosTest_b));
        ELSE
            aip1E_13high_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid253_sincosTest_a) - SIGNED(aip1E_13high_uid253_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_13high_uid253_sincosTest_q <= aip1E_13high_uid253_sincosTest_o(13 downto 0);

    -- lowRangeA_uid251_sincosTest(BITSELECT,250)@14
    lowRangeA_uid251_sincosTest_in <= redist12_aip1E_uid238_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid251_sincosTest_b <= lowRangeA_uid251_sincosTest_in(0 downto 0);

    -- aip1E_13_uid254_sincosTest(BITJOIN,253)@14
    aip1E_13_uid254_sincosTest_q <= aip1E_13high_uid253_sincosTest_q & lowRangeA_uid251_sincosTest_b;

    -- aip1E_uid257_sincosTest(BITSELECT,256)@14
    aip1E_uid257_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_13_uid254_sincosTest_q(12 downto 0));
    aip1E_uid257_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid257_sincosTest_in(12 downto 0));

    -- redist9_aip1E_uid257_sincosTest_b_1(DELAY,330)
    redist9_aip1E_uid257_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid257_sincosTest_b, xout => redist9_aip1E_uid257_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid258_sincosTest(BITSELECT,257)@15
    xMSB_uid258_sincosTest_b <= STD_LOGIC_VECTOR(redist9_aip1E_uid257_sincosTest_b_1_q(12 downto 12));

    -- cstArcTan2Mi_13_uid265_sincosTest(CONSTANT,264)
    cstArcTan2Mi_13_uid265_sincosTest_q <= "01000000000";

    -- highABits_uid271_sincosTest(BITSELECT,270)@15
    highABits_uid271_sincosTest_b <= STD_LOGIC_VECTOR(redist9_aip1E_uid257_sincosTest_b_1_q(12 downto 1));

    -- aip1E_14high_uid272_sincosTest(ADDSUB,271)@15
    aip1E_14high_uid272_sincosTest_s <= xMSB_uid258_sincosTest_b;
    aip1E_14high_uid272_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => highABits_uid271_sincosTest_b(11)) & highABits_uid271_sincosTest_b));
    aip1E_14high_uid272_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => cstArcTan2Mi_13_uid265_sincosTest_q(10)) & cstArcTan2Mi_13_uid265_sincosTest_q));
    aip1E_14high_uid272_sincosTest_combproc: PROCESS (aip1E_14high_uid272_sincosTest_a, aip1E_14high_uid272_sincosTest_b, aip1E_14high_uid272_sincosTest_s)
    BEGIN
        IF (aip1E_14high_uid272_sincosTest_s = "1") THEN
            aip1E_14high_uid272_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid272_sincosTest_a) + SIGNED(aip1E_14high_uid272_sincosTest_b));
        ELSE
            aip1E_14high_uid272_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid272_sincosTest_a) - SIGNED(aip1E_14high_uid272_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_14high_uid272_sincosTest_q <= aip1E_14high_uid272_sincosTest_o(12 downto 0);

    -- lowRangeA_uid270_sincosTest(BITSELECT,269)@15
    lowRangeA_uid270_sincosTest_in <= redist9_aip1E_uid257_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid270_sincosTest_b <= lowRangeA_uid270_sincosTest_in(0 downto 0);

    -- aip1E_14_uid273_sincosTest(BITJOIN,272)@15
    aip1E_14_uid273_sincosTest_q <= aip1E_14high_uid272_sincosTest_q & lowRangeA_uid270_sincosTest_b;

    -- aip1E_uid276_sincosTest(BITSELECT,275)@15
    aip1E_uid276_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_14_uid273_sincosTest_q(11 downto 0));
    aip1E_uid276_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid276_sincosTest_in(11 downto 0));

    -- xMSB_uid277_sincosTest(BITSELECT,276)@15
    xMSB_uid277_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid276_sincosTest_b(11 downto 11));

    -- redist6_xMSB_uid277_sincosTest_b_1(DELAY,327)
    redist6_xMSB_uid277_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid277_sincosTest_b, xout => redist6_xMSB_uid277_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid279_sincosTest(LOGICAL,278)@16
    signOfSelectionSignal_uid279_sincosTest_q <= not (redist6_xMSB_uid277_sincosTest_b_1_q);

    -- signOfSelectionSignal_uid241_sincosTest(LOGICAL,240)@14
    signOfSelectionSignal_uid241_sincosTest_q <= not (xMSB_uid239_sincosTest_b);

    -- signOfSelectionSignal_uid203_sincosTest(LOGICAL,202)@12
    signOfSelectionSignal_uid203_sincosTest_q <= not (xMSB_uid201_sincosTest_b);

    -- signOfSelectionSignal_uid165_sincosTest(LOGICAL,164)@10
    signOfSelectionSignal_uid165_sincosTest_q <= not (xMSB_uid163_sincosTest_b);

    -- signOfSelectionSignal_uid133_sincosTest(LOGICAL,132)@8
    signOfSelectionSignal_uid133_sincosTest_q <= not (xMSB_uid131_sincosTest_b);

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@6
    signOfSelectionSignal_uid101_sincosTest_q <= not (xMSB_uid99_sincosTest_b);

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@4
    signOfSelectionSignal_uid69_sincosTest_q <= not (xMSB_uid67_sincosTest_b);

    -- xMSB_uid44_sincosTest(BITSELECT,43)@3
    xMSB_uid44_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid35_sincosTest_q(31 downto 31));

    -- cstOneOverK_uid22_sincosTest(CONSTANT,21)
    cstOneOverK_uid22_sincosTest_q <= "100110110111010011101101101010";

    -- yip1E_1CostZeroPaddingA_uid33_sincosTest(CONSTANT,32)
    yip1E_1CostZeroPaddingA_uid33_sincosTest_q <= "000000000000000000000000000000";

    -- yip1E_1NA_uid34_sincosTest(BITJOIN,33)@2
    yip1E_1NA_uid34_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid33_sincosTest_q;

    -- yip1E_1sumAHighB_uid35_sincosTest(ADDSUB,34)@2 + 1
    yip1E_1sumAHighB_uid35_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid35_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid34_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid22_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1sumAHighB_uid35_sincosTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yip1E_1sumAHighB_uid35_sincosTest_s = "1") THEN
                yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
            ELSE
                yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid35_sincosTest_q <= yip1E_1sumAHighB_uid35_sincosTest_o(31 downto 0);

    -- yip1_1_mergedSignalTM_uid48_sincosTest(BITJOIN,47)@3
    yip1_1_mergedSignalTM_uid48_sincosTest_q <= xMSB_uid44_sincosTest_b & yip1E_1sumAHighB_uid35_sincosTest_q;

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@3
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid48_sincosTest_q(32 downto 1));

    -- xip1E_1_uid32_sincosTest(BITJOIN,31)@3
    xip1E_1_uid32_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid22_sincosTest_q;

    -- xip1_1_topRange_uid41_sincosTest(BITSELECT,40)@3
    xip1_1_topRange_uid41_sincosTest_in <= xip1E_1_uid32_sincosTest_q(31 downto 0);
    xip1_1_topRange_uid41_sincosTest_b <= xip1_1_topRange_uid41_sincosTest_in(31 downto 0);

    -- xip1_1_mergedSignalTM_uid42_sincosTest(BITJOIN,41)@3
    xip1_1_mergedSignalTM_uid42_sincosTest_q <= GND_q & xip1_1_topRange_uid41_sincosTest_b;

    -- xip1E_2_uid60_sincosTest(ADDSUB,59)@3
    xip1E_2_uid60_sincosTest_s <= xMSB_uid51_sincosTest_b;
    xip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => xip1_1_mergedSignalTM_uid42_sincosTest_q(32)) & xip1_1_mergedSignalTM_uid42_sincosTest_q));
    xip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 32 => twoToMiSiYip_uid57_sincosTest_b(31)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_2_uid60_sincosTest_combproc: PROCESS (xip1E_2_uid60_sincosTest_a, xip1E_2_uid60_sincosTest_b, xip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid60_sincosTest_s = "1") THEN
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) + SIGNED(xip1E_2_uid60_sincosTest_b));
        ELSE
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) - SIGNED(xip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid60_sincosTest_q <= xip1E_2_uid60_sincosTest_o(33 downto 0);

    -- xip1_2_uid64_sincosTest(BITSELECT,63)@3
    xip1_2_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid60_sincosTest_q(32 downto 0));
    xip1_2_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_in(32 downto 0));

    -- redist44_xip1_2_uid64_sincosTest_b_1(DELAY,365)
    redist44_xip1_2_uid64_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid64_sincosTest_b, xout => redist44_xip1_2_uid64_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@4
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(redist44_xip1_2_uid64_sincosTest_b_1_q(32 downto 2));

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@3
    signOfSelectionSignal_uid53_sincosTest_q <= not (xMSB_uid51_sincosTest_b);

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@3
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid42_sincosTest_q(32 downto 1));

    -- yip1E_2_uid61_sincosTest(ADDSUB,60)@3
    yip1E_2_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_2_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => yip1_1_mergedSignalTM_uid48_sincosTest_q(32)) & yip1_1_mergedSignalTM_uid48_sincosTest_q));
    yip1E_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 32 => twoToMiSiXip_uid56_sincosTest_b(31)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_2_uid61_sincosTest_combproc: PROCESS (yip1E_2_uid61_sincosTest_a, yip1E_2_uid61_sincosTest_b, yip1E_2_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid61_sincosTest_s = "1") THEN
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) + SIGNED(yip1E_2_uid61_sincosTest_b));
        ELSE
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) - SIGNED(yip1E_2_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid61_sincosTest_q <= yip1E_2_uid61_sincosTest_o(33 downto 0);

    -- yip1_2_uid65_sincosTest(BITSELECT,64)@3
    yip1_2_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid61_sincosTest_q(32 downto 0));
    yip1_2_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_in(32 downto 0));

    -- redist43_yip1_2_uid65_sincosTest_b_1(DELAY,364)
    redist43_yip1_2_uid65_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid65_sincosTest_b, xout => redist43_yip1_2_uid65_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_3_uid77_sincosTest(ADDSUB,76)@4
    yip1E_3_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_3_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist43_yip1_2_uid65_sincosTest_b_1_q(32)) & redist43_yip1_2_uid65_sincosTest_b_1_q));
    yip1E_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 31 => twoToMiSiXip_uid72_sincosTest_b(30)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_3_uid77_sincosTest_combproc: PROCESS (yip1E_3_uid77_sincosTest_a, yip1E_3_uid77_sincosTest_b, yip1E_3_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid77_sincosTest_s = "1") THEN
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) + SIGNED(yip1E_3_uid77_sincosTest_b));
        ELSE
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) - SIGNED(yip1E_3_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid77_sincosTest_q <= yip1E_3_uid77_sincosTest_o(33 downto 0);

    -- yip1_3_uid81_sincosTest(BITSELECT,80)@4
    yip1_3_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid77_sincosTest_q(32 downto 0));
    yip1_3_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_in(32 downto 0));

    -- redist40_yip1_3_uid81_sincosTest_b_1(DELAY,361)
    redist40_yip1_3_uid81_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid81_sincosTest_b, xout => redist40_yip1_3_uid81_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@5
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(redist40_yip1_3_uid81_sincosTest_b_1_q(32 downto 3));

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@4
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(redist43_yip1_2_uid65_sincosTest_b_1_q(32 downto 2));

    -- xip1E_3_uid76_sincosTest(ADDSUB,75)@4
    xip1E_3_uid76_sincosTest_s <= xMSB_uid67_sincosTest_b;
    xip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist44_xip1_2_uid64_sincosTest_b_1_q(32)) & redist44_xip1_2_uid64_sincosTest_b_1_q));
    xip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 31 => twoToMiSiYip_uid73_sincosTest_b(30)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_3_uid76_sincosTest_combproc: PROCESS (xip1E_3_uid76_sincosTest_a, xip1E_3_uid76_sincosTest_b, xip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid76_sincosTest_s = "1") THEN
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) + SIGNED(xip1E_3_uid76_sincosTest_b));
        ELSE
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) - SIGNED(xip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid76_sincosTest_q <= xip1E_3_uid76_sincosTest_o(33 downto 0);

    -- xip1_3_uid80_sincosTest(BITSELECT,79)@4
    xip1_3_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid76_sincosTest_q(32 downto 0));
    xip1_3_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_in(32 downto 0));

    -- redist41_xip1_3_uid80_sincosTest_b_1(DELAY,362)
    redist41_xip1_3_uid80_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid80_sincosTest_b, xout => redist41_xip1_3_uid80_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4_uid92_sincosTest(ADDSUB,91)@5
    xip1E_4_uid92_sincosTest_s <= xMSB_uid83_sincosTest_b;
    xip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist41_xip1_3_uid80_sincosTest_b_1_q(32)) & redist41_xip1_3_uid80_sincosTest_b_1_q));
    xip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => twoToMiSiYip_uid89_sincosTest_b(29)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_4_uid92_sincosTest_combproc: PROCESS (xip1E_4_uid92_sincosTest_a, xip1E_4_uid92_sincosTest_b, xip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid92_sincosTest_s = "1") THEN
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) + SIGNED(xip1E_4_uid92_sincosTest_b));
        ELSE
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) - SIGNED(xip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid92_sincosTest_q <= xip1E_4_uid92_sincosTest_o(33 downto 0);

    -- xip1_4_uid96_sincosTest(BITSELECT,95)@5
    xip1_4_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid92_sincosTest_q(32 downto 0));
    xip1_4_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_in(32 downto 0));

    -- redist38_xip1_4_uid96_sincosTest_b_1(DELAY,359)
    redist38_xip1_4_uid96_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid96_sincosTest_b, xout => redist38_xip1_4_uid96_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@6
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(redist38_xip1_4_uid96_sincosTest_b_1_q(32 downto 4));

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@5
    signOfSelectionSignal_uid85_sincosTest_q <= not (xMSB_uid83_sincosTest_b);

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@5
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(redist41_xip1_3_uid80_sincosTest_b_1_q(32 downto 3));

    -- yip1E_4_uid93_sincosTest(ADDSUB,92)@5
    yip1E_4_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_4_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist40_yip1_3_uid81_sincosTest_b_1_q(32)) & redist40_yip1_3_uid81_sincosTest_b_1_q));
    yip1E_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 30 => twoToMiSiXip_uid88_sincosTest_b(29)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_4_uid93_sincosTest_combproc: PROCESS (yip1E_4_uid93_sincosTest_a, yip1E_4_uid93_sincosTest_b, yip1E_4_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid93_sincosTest_s = "1") THEN
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) + SIGNED(yip1E_4_uid93_sincosTest_b));
        ELSE
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) - SIGNED(yip1E_4_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid93_sincosTest_q <= yip1E_4_uid93_sincosTest_o(33 downto 0);

    -- yip1_4_uid97_sincosTest(BITSELECT,96)@5
    yip1_4_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid93_sincosTest_q(32 downto 0));
    yip1_4_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_in(32 downto 0));

    -- redist37_yip1_4_uid97_sincosTest_b_1(DELAY,358)
    redist37_yip1_4_uid97_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid97_sincosTest_b, xout => redist37_yip1_4_uid97_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_5_uid109_sincosTest(ADDSUB,108)@6
    yip1E_5_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_5_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist37_yip1_4_uid97_sincosTest_b_1_q(32)) & redist37_yip1_4_uid97_sincosTest_b_1_q));
    yip1E_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => twoToMiSiXip_uid104_sincosTest_b(28)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_5_uid109_sincosTest_combproc: PROCESS (yip1E_5_uid109_sincosTest_a, yip1E_5_uid109_sincosTest_b, yip1E_5_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid109_sincosTest_s = "1") THEN
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) + SIGNED(yip1E_5_uid109_sincosTest_b));
        ELSE
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) - SIGNED(yip1E_5_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid109_sincosTest_q <= yip1E_5_uid109_sincosTest_o(33 downto 0);

    -- yip1_5_uid113_sincosTest(BITSELECT,112)@6
    yip1_5_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid109_sincosTest_q(32 downto 0));
    yip1_5_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_in(32 downto 0));

    -- redist34_yip1_5_uid113_sincosTest_b_1(DELAY,355)
    redist34_yip1_5_uid113_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid113_sincosTest_b, xout => redist34_yip1_5_uid113_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@7
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(redist34_yip1_5_uid113_sincosTest_b_1_q(32 downto 5));

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@6
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(redist37_yip1_4_uid97_sincosTest_b_1_q(32 downto 4));

    -- xip1E_5_uid108_sincosTest(ADDSUB,107)@6
    xip1E_5_uid108_sincosTest_s <= xMSB_uid99_sincosTest_b;
    xip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist38_xip1_4_uid96_sincosTest_b_1_q(32)) & redist38_xip1_4_uid96_sincosTest_b_1_q));
    xip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 29 => twoToMiSiYip_uid105_sincosTest_b(28)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_5_uid108_sincosTest_combproc: PROCESS (xip1E_5_uid108_sincosTest_a, xip1E_5_uid108_sincosTest_b, xip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid108_sincosTest_s = "1") THEN
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) + SIGNED(xip1E_5_uid108_sincosTest_b));
        ELSE
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) - SIGNED(xip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid108_sincosTest_q <= xip1E_5_uid108_sincosTest_o(33 downto 0);

    -- xip1_5_uid112_sincosTest(BITSELECT,111)@6
    xip1_5_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid108_sincosTest_q(32 downto 0));
    xip1_5_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_in(32 downto 0));

    -- redist35_xip1_5_uid112_sincosTest_b_1(DELAY,356)
    redist35_xip1_5_uid112_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid112_sincosTest_b, xout => redist35_xip1_5_uid112_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_6_uid124_sincosTest(ADDSUB,123)@7
    xip1E_6_uid124_sincosTest_s <= xMSB_uid115_sincosTest_b;
    xip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist35_xip1_5_uid112_sincosTest_b_1_q(32)) & redist35_xip1_5_uid112_sincosTest_b_1_q));
    xip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 28 => twoToMiSiYip_uid121_sincosTest_b(27)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_6_uid124_sincosTest_combproc: PROCESS (xip1E_6_uid124_sincosTest_a, xip1E_6_uid124_sincosTest_b, xip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid124_sincosTest_s = "1") THEN
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) + SIGNED(xip1E_6_uid124_sincosTest_b));
        ELSE
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) - SIGNED(xip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid124_sincosTest_q <= xip1E_6_uid124_sincosTest_o(33 downto 0);

    -- xip1_6_uid128_sincosTest(BITSELECT,127)@7
    xip1_6_uid128_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid124_sincosTest_q(32 downto 0));
    xip1_6_uid128_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_in(32 downto 0));

    -- redist32_xip1_6_uid128_sincosTest_b_1(DELAY,353)
    redist32_xip1_6_uid128_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid128_sincosTest_b, xout => redist32_xip1_6_uid128_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid136_sincosTest(BITSELECT,135)@8
    twoToMiSiXip_uid136_sincosTest_b <= STD_LOGIC_VECTOR(redist32_xip1_6_uid128_sincosTest_b_1_q(32 downto 6));

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@7
    signOfSelectionSignal_uid117_sincosTest_q <= not (xMSB_uid115_sincosTest_b);

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@7
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(redist35_xip1_5_uid112_sincosTest_b_1_q(32 downto 5));

    -- yip1E_6_uid125_sincosTest(ADDSUB,124)@7
    yip1E_6_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_6_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist34_yip1_5_uid113_sincosTest_b_1_q(32)) & redist34_yip1_5_uid113_sincosTest_b_1_q));
    yip1E_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 28 => twoToMiSiXip_uid120_sincosTest_b(27)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_6_uid125_sincosTest_combproc: PROCESS (yip1E_6_uid125_sincosTest_a, yip1E_6_uid125_sincosTest_b, yip1E_6_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid125_sincosTest_s = "1") THEN
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) + SIGNED(yip1E_6_uid125_sincosTest_b));
        ELSE
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) - SIGNED(yip1E_6_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid125_sincosTest_q <= yip1E_6_uid125_sincosTest_o(33 downto 0);

    -- yip1_6_uid129_sincosTest(BITSELECT,128)@7
    yip1_6_uid129_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid125_sincosTest_q(32 downto 0));
    yip1_6_uid129_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_in(32 downto 0));

    -- redist31_yip1_6_uid129_sincosTest_b_1(DELAY,352)
    redist31_yip1_6_uid129_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid129_sincosTest_b, xout => redist31_yip1_6_uid129_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_7_uid141_sincosTest(ADDSUB,140)@8
    yip1E_7_uid141_sincosTest_s <= signOfSelectionSignal_uid133_sincosTest_q;
    yip1E_7_uid141_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist31_yip1_6_uid129_sincosTest_b_1_q(32)) & redist31_yip1_6_uid129_sincosTest_b_1_q));
    yip1E_7_uid141_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => twoToMiSiXip_uid136_sincosTest_b(26)) & twoToMiSiXip_uid136_sincosTest_b));
    yip1E_7_uid141_sincosTest_combproc: PROCESS (yip1E_7_uid141_sincosTest_a, yip1E_7_uid141_sincosTest_b, yip1E_7_uid141_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid141_sincosTest_s = "1") THEN
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) + SIGNED(yip1E_7_uid141_sincosTest_b));
        ELSE
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) - SIGNED(yip1E_7_uid141_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid141_sincosTest_q <= yip1E_7_uid141_sincosTest_o(33 downto 0);

    -- yip1_7_uid145_sincosTest(BITSELECT,144)@8
    yip1_7_uid145_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid141_sincosTest_q(32 downto 0));
    yip1_7_uid145_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_in(32 downto 0));

    -- redist28_yip1_7_uid145_sincosTest_b_1(DELAY,349)
    redist28_yip1_7_uid145_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid145_sincosTest_b, xout => redist28_yip1_7_uid145_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid153_sincosTest(BITSELECT,152)@9
    twoToMiSiYip_uid153_sincosTest_b <= STD_LOGIC_VECTOR(redist28_yip1_7_uid145_sincosTest_b_1_q(32 downto 7));

    -- twoToMiSiYip_uid137_sincosTest(BITSELECT,136)@8
    twoToMiSiYip_uid137_sincosTest_b <= STD_LOGIC_VECTOR(redist31_yip1_6_uid129_sincosTest_b_1_q(32 downto 6));

    -- xip1E_7_uid140_sincosTest(ADDSUB,139)@8
    xip1E_7_uid140_sincosTest_s <= xMSB_uid131_sincosTest_b;
    xip1E_7_uid140_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist32_xip1_6_uid128_sincosTest_b_1_q(32)) & redist32_xip1_6_uid128_sincosTest_b_1_q));
    xip1E_7_uid140_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 27 => twoToMiSiYip_uid137_sincosTest_b(26)) & twoToMiSiYip_uid137_sincosTest_b));
    xip1E_7_uid140_sincosTest_combproc: PROCESS (xip1E_7_uid140_sincosTest_a, xip1E_7_uid140_sincosTest_b, xip1E_7_uid140_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid140_sincosTest_s = "1") THEN
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) + SIGNED(xip1E_7_uid140_sincosTest_b));
        ELSE
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) - SIGNED(xip1E_7_uid140_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid140_sincosTest_q <= xip1E_7_uid140_sincosTest_o(33 downto 0);

    -- xip1_7_uid144_sincosTest(BITSELECT,143)@8
    xip1_7_uid144_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid140_sincosTest_q(32 downto 0));
    xip1_7_uid144_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_in(32 downto 0));

    -- redist29_xip1_7_uid144_sincosTest_b_1(DELAY,350)
    redist29_xip1_7_uid144_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid144_sincosTest_b, xout => redist29_xip1_7_uid144_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_8_uid156_sincosTest(ADDSUB,155)@9
    xip1E_8_uid156_sincosTest_s <= xMSB_uid147_sincosTest_b;
    xip1E_8_uid156_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist29_xip1_7_uid144_sincosTest_b_1_q(32)) & redist29_xip1_7_uid144_sincosTest_b_1_q));
    xip1E_8_uid156_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 26 => twoToMiSiYip_uid153_sincosTest_b(25)) & twoToMiSiYip_uid153_sincosTest_b));
    xip1E_8_uid156_sincosTest_combproc: PROCESS (xip1E_8_uid156_sincosTest_a, xip1E_8_uid156_sincosTest_b, xip1E_8_uid156_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid156_sincosTest_s = "1") THEN
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) + SIGNED(xip1E_8_uid156_sincosTest_b));
        ELSE
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) - SIGNED(xip1E_8_uid156_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_sincosTest_q <= xip1E_8_uid156_sincosTest_o(33 downto 0);

    -- xip1_8_uid160_sincosTest(BITSELECT,159)@9
    xip1_8_uid160_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid156_sincosTest_q(32 downto 0));
    xip1_8_uid160_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_in(32 downto 0));

    -- redist26_xip1_8_uid160_sincosTest_b_1(DELAY,347)
    redist26_xip1_8_uid160_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid160_sincosTest_b, xout => redist26_xip1_8_uid160_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid168_sincosTest(BITSELECT,167)@10
    twoToMiSiXip_uid168_sincosTest_b <= STD_LOGIC_VECTOR(redist26_xip1_8_uid160_sincosTest_b_1_q(32 downto 8));

    -- signOfSelectionSignal_uid149_sincosTest(LOGICAL,148)@9
    signOfSelectionSignal_uid149_sincosTest_q <= not (xMSB_uid147_sincosTest_b);

    -- twoToMiSiXip_uid152_sincosTest(BITSELECT,151)@9
    twoToMiSiXip_uid152_sincosTest_b <= STD_LOGIC_VECTOR(redist29_xip1_7_uid144_sincosTest_b_1_q(32 downto 7));

    -- yip1E_8_uid157_sincosTest(ADDSUB,156)@9
    yip1E_8_uid157_sincosTest_s <= signOfSelectionSignal_uid149_sincosTest_q;
    yip1E_8_uid157_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist28_yip1_7_uid145_sincosTest_b_1_q(32)) & redist28_yip1_7_uid145_sincosTest_b_1_q));
    yip1E_8_uid157_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 26 => twoToMiSiXip_uid152_sincosTest_b(25)) & twoToMiSiXip_uid152_sincosTest_b));
    yip1E_8_uid157_sincosTest_combproc: PROCESS (yip1E_8_uid157_sincosTest_a, yip1E_8_uid157_sincosTest_b, yip1E_8_uid157_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid157_sincosTest_s = "1") THEN
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) + SIGNED(yip1E_8_uid157_sincosTest_b));
        ELSE
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) - SIGNED(yip1E_8_uid157_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_sincosTest_q <= yip1E_8_uid157_sincosTest_o(33 downto 0);

    -- yip1_8_uid161_sincosTest(BITSELECT,160)@9
    yip1_8_uid161_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_sincosTest_q(32 downto 0));
    yip1_8_uid161_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_in(32 downto 0));

    -- redist25_yip1_8_uid161_sincosTest_b_1(DELAY,346)
    redist25_yip1_8_uid161_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid161_sincosTest_b, xout => redist25_yip1_8_uid161_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_9_uid173_sincosTest(ADDSUB,172)@10
    yip1E_9_uid173_sincosTest_s <= signOfSelectionSignal_uid165_sincosTest_q;
    yip1E_9_uid173_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist25_yip1_8_uid161_sincosTest_b_1_q(32)) & redist25_yip1_8_uid161_sincosTest_b_1_q));
    yip1E_9_uid173_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => twoToMiSiXip_uid168_sincosTest_b(24)) & twoToMiSiXip_uid168_sincosTest_b));
    yip1E_9_uid173_sincosTest_combproc: PROCESS (yip1E_9_uid173_sincosTest_a, yip1E_9_uid173_sincosTest_b, yip1E_9_uid173_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid173_sincosTest_s = "1") THEN
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) + SIGNED(yip1E_9_uid173_sincosTest_b));
        ELSE
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) - SIGNED(yip1E_9_uid173_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid173_sincosTest_q <= yip1E_9_uid173_sincosTest_o(33 downto 0);

    -- yip1_9_uid180_sincosTest(BITSELECT,179)@10
    yip1_9_uid180_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid173_sincosTest_q(32 downto 0));
    yip1_9_uid180_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid180_sincosTest_in(32 downto 0));

    -- redist22_yip1_9_uid180_sincosTest_b_1(DELAY,343)
    redist22_yip1_9_uid180_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_9_uid180_sincosTest_b, xout => redist22_yip1_9_uid180_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid188_sincosTest(BITSELECT,187)@11
    twoToMiSiYip_uid188_sincosTest_b <= STD_LOGIC_VECTOR(redist22_yip1_9_uid180_sincosTest_b_1_q(32 downto 9));

    -- twoToMiSiYip_uid169_sincosTest(BITSELECT,168)@10
    twoToMiSiYip_uid169_sincosTest_b <= STD_LOGIC_VECTOR(redist25_yip1_8_uid161_sincosTest_b_1_q(32 downto 8));

    -- xip1E_9_uid172_sincosTest(ADDSUB,171)@10
    xip1E_9_uid172_sincosTest_s <= xMSB_uid163_sincosTest_b;
    xip1E_9_uid172_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist26_xip1_8_uid160_sincosTest_b_1_q(32)) & redist26_xip1_8_uid160_sincosTest_b_1_q));
    xip1E_9_uid172_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 25 => twoToMiSiYip_uid169_sincosTest_b(24)) & twoToMiSiYip_uid169_sincosTest_b));
    xip1E_9_uid172_sincosTest_combproc: PROCESS (xip1E_9_uid172_sincosTest_a, xip1E_9_uid172_sincosTest_b, xip1E_9_uid172_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid172_sincosTest_s = "1") THEN
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) + SIGNED(xip1E_9_uid172_sincosTest_b));
        ELSE
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) - SIGNED(xip1E_9_uid172_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid172_sincosTest_q <= xip1E_9_uid172_sincosTest_o(33 downto 0);

    -- xip1_9_uid179_sincosTest(BITSELECT,178)@10
    xip1_9_uid179_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid172_sincosTest_q(32 downto 0));
    xip1_9_uid179_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid179_sincosTest_in(32 downto 0));

    -- redist23_xip1_9_uid179_sincosTest_b_1(DELAY,344)
    redist23_xip1_9_uid179_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_9_uid179_sincosTest_b, xout => redist23_xip1_9_uid179_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_10_uid191_sincosTest(ADDSUB,190)@11
    xip1E_10_uid191_sincosTest_s <= xMSB_uid182_sincosTest_b;
    xip1E_10_uid191_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist23_xip1_9_uid179_sincosTest_b_1_q(32)) & redist23_xip1_9_uid179_sincosTest_b_1_q));
    xip1E_10_uid191_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => twoToMiSiYip_uid188_sincosTest_b(23)) & twoToMiSiYip_uid188_sincosTest_b));
    xip1E_10_uid191_sincosTest_combproc: PROCESS (xip1E_10_uid191_sincosTest_a, xip1E_10_uid191_sincosTest_b, xip1E_10_uid191_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid191_sincosTest_s = "1") THEN
            xip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid191_sincosTest_a) + SIGNED(xip1E_10_uid191_sincosTest_b));
        ELSE
            xip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid191_sincosTest_a) - SIGNED(xip1E_10_uid191_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid191_sincosTest_q <= xip1E_10_uid191_sincosTest_o(33 downto 0);

    -- xip1_10_uid198_sincosTest(BITSELECT,197)@11
    xip1_10_uid198_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid191_sincosTest_q(32 downto 0));
    xip1_10_uid198_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid198_sincosTest_in(32 downto 0));

    -- redist20_xip1_10_uid198_sincosTest_b_1(DELAY,341)
    redist20_xip1_10_uid198_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_10_uid198_sincosTest_b, xout => redist20_xip1_10_uid198_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid206_sincosTest(BITSELECT,205)@12
    twoToMiSiXip_uid206_sincosTest_b <= STD_LOGIC_VECTOR(redist20_xip1_10_uid198_sincosTest_b_1_q(32 downto 10));

    -- signOfSelectionSignal_uid184_sincosTest(LOGICAL,183)@11
    signOfSelectionSignal_uid184_sincosTest_q <= not (xMSB_uid182_sincosTest_b);

    -- twoToMiSiXip_uid187_sincosTest(BITSELECT,186)@11
    twoToMiSiXip_uid187_sincosTest_b <= STD_LOGIC_VECTOR(redist23_xip1_9_uid179_sincosTest_b_1_q(32 downto 9));

    -- yip1E_10_uid192_sincosTest(ADDSUB,191)@11
    yip1E_10_uid192_sincosTest_s <= signOfSelectionSignal_uid184_sincosTest_q;
    yip1E_10_uid192_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist22_yip1_9_uid180_sincosTest_b_1_q(32)) & redist22_yip1_9_uid180_sincosTest_b_1_q));
    yip1E_10_uid192_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 24 => twoToMiSiXip_uid187_sincosTest_b(23)) & twoToMiSiXip_uid187_sincosTest_b));
    yip1E_10_uid192_sincosTest_combproc: PROCESS (yip1E_10_uid192_sincosTest_a, yip1E_10_uid192_sincosTest_b, yip1E_10_uid192_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid192_sincosTest_s = "1") THEN
            yip1E_10_uid192_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid192_sincosTest_a) + SIGNED(yip1E_10_uid192_sincosTest_b));
        ELSE
            yip1E_10_uid192_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid192_sincosTest_a) - SIGNED(yip1E_10_uid192_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid192_sincosTest_q <= yip1E_10_uid192_sincosTest_o(33 downto 0);

    -- yip1_10_uid199_sincosTest(BITSELECT,198)@11
    yip1_10_uid199_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid192_sincosTest_q(32 downto 0));
    yip1_10_uid199_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid199_sincosTest_in(32 downto 0));

    -- redist19_yip1_10_uid199_sincosTest_b_1(DELAY,340)
    redist19_yip1_10_uid199_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_10_uid199_sincosTest_b, xout => redist19_yip1_10_uid199_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_11_uid211_sincosTest(ADDSUB,210)@12
    yip1E_11_uid211_sincosTest_s <= signOfSelectionSignal_uid203_sincosTest_q;
    yip1E_11_uid211_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist19_yip1_10_uid199_sincosTest_b_1_q(32)) & redist19_yip1_10_uid199_sincosTest_b_1_q));
    yip1E_11_uid211_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 23 => twoToMiSiXip_uid206_sincosTest_b(22)) & twoToMiSiXip_uid206_sincosTest_b));
    yip1E_11_uid211_sincosTest_combproc: PROCESS (yip1E_11_uid211_sincosTest_a, yip1E_11_uid211_sincosTest_b, yip1E_11_uid211_sincosTest_s)
    BEGIN
        IF (yip1E_11_uid211_sincosTest_s = "1") THEN
            yip1E_11_uid211_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid211_sincosTest_a) + SIGNED(yip1E_11_uid211_sincosTest_b));
        ELSE
            yip1E_11_uid211_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid211_sincosTest_a) - SIGNED(yip1E_11_uid211_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid211_sincosTest_q <= yip1E_11_uid211_sincosTest_o(33 downto 0);

    -- yip1_11_uid218_sincosTest(BITSELECT,217)@12
    yip1_11_uid218_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid211_sincosTest_q(32 downto 0));
    yip1_11_uid218_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid218_sincosTest_in(32 downto 0));

    -- redist16_yip1_11_uid218_sincosTest_b_1(DELAY,337)
    redist16_yip1_11_uid218_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid218_sincosTest_b, xout => redist16_yip1_11_uid218_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid226_sincosTest(BITSELECT,225)@13
    twoToMiSiYip_uid226_sincosTest_b <= STD_LOGIC_VECTOR(redist16_yip1_11_uid218_sincosTest_b_1_q(32 downto 11));

    -- twoToMiSiYip_uid207_sincosTest(BITSELECT,206)@12
    twoToMiSiYip_uid207_sincosTest_b <= STD_LOGIC_VECTOR(redist19_yip1_10_uid199_sincosTest_b_1_q(32 downto 10));

    -- xip1E_11_uid210_sincosTest(ADDSUB,209)@12
    xip1E_11_uid210_sincosTest_s <= xMSB_uid201_sincosTest_b;
    xip1E_11_uid210_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist20_xip1_10_uid198_sincosTest_b_1_q(32)) & redist20_xip1_10_uid198_sincosTest_b_1_q));
    xip1E_11_uid210_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 23 => twoToMiSiYip_uid207_sincosTest_b(22)) & twoToMiSiYip_uid207_sincosTest_b));
    xip1E_11_uid210_sincosTest_combproc: PROCESS (xip1E_11_uid210_sincosTest_a, xip1E_11_uid210_sincosTest_b, xip1E_11_uid210_sincosTest_s)
    BEGIN
        IF (xip1E_11_uid210_sincosTest_s = "1") THEN
            xip1E_11_uid210_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid210_sincosTest_a) + SIGNED(xip1E_11_uid210_sincosTest_b));
        ELSE
            xip1E_11_uid210_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid210_sincosTest_a) - SIGNED(xip1E_11_uid210_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid210_sincosTest_q <= xip1E_11_uid210_sincosTest_o(33 downto 0);

    -- xip1_11_uid217_sincosTest(BITSELECT,216)@12
    xip1_11_uid217_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid210_sincosTest_q(32 downto 0));
    xip1_11_uid217_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid217_sincosTest_in(32 downto 0));

    -- redist17_xip1_11_uid217_sincosTest_b_1(DELAY,338)
    redist17_xip1_11_uid217_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid217_sincosTest_b, xout => redist17_xip1_11_uid217_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_12_uid229_sincosTest(ADDSUB,228)@13
    xip1E_12_uid229_sincosTest_s <= xMSB_uid220_sincosTest_b;
    xip1E_12_uid229_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist17_xip1_11_uid217_sincosTest_b_1_q(32)) & redist17_xip1_11_uid217_sincosTest_b_1_q));
    xip1E_12_uid229_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 22 => twoToMiSiYip_uid226_sincosTest_b(21)) & twoToMiSiYip_uid226_sincosTest_b));
    xip1E_12_uid229_sincosTest_combproc: PROCESS (xip1E_12_uid229_sincosTest_a, xip1E_12_uid229_sincosTest_b, xip1E_12_uid229_sincosTest_s)
    BEGIN
        IF (xip1E_12_uid229_sincosTest_s = "1") THEN
            xip1E_12_uid229_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid229_sincosTest_a) + SIGNED(xip1E_12_uid229_sincosTest_b));
        ELSE
            xip1E_12_uid229_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid229_sincosTest_a) - SIGNED(xip1E_12_uid229_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid229_sincosTest_q <= xip1E_12_uid229_sincosTest_o(33 downto 0);

    -- xip1_12_uid236_sincosTest(BITSELECT,235)@13
    xip1_12_uid236_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid229_sincosTest_q(32 downto 0));
    xip1_12_uid236_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid236_sincosTest_in(32 downto 0));

    -- redist14_xip1_12_uid236_sincosTest_b_1(DELAY,335)
    redist14_xip1_12_uid236_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid236_sincosTest_b, xout => redist14_xip1_12_uid236_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid244_sincosTest(BITSELECT,243)@14
    twoToMiSiXip_uid244_sincosTest_b <= STD_LOGIC_VECTOR(redist14_xip1_12_uid236_sincosTest_b_1_q(32 downto 12));

    -- signOfSelectionSignal_uid222_sincosTest(LOGICAL,221)@13
    signOfSelectionSignal_uid222_sincosTest_q <= not (xMSB_uid220_sincosTest_b);

    -- twoToMiSiXip_uid225_sincosTest(BITSELECT,224)@13
    twoToMiSiXip_uid225_sincosTest_b <= STD_LOGIC_VECTOR(redist17_xip1_11_uid217_sincosTest_b_1_q(32 downto 11));

    -- yip1E_12_uid230_sincosTest(ADDSUB,229)@13
    yip1E_12_uid230_sincosTest_s <= signOfSelectionSignal_uid222_sincosTest_q;
    yip1E_12_uid230_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist16_yip1_11_uid218_sincosTest_b_1_q(32)) & redist16_yip1_11_uid218_sincosTest_b_1_q));
    yip1E_12_uid230_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 22 => twoToMiSiXip_uid225_sincosTest_b(21)) & twoToMiSiXip_uid225_sincosTest_b));
    yip1E_12_uid230_sincosTest_combproc: PROCESS (yip1E_12_uid230_sincosTest_a, yip1E_12_uid230_sincosTest_b, yip1E_12_uid230_sincosTest_s)
    BEGIN
        IF (yip1E_12_uid230_sincosTest_s = "1") THEN
            yip1E_12_uid230_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid230_sincosTest_a) + SIGNED(yip1E_12_uid230_sincosTest_b));
        ELSE
            yip1E_12_uid230_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid230_sincosTest_a) - SIGNED(yip1E_12_uid230_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid230_sincosTest_q <= yip1E_12_uid230_sincosTest_o(33 downto 0);

    -- yip1_12_uid237_sincosTest(BITSELECT,236)@13
    yip1_12_uid237_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid230_sincosTest_q(32 downto 0));
    yip1_12_uid237_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid237_sincosTest_in(32 downto 0));

    -- redist13_yip1_12_uid237_sincosTest_b_1(DELAY,334)
    redist13_yip1_12_uid237_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid237_sincosTest_b, xout => redist13_yip1_12_uid237_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_13_uid249_sincosTest(ADDSUB,248)@14
    yip1E_13_uid249_sincosTest_s <= signOfSelectionSignal_uid241_sincosTest_q;
    yip1E_13_uid249_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist13_yip1_12_uid237_sincosTest_b_1_q(32)) & redist13_yip1_12_uid237_sincosTest_b_1_q));
    yip1E_13_uid249_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 21 => twoToMiSiXip_uid244_sincosTest_b(20)) & twoToMiSiXip_uid244_sincosTest_b));
    yip1E_13_uid249_sincosTest_combproc: PROCESS (yip1E_13_uid249_sincosTest_a, yip1E_13_uid249_sincosTest_b, yip1E_13_uid249_sincosTest_s)
    BEGIN
        IF (yip1E_13_uid249_sincosTest_s = "1") THEN
            yip1E_13_uid249_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid249_sincosTest_a) + SIGNED(yip1E_13_uid249_sincosTest_b));
        ELSE
            yip1E_13_uid249_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid249_sincosTest_a) - SIGNED(yip1E_13_uid249_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid249_sincosTest_q <= yip1E_13_uid249_sincosTest_o(33 downto 0);

    -- yip1_13_uid256_sincosTest(BITSELECT,255)@14
    yip1_13_uid256_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid249_sincosTest_q(32 downto 0));
    yip1_13_uid256_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid256_sincosTest_in(32 downto 0));

    -- redist10_yip1_13_uid256_sincosTest_b_1(DELAY,331)
    redist10_yip1_13_uid256_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_13_uid256_sincosTest_b, xout => redist10_yip1_13_uid256_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid264_sincosTest(BITSELECT,263)@15
    twoToMiSiYip_uid264_sincosTest_b <= STD_LOGIC_VECTOR(redist10_yip1_13_uid256_sincosTest_b_1_q(32 downto 13));

    -- twoToMiSiYip_uid245_sincosTest(BITSELECT,244)@14
    twoToMiSiYip_uid245_sincosTest_b <= STD_LOGIC_VECTOR(redist13_yip1_12_uid237_sincosTest_b_1_q(32 downto 12));

    -- xip1E_13_uid248_sincosTest(ADDSUB,247)@14
    xip1E_13_uid248_sincosTest_s <= xMSB_uid239_sincosTest_b;
    xip1E_13_uid248_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist14_xip1_12_uid236_sincosTest_b_1_q(32)) & redist14_xip1_12_uid236_sincosTest_b_1_q));
    xip1E_13_uid248_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 21 => twoToMiSiYip_uid245_sincosTest_b(20)) & twoToMiSiYip_uid245_sincosTest_b));
    xip1E_13_uid248_sincosTest_combproc: PROCESS (xip1E_13_uid248_sincosTest_a, xip1E_13_uid248_sincosTest_b, xip1E_13_uid248_sincosTest_s)
    BEGIN
        IF (xip1E_13_uid248_sincosTest_s = "1") THEN
            xip1E_13_uid248_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid248_sincosTest_a) + SIGNED(xip1E_13_uid248_sincosTest_b));
        ELSE
            xip1E_13_uid248_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid248_sincosTest_a) - SIGNED(xip1E_13_uid248_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid248_sincosTest_q <= xip1E_13_uid248_sincosTest_o(33 downto 0);

    -- xip1_13_uid255_sincosTest(BITSELECT,254)@14
    xip1_13_uid255_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_13_uid248_sincosTest_q(32 downto 0));
    xip1_13_uid255_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid255_sincosTest_in(32 downto 0));

    -- redist11_xip1_13_uid255_sincosTest_b_1(DELAY,332)
    redist11_xip1_13_uid255_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_13_uid255_sincosTest_b, xout => redist11_xip1_13_uid255_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_14_uid267_sincosTest(ADDSUB,266)@15
    xip1E_14_uid267_sincosTest_s <= xMSB_uid258_sincosTest_b;
    xip1E_14_uid267_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist11_xip1_13_uid255_sincosTest_b_1_q(32)) & redist11_xip1_13_uid255_sincosTest_b_1_q));
    xip1E_14_uid267_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 20 => twoToMiSiYip_uid264_sincosTest_b(19)) & twoToMiSiYip_uid264_sincosTest_b));
    xip1E_14_uid267_sincosTest_combproc: PROCESS (xip1E_14_uid267_sincosTest_a, xip1E_14_uid267_sincosTest_b, xip1E_14_uid267_sincosTest_s)
    BEGIN
        IF (xip1E_14_uid267_sincosTest_s = "1") THEN
            xip1E_14_uid267_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid267_sincosTest_a) + SIGNED(xip1E_14_uid267_sincosTest_b));
        ELSE
            xip1E_14_uid267_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid267_sincosTest_a) - SIGNED(xip1E_14_uid267_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid267_sincosTest_q <= xip1E_14_uid267_sincosTest_o(33 downto 0);

    -- xip1_14_uid274_sincosTest(BITSELECT,273)@15
    xip1_14_uid274_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_14_uid267_sincosTest_q(32 downto 0));
    xip1_14_uid274_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid274_sincosTest_in(32 downto 0));

    -- redist8_xip1_14_uid274_sincosTest_b_1(DELAY,329)
    redist8_xip1_14_uid274_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_14_uid274_sincosTest_b, xout => redist8_xip1_14_uid274_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid282_sincosTest(BITSELECT,281)@16
    twoToMiSiXip_uid282_sincosTest_b <= STD_LOGIC_VECTOR(redist8_xip1_14_uid274_sincosTest_b_1_q(32 downto 14));

    -- signOfSelectionSignal_uid260_sincosTest(LOGICAL,259)@15
    signOfSelectionSignal_uid260_sincosTest_q <= not (xMSB_uid258_sincosTest_b);

    -- twoToMiSiXip_uid263_sincosTest(BITSELECT,262)@15
    twoToMiSiXip_uid263_sincosTest_b <= STD_LOGIC_VECTOR(redist11_xip1_13_uid255_sincosTest_b_1_q(32 downto 13));

    -- yip1E_14_uid268_sincosTest(ADDSUB,267)@15
    yip1E_14_uid268_sincosTest_s <= signOfSelectionSignal_uid260_sincosTest_q;
    yip1E_14_uid268_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist10_yip1_13_uid256_sincosTest_b_1_q(32)) & redist10_yip1_13_uid256_sincosTest_b_1_q));
    yip1E_14_uid268_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 20 => twoToMiSiXip_uid263_sincosTest_b(19)) & twoToMiSiXip_uid263_sincosTest_b));
    yip1E_14_uid268_sincosTest_combproc: PROCESS (yip1E_14_uid268_sincosTest_a, yip1E_14_uid268_sincosTest_b, yip1E_14_uid268_sincosTest_s)
    BEGIN
        IF (yip1E_14_uid268_sincosTest_s = "1") THEN
            yip1E_14_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid268_sincosTest_a) + SIGNED(yip1E_14_uid268_sincosTest_b));
        ELSE
            yip1E_14_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid268_sincosTest_a) - SIGNED(yip1E_14_uid268_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_14_uid268_sincosTest_q <= yip1E_14_uid268_sincosTest_o(33 downto 0);

    -- yip1_14_uid275_sincosTest(BITSELECT,274)@15
    yip1_14_uid275_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_14_uid268_sincosTest_q(32 downto 0));
    yip1_14_uid275_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid275_sincosTest_in(32 downto 0));

    -- redist7_yip1_14_uid275_sincosTest_b_1(DELAY,328)
    redist7_yip1_14_uid275_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_14_uid275_sincosTest_b, xout => redist7_yip1_14_uid275_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_15_uid287_sincosTest(ADDSUB,286)@16
    yip1E_15_uid287_sincosTest_s <= signOfSelectionSignal_uid279_sincosTest_q;
    yip1E_15_uid287_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist7_yip1_14_uid275_sincosTest_b_1_q(32)) & redist7_yip1_14_uid275_sincosTest_b_1_q));
    yip1E_15_uid287_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 19 => twoToMiSiXip_uid282_sincosTest_b(18)) & twoToMiSiXip_uid282_sincosTest_b));
    yip1E_15_uid287_sincosTest_combproc: PROCESS (yip1E_15_uid287_sincosTest_a, yip1E_15_uid287_sincosTest_b, yip1E_15_uid287_sincosTest_s)
    BEGIN
        IF (yip1E_15_uid287_sincosTest_s = "1") THEN
            yip1E_15_uid287_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid287_sincosTest_a) + SIGNED(yip1E_15_uid287_sincosTest_b));
        ELSE
            yip1E_15_uid287_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid287_sincosTest_a) - SIGNED(yip1E_15_uid287_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_15_uid287_sincosTest_q <= yip1E_15_uid287_sincosTest_o(33 downto 0);

    -- yip1_15_uid294_sincosTest(BITSELECT,293)@16
    yip1_15_uid294_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_15_uid287_sincosTest_q(32 downto 0));
    yip1_15_uid294_sincosTest_b <= STD_LOGIC_VECTOR(yip1_15_uid294_sincosTest_in(32 downto 0));

    -- ySumPreRnd_uid300_sincosTest(BITSELECT,299)@16
    ySumPreRnd_uid300_sincosTest_in <= yip1_15_uid294_sincosTest_b(31 downto 0);
    ySumPreRnd_uid300_sincosTest_b <= ySumPreRnd_uid300_sincosTest_in(31 downto 16);

    -- redist4_ySumPreRnd_uid300_sincosTest_b_1(DELAY,325)
    redist4_ySumPreRnd_uid300_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ySumPreRnd_uid300_sincosTest_b, xout => redist4_ySumPreRnd_uid300_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- ySumPostRnd_uid303_sincosTest(ADD,302)@17
    ySumPostRnd_uid303_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist4_ySumPreRnd_uid300_sincosTest_b_1_q);
    ySumPostRnd_uid303_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    ySumPostRnd_uid303_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid303_sincosTest_a) + UNSIGNED(ySumPostRnd_uid303_sincosTest_b));
    ySumPostRnd_uid303_sincosTest_q <= ySumPostRnd_uid303_sincosTest_o(16 downto 0);

    -- yPostExc_uid305_sincosTest(BITSELECT,304)@17
    yPostExc_uid305_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid303_sincosTest_q(15 downto 0));
    yPostExc_uid305_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid305_sincosTest_in(15 downto 1));

    -- redist2_yPostExc_uid305_sincosTest_b_1(DELAY,323)
    redist2_yPostExc_uid305_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPostExc_uid305_sincosTest_b, xout => redist2_yPostExc_uid305_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- cstZeroForAddSub_uid313_sincosTest(CONSTANT,312)
    cstZeroForAddSub_uid313_sincosTest_q <= "000000000000000";

    -- sinPostNeg_uid315_sincosTest(ADDSUB,314)@18
    sinPostNeg_uid315_sincosTest_s <= invSinNegCond_uid314_sincosTest_q;
    sinPostNeg_uid315_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => cstZeroForAddSub_uid313_sincosTest_q(14)) & cstZeroForAddSub_uid313_sincosTest_q));
    sinPostNeg_uid315_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist2_yPostExc_uid305_sincosTest_b_1_q(14)) & redist2_yPostExc_uid305_sincosTest_b_1_q));
    sinPostNeg_uid315_sincosTest_combproc: PROCESS (sinPostNeg_uid315_sincosTest_a, sinPostNeg_uid315_sincosTest_b, sinPostNeg_uid315_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid315_sincosTest_s = "1") THEN
            sinPostNeg_uid315_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid315_sincosTest_a) + SIGNED(sinPostNeg_uid315_sincosTest_b));
        ELSE
            sinPostNeg_uid315_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid315_sincosTest_a) - SIGNED(sinPostNeg_uid315_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid315_sincosTest_q <= sinPostNeg_uid315_sincosTest_o(15 downto 0);

    -- invCosNegCond_uid316_sincosTest(LOGICAL,315)@2 + 1
    invCosNegCond_uid316_sincosTest_qi <= not (sinNegCond2_uid307_sincosTest_q);
    invCosNegCond_uid316_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid316_sincosTest_qi, xout => invCosNegCond_uid316_sincosTest_q, clk => clk, aclr => areset );

    -- redist0_invCosNegCond_uid316_sincosTest_q_16(DELAY,321)
    redist0_invCosNegCond_uid316_sincosTest_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 15, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid316_sincosTest_q, xout => redist0_invCosNegCond_uid316_sincosTest_q_16_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid283_sincosTest(BITSELECT,282)@16
    twoToMiSiYip_uid283_sincosTest_b <= STD_LOGIC_VECTOR(redist7_yip1_14_uid275_sincosTest_b_1_q(32 downto 14));

    -- xip1E_15_uid286_sincosTest(ADDSUB,285)@16
    xip1E_15_uid286_sincosTest_s <= redist6_xMSB_uid277_sincosTest_b_1_q;
    xip1E_15_uid286_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist8_xip1_14_uid274_sincosTest_b_1_q(32)) & redist8_xip1_14_uid274_sincosTest_b_1_q));
    xip1E_15_uid286_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 19 => twoToMiSiYip_uid283_sincosTest_b(18)) & twoToMiSiYip_uid283_sincosTest_b));
    xip1E_15_uid286_sincosTest_combproc: PROCESS (xip1E_15_uid286_sincosTest_a, xip1E_15_uid286_sincosTest_b, xip1E_15_uid286_sincosTest_s)
    BEGIN
        IF (xip1E_15_uid286_sincosTest_s = "1") THEN
            xip1E_15_uid286_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid286_sincosTest_a) + SIGNED(xip1E_15_uid286_sincosTest_b));
        ELSE
            xip1E_15_uid286_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid286_sincosTest_a) - SIGNED(xip1E_15_uid286_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_15_uid286_sincosTest_q <= xip1E_15_uid286_sincosTest_o(33 downto 0);

    -- xip1_15_uid293_sincosTest(BITSELECT,292)@16
    xip1_15_uid293_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_15_uid286_sincosTest_q(32 downto 0));
    xip1_15_uid293_sincosTest_b <= STD_LOGIC_VECTOR(xip1_15_uid293_sincosTest_in(32 downto 0));

    -- xSumPreRnd_uid296_sincosTest(BITSELECT,295)@16
    xSumPreRnd_uid296_sincosTest_in <= xip1_15_uid293_sincosTest_b(31 downto 0);
    xSumPreRnd_uid296_sincosTest_b <= xSumPreRnd_uid296_sincosTest_in(31 downto 16);

    -- redist5_xSumPreRnd_uid296_sincosTest_b_1(DELAY,326)
    redist5_xSumPreRnd_uid296_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xSumPreRnd_uid296_sincosTest_b, xout => redist5_xSumPreRnd_uid296_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xSumPostRnd_uid299_sincosTest(ADD,298)@17
    xSumPostRnd_uid299_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist5_xSumPreRnd_uid296_sincosTest_b_1_q);
    xSumPostRnd_uid299_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000" & VCC_q);
    xSumPostRnd_uid299_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid299_sincosTest_a) + UNSIGNED(xSumPostRnd_uid299_sincosTest_b));
    xSumPostRnd_uid299_sincosTest_q <= xSumPostRnd_uid299_sincosTest_o(16 downto 0);

    -- xPostExc_uid304_sincosTest(BITSELECT,303)@17
    xPostExc_uid304_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid299_sincosTest_q(15 downto 0));
    xPostExc_uid304_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid304_sincosTest_in(15 downto 1));

    -- redist3_xPostExc_uid304_sincosTest_b_1(DELAY,324)
    redist3_xPostExc_uid304_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xPostExc_uid304_sincosTest_b, xout => redist3_xPostExc_uid304_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- cosPostNeg_uid317_sincosTest(ADDSUB,316)@18
    cosPostNeg_uid317_sincosTest_s <= redist0_invCosNegCond_uid316_sincosTest_q_16_q;
    cosPostNeg_uid317_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => cstZeroForAddSub_uid313_sincosTest_q(14)) & cstZeroForAddSub_uid313_sincosTest_q));
    cosPostNeg_uid317_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist3_xPostExc_uid304_sincosTest_b_1_q(14)) & redist3_xPostExc_uid304_sincosTest_b_1_q));
    cosPostNeg_uid317_sincosTest_combproc: PROCESS (cosPostNeg_uid317_sincosTest_a, cosPostNeg_uid317_sincosTest_b, cosPostNeg_uid317_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid317_sincosTest_s = "1") THEN
            cosPostNeg_uid317_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid317_sincosTest_a) + SIGNED(cosPostNeg_uid317_sincosTest_b));
        ELSE
            cosPostNeg_uid317_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid317_sincosTest_a) - SIGNED(cosPostNeg_uid317_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid317_sincosTest_q <= cosPostNeg_uid317_sincosTest_o(15 downto 0);

    -- redist47_firstQuadrant_uid15_sincosTest_b_17(DELAY,368)
    redist47_firstQuadrant_uid15_sincosTest_b_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 16, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist46_firstQuadrant_uid15_sincosTest_b_1_q, xout => redist47_firstQuadrant_uid15_sincosTest_b_17_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid319_sincosTest(MUX,318)@18
    xPostRR_uid319_sincosTest_s <= redist47_firstQuadrant_uid15_sincosTest_b_17_q;
    xPostRR_uid319_sincosTest_combproc: PROCESS (xPostRR_uid319_sincosTest_s, cosPostNeg_uid317_sincosTest_q, sinPostNeg_uid315_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid319_sincosTest_s) IS
            WHEN "0" => xPostRR_uid319_sincosTest_q <= cosPostNeg_uid317_sincosTest_q;
            WHEN "1" => xPostRR_uid319_sincosTest_q <= sinPostNeg_uid315_sincosTest_q;
            WHEN OTHERS => xPostRR_uid319_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid321_sincosTest(BITSELECT,320)@18
    sin_uid321_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid319_sincosTest_q(14 downto 0));
    sin_uid321_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid321_sincosTest_in(14 downto 0));

    -- xPostRR_uid318_sincosTest(MUX,317)@18
    xPostRR_uid318_sincosTest_s <= redist47_firstQuadrant_uid15_sincosTest_b_17_q;
    xPostRR_uid318_sincosTest_combproc: PROCESS (xPostRR_uid318_sincosTest_s, sinPostNeg_uid315_sincosTest_q, cosPostNeg_uid317_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid318_sincosTest_s) IS
            WHEN "0" => xPostRR_uid318_sincosTest_q <= sinPostNeg_uid315_sincosTest_q;
            WHEN "1" => xPostRR_uid318_sincosTest_q <= cosPostNeg_uid317_sincosTest_q;
            WHEN OTHERS => xPostRR_uid318_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid320_sincosTest(BITSELECT,319)@18
    cos_uid320_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid318_sincosTest_q(14 downto 0));
    cos_uid320_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid320_sincosTest_in(14 downto 0));

    -- xOut(GPOUT,4)@18
    c <= cos_uid320_sincosTest_b;
    s <= sin_uid321_sincosTest_b;

END normal;
