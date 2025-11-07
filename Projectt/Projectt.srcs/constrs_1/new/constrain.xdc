###############################################################################
## Clock Constraints
###############################################################################
# Primary 50MHz clock (mapped to PL clock pin)
create_clock -name clk -period 20.0 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN K17 [get_ports clk]   # CLK pin for PL (50MHz oscillator):cite[6]

###############################################################################
## Reset Signal (Active-High)
###############################################################################
set_property IOSTANDARD LVCMOS18 [get_ports reset]
set_property PACKAGE_PIN D19 [get_ports reset]  # BTN0 (reset button):cite[1]

###############################################################################
## Data Input (Switch)
###############################################################################
set_property IOSTANDARD LVCMOS18 [get_ports data_in]
set_property PACKAGE_PIN M16 [get_ports data_in]  # SW0 (external input):cite[1]

###############################################################################
## Encoder Header (15-bit seed)
###############################################################################
# Header_enc[14:0] mapped to MIO pins (LVCMOS18)
set_property IOSTANDARD LVCMOS18 [get_ports {header_enc[*]}]
set_property PACKAGE_PIN C12 [get_ports {header_enc[0]}]   # MIO[49]
set_property PACKAGE_PIN B12 [get_ports {header_enc[1]}]   # MIO[48]
set_property PACKAGE_PIN B14 [get_ports {header_enc[2]}]   # MIO[47]
set_property PACKAGE_PIN D16 [get_ports {header_enc[3]}]   # MIO[46]
set_property PACKAGE_PIN B15 [get_ports {header_enc[4]}]   # MIO[45]
set_property PACKAGE_PIN F13 [get_ports {header_enc[5]}]   # MIO[44]
set_property PACKAGE_PIN A9  [get_ports {header_enc[6]}]   # MIO[43]
set_property PACKAGE_PIN E12 [get_ports {header_enc[7]}]   # MIO[42]
set_property PACKAGE_PIN C17 [get_ports {header_enc[8]}]   # MIO[41]
set_property PACKAGE_PIN D14 [get_ports {header_enc[9]}]   # MIO[40]
set_property PACKAGE_PIN C18 [get_ports {header_enc[10]}]  # MIO[39]
set_property PACKAGE_PIN B9  [get_ports {header_enc[11]}]  # MIO[51]
set_property PACKAGE_PIN C10 [get_ports {header_enc[12]}]  # MIO[52]
set_property PACKAGE_PIN C11 [get_ports {header_enc[13]}]  # MIO[53]
set_property PACKAGE_PIN B13 [get_ports {header_enc[14]}]  # MIO[50]

###############################################################################
## Decoder Header (15-bit seed)
###############################################################################
# Header_dec[14:0] mapped to remaining MIO/PL pins (LVCMOS18)
set_property IOSTANDARD LVCMOS18 [get_ports {header_dec[*]}]
set_property PACKAGE_PIN G12 [get_ports {header_dec[0]}]   # MIO[44]
set_property PACKAGE_PIN H13 [get_ports {header_dec[1]}]   # MIO[43]
set_property PACKAGE_PIN G14 [get_ports {header_dec[2]}]   # MIO[42]
set_property PACKAGE_PIN T14 [get_ports {header_dec[3]}]   # PL pin (Bank 34)
set_property PACKAGE_PIN T11 [get_ports {header_dec[4]}]   # PL pin (Bank 34)
set_property PACKAGE_PIN R14 [get_ports {header_dec[5]}]   # LED0 (Bank 35)
set_property PACKAGE_PIN R15 [get_ports {header_dec[6]}]   # LED1 (Bank 35)
set_property PACKAGE_PIN V10 [get_ports {header_dec[7]}]   # PL pin (Bank 35)
set_property PACKAGE_PIN V9  [get_ports {header_dec[8]}]   # PL pin (Bank 35)
set_property PACKAGE_PIN V8  [get_ports {header_dec[9]}]   # PL pin (Bank 35)
set_property PACKAGE_PIN W8  [get_ports {header_dec[10]}]  # PL pin (Bank 35)
set_property PACKAGE_PIN W11 [get_ports {header_dec[11]}]  # PL pin (Bank 35)
set_property PACKAGE_PIN W10 [get_ports {header_dec[12]}]  # PL pin (Bank 35)
set_property PACKAGE_PIN V12 [get_ports {header_dec[13]}]  # PL pin (Bank 35)
set_property PACKAGE_PIN U12 [get_ports {header_dec[14]}]  # PL pin (Bank 35)

###############################################################################
## Output Signals (LEDs for visualization)
###############################################################################
set_property IOSTANDARD LVCMOS33 [get_ports encoded_out]
set_property PACKAGE_PIN R14 [get_ports encoded_out]  # LED0 (Bank 35):cite[6]

set_property IOSTANDARD LVCMOS33 [get_ports decoded_out]
set_property PACKAGE_PIN R15 [get_ports decoded_out]  # LED1 (Bank 35):cite[6]

###############################################################################
## Timing Exceptions
###############################################################################
set_false_path -from [get_ports {header_enc[*]}]  # Static configuration
set_false_path -from [get_ports {header_dec[*]}]  # Static configuration