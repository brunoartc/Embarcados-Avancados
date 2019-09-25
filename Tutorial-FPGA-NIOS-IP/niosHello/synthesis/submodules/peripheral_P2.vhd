library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.all;

entity peripheral_P2 is
    port (
      -- Gloabals
      clk                : in  std_logic                     := '0';             
      reset              : in  std_logic                     := '0';             

      PS2_CLK   : inout std_logic;                    -- ps2_clock signal inout;
      PS2_DAT   : inout std_logic;                    -- ps2_data  signal inout;


      -- Avalion Memmory Mapped Slave
      avs_address     : in  std_logic_vector(3 downto 0)  := (others => '0'); 
      avs_read        : in  std_logic                     := '0';             
      avs_readdata    : out std_logic_vector(31 downto 0) := (others => '0'); 
      avs_write       : in  std_logic                     := '0';             
      avs_writedata   : in  std_logic_vector(31 downto 0) := (others => '0')
    );


end entity peripheral_P2;



architecture rtl of peripheral_P2 is

  signal n_reset, iSTART, oLEFBUT, oRIGBUT, oMIDBUT  : std_logic;
  signal oX, oY : std_logic_vector(7 downto 0);
	component ps2 is
	  port(
		 iSTART    : in    std_logic;                    -- press the button for tranxrdb -merge .Xdefaultssmitting instrucions to device;
		 iRST_n    : in    std_logic;                    -- FSM reset signal;
		 iCLK_50   : in    std_logic;                    -- clock source;
		 PS2_CLK   : inout std_logic;                    -- ps2_clock signal inout;
		 PS2_DAT   : inout std_logic;                    -- ps2_data  signal inout;
		 oLEFBUT   : out   std_logic;                    -- left button press display;
		 oRIGBUT   : out   std_logic;                    -- right button press display;
		 oMIDBUT   : out   std_logic;                    -- middle button press display;
		 oX        : out   std_logic_vector(7 downto 0); -- X axis.
		 oY        : out   std_logic_vector(7 downto 0) -- Y axis.
	  );
	end component;
	
	


	
begin







  u1 : ps2 port map (
      iSTART    => iSTART,
      iRST_n    => n_reset,
      iCLK_50   => clk,
      PS2_CLK   => PS2_CLK,  
      PS2_DAT   => PS2_DAT,
      oLEFBUT   => oLEFBUT,
      oRIGBUT   => oRIGBUT,       
      oMIDBUT   => oMIDBUT,
      oX        => oX,
      oY        => oY
    );

  process(clk)
  begin
	
	 n_reset <= not reset;
	if (rising_edge(clk)) then
    case avs_address is
      when "0000" =>
        if avs_write = '1' then
          iSTART <= avs_writedata(0) ;
        end if;   
		  
		   if avs_read = '1' then
				avs_readdata(0) <= iStart;	 
		    end if; 

      when "0001" =>
        if avs_read = '1' then
          avs_readdata(0) <= oLEFBUT;
          avs_readdata(1) <= oRIGBUT;
          avs_readdata(2) <= oMIDBUT;
          avs_readdata(10 downto 3) <= oX;
          avs_readdata(18 downto 11) <= oY;
        end if; 
		when others =>
			avs_readdata <= x"5A5AFFFF";

    end case;
	end if;
  end process;

end rtl;
