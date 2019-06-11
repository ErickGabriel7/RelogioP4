set_global_assignment -entity "pll1m" -library "lib_pll1m" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll1m" -library "lib_pll1m" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "pll1m" -library "lib_pll1m" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll1m" -name SPD_FILE [file join $::quartus(sip_path) "pll1m.spd"]

set_global_assignment -library "lib_pll1m" -name MISC_FILE [file join $::quartus(sip_path) "pll1m_sim/pll1m.vho"]
