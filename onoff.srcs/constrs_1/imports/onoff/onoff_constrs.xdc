
## Clock signal - Sets the on-board clock
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
##Buttons
set_property PACKAGE_PIN W19 [get_ports on]						
	set_property IOSTANDARD LVCMOS33 [get_ports on]
set_property PACKAGE_PIN T17 [get_ports off]						
	set_property IOSTANDARD LVCMOS33 [get_ports off]
	
# LEDs
set_property PACKAGE_PIN U16 [get_ports {led}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led}]
 