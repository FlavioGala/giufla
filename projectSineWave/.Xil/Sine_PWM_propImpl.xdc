set_property SRC_FILE_INFO {cfile:c:/Users/Garripoli/Desktop/giufla/projectSineWave/cores/PLL/PLL.xdc rfile:../cores/PLL/PLL.xdc id:1 order:EARLY scoped_inst:PLL_inst/inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/Garripoli/Desktop/giufla/projectSineWave/xdc/Sine_PWM_constraint.xdc rfile:../xdc/Sine_PWM_constraint.xdc id:2} [current_design]
current_instance PLL_inst/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
current_instance
set_property src_info {type:XDC file:2 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
set_property src_info {type:XDC file:2 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_units -capacitance pF
set_property src_info {type:XDC file:2 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 10.000 -name clk_100 -waveform {0.000 5.000} -add [get_ports clk] ;   ## reg2reg timing paths
set_property src_info {type:XDC file:2 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_load 20 [all_outputs]
set_property src_info {type:XDC file:2 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_input_delay 5.0 -clock clk100 [get_ports en]
