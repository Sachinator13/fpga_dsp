transcript on
if ![file isdirectory audio_feed_iputf_libs] {
	file mkdir audio_feed_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/dspba_library_package.vhd"                      
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/dspba_library.vhd"                              
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_math_pkg_hpfir.vhd"                   
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_lib_pkg_hpfir.vhd"                    
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"      
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"    
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/auk_dspip_roundsat_hpfir.vhd"                   
vlog "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/altera_avalon_sc_fifo.v"                        
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/tryingfil_rtl_core.vhd"                         
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/tryingfil_ast.vhd"                              
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/tryingfil.vhd"                                  
vcom "C:/repos/fpga_dsp/audio_sdram/tryingfil_sim/tryingfil_tb.vhd"                               
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/dspba_library_package.vhd"                      
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/dspba_library.vhd"                              
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_math_pkg_hpfir.vhd"                   
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_lib_pkg_hpfir.vhd"                    
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"      
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"    
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/auk_dspip_roundsat_hpfir.vhd"                   
vlog "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/altera_avalon_sc_fifo.v"                        
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/filter_48_rtl_core.vhd"                         
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/filter_48_ast.vhd"                              
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/filter_48.vhd"                                  
vcom "C:/repos/fpga_dsp/audio_sdram/filter_48_sim/filter_48_tb.vhd"                               

vlog -vlog01compat -work work +incdir+C:/repos/fpga_dsp/audio_sdram {C:/repos/fpga_dsp/audio_sdram/filter_48.vo}
vlib tryingfil
vmap tryingfil tryingfil
vlog -vlog01compat -work tryingfil +incdir+C:/repos/fpga_dsp/audio_sdram/tryingfil {C:/repos/fpga_dsp/audio_sdram/tryingfil/altera_avalon_sc_fifo.v}
vlog -sv -work work +incdir+C:/repos/fpga_dsp/audio_sdram {C:/repos/fpga_dsp/audio_sdram/nnew_fir_transposed.sv}
vlog -sv -work work +incdir+C:/repos/fpga_dsp/audio_sdram {C:/repos/fpga_dsp/audio_sdram/audio_sdram.sv}
vlog -sv -work work +incdir+C:/repos/fpga_dsp/audio_sdram {C:/repos/fpga_dsp/audio_sdram/fir.sv}
vlog -sv -work work +incdir+C:/repos/fpga_dsp/audio_sdram {C:/repos/fpga_dsp/audio_sdram/filter.sv}
vlib filter_48
vmap filter_48 filter_48
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/dspba_library_package.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_math_pkg_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_avalon_streaming_controller_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_roundsat_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/dspba_library.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_lib_pkg_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_avalon_streaming_source_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/filter_48_0002_rtl_core.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/auk_dspip_avalon_streaming_sink_hpfir.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/filter_48_0002_ast.vhd}
vcom -93 -work filter_48 {C:/repos/fpga_dsp/audio_sdram/filter_48/filter_48_0002.vhd}

