library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL; 

entity RTL_Blink_LED is
    port (
        -- Gloabals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
        fpga_led_pio  : out std_logic_vector(6 downto 0);
		  fpga_switch_pio  : in std_logic_vector(5 downto 0);
		  fpga_button_pio  : in std_logic_vector(5 downto 0)
		  
	);
	
	generic (
			global : number 
			
	);
end entity RTL_Blink_LED;

architecture rtl of RTL_Blink_LED is

-- signal
signal blink : std_logic := '0';
signal true_blink : std_logic := '0';


component RTL_Blink_LED_MAP IS
		port (
        -- Gloabals
        fpga_clk_50   : in  std_logic;        
		  
        -- I/Os
        fpga_led_pio  : out std_logic_vector(6 downto 0);
		  fpga_switch_pio  : in std_logic_vector(5 downto 0);
		  fpga_button_pio  : in std_logic_vector(5 downto 0)
		  
	);
	end component;
	
	

begin
  
  name : RTL_Blink_LED_MAP port map (fpga_clk_50, fpga_led_pio, fpga_switch_pio, fpga_button_pio);



end rtl;