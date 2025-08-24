set_global_assignment -entity "coridc" -library "lib_coridc" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "coridc" -library "lib_coridc" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "coridc" -library "lib_coridc" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_coridc" -name SPD_FILE [file join $::quartus(sip_path) "../coridc.spd"]
set_global_assignment -library "lib_coridc" -name MISC_FILE [file join $::quartus(sip_path) "../../coridc.qsys"]

set_global_assignment -library "lib_coridc" -name MISC_FILE [file join $::quartus(sip_path) "coridc.v"]
set_global_assignment -library "lib_coridc" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_coridc" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_coridc" -name MISC_FILE [file join $::quartus(sip_path) "submodules/coridc_CORDIC_0.vhd"]
