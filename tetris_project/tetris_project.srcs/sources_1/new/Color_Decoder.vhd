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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Color_Decoder is
    Port ( Piece : in STD_LOGIC_VECTOR (3 downto 0);
           Color : out STD_LOGIC_VECTOR (11 downto 0));
end Color_Decoder;

architecture Behavioral of Color_Decoder is

begin

color <= "111111111111" when piece = "0000" else --white
         "001011111111" when piece = "0001" else --cyan
         "111111110010" when piece = "0010" else --yellow
         "000000000010" when piece = "0011" else --blue
         "111110000000" when piece = "0100" else --orange
         "000011110000" when piece = "0101" else --green
         "111100000000" when piece = "0110" else --red
         "011000000110" when piece = "0111" else -- purple
         "000000000000"; --black

end Behavioral;
