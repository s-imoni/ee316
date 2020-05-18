# Clock signal - Uncomment if needed (will be used in future labs)
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
# Connects pin V17 (SW0 on the board) to input a in our gate module
set_property PACKAGE_PIN V17 [get_ports {b[0]}]	
# Sets the switch to use 3.3V logic				
	set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]    

# Connects pin V16 (SW1 on the board) to input b in our gate module
set_property PACKAGE_PIN V16 [get_ports {b[1]}]			
# Sets the switch to use 3.3V logic
	set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]    
	
set_property PACKAGE_PIN W16 [get_ports {b[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN W17 [get_ports {b[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]
set_property PACKAGE_PIN W15 [get_ports {a[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[0]}]
set_property PACKAGE_PIN V15 [get_ports {a[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[1]}]
set_property PACKAGE_PIN W14 [get_ports {a[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[2]}]
set_property PACKAGE_PIN W13 [get_ports {a[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {a[3]}]
set_property PACKAGE_PIN V2 [get_ports {Cin}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Cin}]

 

# LEDs
# Connects the output c in our gate module to pin U16 (LED0 on-board)		
set_property PACKAGE_PIN U16 [get_ports {total[0]}]	
# Sets the LED to use 3.3V logic		
	set_property IOSTANDARD LVCMOS33 [get_ports {total[0]}]    
	
set_property PACKAGE_PIN E19 [get_ports {total[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {total[1]}]
set_property PACKAGE_PIN U19 [get_ports {total[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {total[2]}]
set_property PACKAGE_PIN V19 [get_ports {total[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {total[3]}]
set_property PACKAGE_PIN W18 [get_ports {total[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {total[4]}]


#Buttons
set_property PACKAGE_PIN U18 [get_ports load]						
	set_property IOSTANDARD LVCMOS33 [get_ports load]




