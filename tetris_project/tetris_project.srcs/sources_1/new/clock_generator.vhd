--Names: Jason Rickenbacher and Nestor Orozco-Llamas
--Purpose: Create a 25 MHz clock signal for use with VGA
--Credit: Basis for this code comes from Lab 6
--=============================================================================
--Library Declarations:
--=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
library UNISIM;
use UNISIM.VComponents.all;

--=============================================================================
--Entity Declaration:
--=============================================================================
entity pixel_clock_generator is
	port (
        input_clk_port		: in std_logic;
        pixel_clk_port	    : out std_logic);
end pixel_clock_generator;

--=============================================================================
--Architecture Type:
--=============================================================================
architecture behavioral_architecture of pixel_clock_generator is
--=============================================================================
--Signal Declarations: 
--=============================================================================
--CONSTANT FOR SYNTHESIS:
constant CLOCK_DIVIDER_TC: integer := 2;

--Automatic register sizing:
constant COUNT_LEN					: integer := integer(ceil( log2( real(CLOCK_DIVIDER_TC) ) ));
signal pixel_clk_divider_counter	: unsigned(COUNT_LEN-1 downto 0) := (others => '0');
signal pixel_clk_tog				: std_logic := '0';  
signal pixel_clk                   : std_logic := '0';                      				

--=============================================================================
--Processes: 
--=============================================================================
begin
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Clock (frequency) Divider):
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Clock_divider: process(input_clk_port)
begin
	if rising_edge(input_clk_port) then
	   	if pixel_clk_divider_counter = CLOCK_DIVIDER_TC-1 then 	  -- Counts to 1/2 clk period
	   		pixel_clk_tog <= NOT(pixel_clk_tog);        		      -- T flip flop
			pixel_clk_divider_counter <= (others => '0');			  -- Reset
		else
			pixel_clk_divider_counter <= pixel_clk_divider_counter + 1; -- Count up
		end if;
	end if;
end process Clock_divider;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Clock buffer for the pixel clock
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- The BUFG component puts the pixel clock onto the FPGA clocking network
pixel_clock_buffer: BUFG
    port map (
		I => pixel_clk_tog,
        O => pixel_clk);
	pixel_clk_port <= pixel_clk;
	
end behavioral_architecture;