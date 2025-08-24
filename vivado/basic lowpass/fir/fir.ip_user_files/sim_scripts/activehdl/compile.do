transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_utils_v3_0_14
vlib activehdl/c_reg_fd_v12_0_10
vlib activehdl/xbip_dsp48_wrapper_v3_0_7
vlib activehdl/xbip_pipe_v3_0_10
vlib activehdl/c_addsub_v12_0_20
vlib activehdl/mult_gen_v12_0_23
vlib activehdl/axi_utils_v2_0_10
vlib activehdl/cordic_v6_0_24
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_14 activehdl/xbip_utils_v3_0_14
vmap c_reg_fd_v12_0_10 activehdl/c_reg_fd_v12_0_10
vmap xbip_dsp48_wrapper_v3_0_7 activehdl/xbip_dsp48_wrapper_v3_0_7
vmap xbip_pipe_v3_0_10 activehdl/xbip_pipe_v3_0_10
vmap c_addsub_v12_0_20 activehdl/c_addsub_v12_0_20
vmap mult_gen_v12_0_23 activehdl/mult_gen_v12_0_23
vmap axi_utils_v2_0_10 activehdl/axi_utils_v2_0_10
vmap cordic_v6_0_24 activehdl/cordic_v6_0_24
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_14 -93  \
"../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_10 -93  \
"../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -93  \
"../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_10 -93  \
"../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_20 -93  \
"../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_23 -93  \
"../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_10 -93  \
"../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_24 -93  \
"../../ipstatic/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../fir.gen/sources_1/ip/cordic_0/sim/cordic_0.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" -l xbip_utils_v3_0_14 -l c_reg_fd_v12_0_10 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_10 -l c_addsub_v12_0_20 -l mult_gen_v12_0_23 -l axi_utils_v2_0_10 -l cordic_v6_0_24 -l xil_defaultlib \
"../../../MyStuff/fir.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" -l xbip_utils_v3_0_14 -l c_reg_fd_v12_0_10 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_10 -l c_addsub_v12_0_20 -l mult_gen_v12_0_23 -l axi_utils_v2_0_10 -l cordic_v6_0_24 -l xil_defaultlib \
"../../../MyStuff/fir_tb.v" \


vlog -work xil_defaultlib \
"glbl.v"

