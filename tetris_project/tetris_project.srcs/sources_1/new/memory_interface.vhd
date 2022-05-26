----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 02:21:21 PM
-- Design Name: 
-- Module Name: memory_interface - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity memory_interface is
  Port (
        collision_addr, move_addr, VGA_addr, gen_piece_addr : in std_logic_vector(9 downto 0);
        move_data, gen_piece_data : in std_logic_vector(3 downto 0);
        write_piece_en, make_move_en, read_collision, video_on : in std_logic;
        addr_out : out std_logic_vector(9 downto 0);
        data_out : out std_logic_vector(3 downto 0)
   );
end memory_interface;

architecture Behavioral of memory_interface is

begin

addr_out <= VGA_addr when (video_on = '1') else
            move_addr when (make_move_en = '1') else
            collision_addr when (read_collision = '1') else
            gen_piece_addr when (write_piece_en = '1') else
            (others => '0');
            
data_out <= move_data when (make_move_en = '1') else
            gen_piece_data when (write_piece_en = '1') else
            (others => '0');

end Behavioral;
