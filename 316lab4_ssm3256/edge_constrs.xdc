## Clock signal 
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {SW0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SW0}]    


## LEDs	
set_property PACKAGE_PIN U16 [get_ports {LED0}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {LED0}]    
	

