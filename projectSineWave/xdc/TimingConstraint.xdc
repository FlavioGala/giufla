#-----------------------------------------------------------------------------------------------------
#                               University of Torino - Department of Physics
#                                   via Giuria 1 10125, Torino, Italy
#-----------------------------------------------------------------------------------------------------
# [Filename]       TimingConstraint.xdc
# [Project]        Advanced Electronics Laboratory course
# [Author]         Giulia e Flavio
# [Language]       Xilinx Design Constraints (XDC) Tcl commands
# [Created]        May 13, 2020
# [Modified]       -
# [Description]    Implementation constraints for Sine Wave Generator module.
#
# [Notes]          All pin positions and electrical properties refer to the Digilent Arty A7
#                  development board. The complete .xdc file can be downloaded from official
#                  Digilent GitHub repository at :
#
#                     https://github.com/Digilent/Arty/blob/master/Resources/XDC/Arty_Master.xdc
#
#                  To find actual physical locations of pins on the board, please check Arty
#                  reference board schematics :
#
#                     https://reference.digilentinc.com/_media/arty:arty_sch.pdf
#
# [Version]        1.0
# [Revisions]      13.05.2020 - Created
#-----------------------------------------------------------------------------------------------------



##############################################
##   physical constraints (ports mapping)   ##
##############################################

## on-board 100 MHz clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]


## slide switch
set_property -dict { PACKAGE_PIN A8   IOSTANDARD LVCMOS33 } [get_ports sine]


## PMOD Header JB
#set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports SI]
#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports SO]


###########################################
##   timing and electrical constraints   ##
###########################################

## just for reference, the default unit of capacitance is pF, but can be changed using the set_units command
set_units -capacitance pF

## on-board 100 MHz clock (default time unit in XDC is ns)
create_clock -period 10.000 -name clk_100 -waveform {0.000 5.000} -add [get_ports clk] ;   ## reg2reg timing paths

## **WARN: the load capacitance is used during power analysis when running the report_power command, but is not used during timing analysis
set_load 20 [all_outputs]

## output delay 
set_output_delay 10.0 -clock clk_100 [get_ports sine]







