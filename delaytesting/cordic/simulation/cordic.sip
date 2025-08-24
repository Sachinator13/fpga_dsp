set_global_assignment -entity "cordic" -library "lib_cordic" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "cordic" -library "lib_cordic" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "cordic" -library "lib_cordic" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_cordic" -name SPD_FILE [file join $::quartus(sip_path) "../cordic.spd"]
set_global_assignment -library "lib_cordic" -name MISC_FILE [file join $::quartus(sip_path) "../../cordic.qsys"]

set_global_assignment -library "lib_cordic" -name MISC_FILE [file join $::quartus(sip_path) "cordic.v"]
set_global_assignment -library "lib_cordic" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_cordic" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_cordic" -name MISC_FILE [file join $::quartus(sip_path) "submodules/cordic_CORDIC_0.vhd"]
