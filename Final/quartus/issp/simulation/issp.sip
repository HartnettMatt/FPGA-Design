set_global_assignment -entity "issp" -library "lib_issp" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "issp" -library "lib_issp" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "issp" -library "lib_issp" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_issp" -name SPD_FILE [file join $::quartus(sip_path) "../issp.spd"]
set_global_assignment -library "lib_issp" -name MISC_FILE [file join $::quartus(sip_path) "../../issp.qsys"]

set_global_assignment -library "lib_issp" -name MISC_FILE [file join $::quartus(sip_path) "issp.v"]
set_global_assignment -library "lib_issp" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altsource_probe.v"]
