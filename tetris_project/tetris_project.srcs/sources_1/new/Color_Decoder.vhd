----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Jason Rickenbacher and Nestor Orozco-Llamas
-- 
-- Create Date: 05/20/2022 04:17:21 PM
-- Design Name: 
-- Module Name: Color_Decoder - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: Decodes the piece from memory into a color
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Color_Decoder is
    Port ( Piece : in STD_LOGIC_VECTOR (3 downto 0);
           h_count_port : in STD_LOGIC_VECTOR(9 downto 0);
           v_count_port : in STD_LOGIC_VECTOR(9 downto 0);
           video_on_port, currently_playing : in STD_LOGIC;
           Color : out STD_LOGIC_VECTOR (11 downto 0));
end Color_Decoder;

architecture Behavioral of Color_Decoder is
signal power_twenty : STD_LOGIC := '0';
signal h_count, v_count : unsigned(9 downto 0) := (others => '0');

begin

color <= "000000000000" WHEN video_on_port = '0' ELSE
         "101110111011" when (power_twenty = '1' AND currently_playing = '1') else
         "111111111111" when piece = "0000" else --white
         "001011111111" when piece = "0001" else --cyan
         "111111110010" when piece = "0010" else --yellow
         "000000001111" when piece = "0011" else --blue
         "111110000000" when piece = "0100" else --orange
         "000011110000" when piece = "0101" else --green
         "111100000000" when piece = "0110" else --red
         "011000000110" when piece = "0111" else -- purple
         "000000000000"; --black
         
h_count <= unsigned(h_count_port);
v_count <= unsigned(v_count_port);

power_twenty <= '1' when ( ( h_count = 242 or h_count = 262 or h_count = 282 or h_count = 302 or h_count = 322 or h_count = 342 or h_count = 362 or
                             h_count = 382 or h_count = 402 or v_count = 60 or v_count = 80 or v_count = 100 or v_count = 120 or v_count = 140 or
                             v_count = 160 or v_count = 180 or v_count = 200 or v_count = 220 or v_count = 240 or v_count = 260 or v_count = 280 or v_count = 300 or
                             v_count = 320 or v_count = 340 or v_count = 360 or v_count = 380 or v_count = 400 or v_count = 420 or v_count = 440) and 
                            (h_count > 221 and h_count < 422 and v_count > 39 and v_count < 460)) else '0';

end Behavioral;
