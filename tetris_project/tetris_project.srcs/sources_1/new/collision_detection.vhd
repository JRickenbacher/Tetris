----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/25/2022 09:57:09 PM
-- Design Name: 
-- Module Name: collision_detection - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------------
--  COLLISION DETECTION TAKES IN FOUR ADDRESSES FOR EACH SQUARE IN A PIECE AND IT 
--  ALSO TAKES IN A PROPOSED NEXT ADDRESS. THE BLOCK CONTAINS LOGIC TO DETERMINE
--  WHETHER THE PROPOSED ADDRESSES ARE VALID AND DO NOT COLLIDE WITH OTHER PIECES
--  OR GAME BORDERS
----------------------------------------------------------------------------------

entity collision_detection is
  Port ( 
            clk : in STD_LOGIC;
            request_move : in STD_LOGIC; -- control signal monopulse to check if move is valid
            color_output : in STD_LOGIC_VECTOR(3 downto 0); -- piece number
            curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0); --current addresses of each square
            next_addr_1, next_addr_2, next_addr_3, next_addr_4 : in STD_LOGIC_VECTOR(9 downto 0); -- proposed addresses of pieces
            collision_read_addr : out STD_LOGIC_VECTOR(9 downto 0); 
            not_valid_move : out STD_LOGIC -- signal not valid 
            );
end collision_detection;

architecture Behavioral of collision_detection is

-- address in memory used to delay by two clock cycles
signal read_address, current_read_address, next_read_address : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
-- used to iterate through addresses
signal read_count : unsigned(1 downto 0) := "00";
-- intermediate signals
signal open_square, not_valid_signal, valid_address, valid_count, valid_output : STD_LOGIC := '0';

begin

-- read counter to iterate through next addresses
counter : process(clk)
begin

if rising_edge(clk) then
    -- clear on the request move monopulse
    if request_move = '1' then
        read_count <= "00";
    --else if counts up to 3 and disables
    elsif read_count < 3 then
        read_count <= read_count + 1;
    end if;
    
end if;
end process counter;


datapath : process(clk)
begin
if rising_edge(clk) then

    -- two clock cycle delay of next address to account for 2 cycle read delay in ip core memory
    next_read_address <= read_address;
    current_read_address <= next_read_address;

    -- resets on request move monopulse
    if request_move = '1' then 
        not_valid_signal <= '0';
    -- logic to determine whether move is not valid and stays high any of the checks return invalid
    elsif valid_output = '1' then 
        not_valid_signal <= not_valid_signal or not(open_square);
    end if;
    
end if;
end process datapath;

-- read count is used as a multiplexer select symbol for current read address
read_address    <=  next_addr_1 when (read_count = 0) else
                    next_addr_2 when (read_count = 1) else
                    next_addr_3 when (read_count = 2) else
                    next_addr_4;

-- open square is true if a square has a value of "0000" which represent white or blank
open_square     <=  '1' when (color_output = "0000") else '0';
--setting not valid output
not_valid_move  <=  not_valid_signal;
-- signal so that we do not check a square that is occupied by the shape
valid_address   <=  '0' when ((current_read_address = curr_addr_1) or 
                             (current_read_address = curr_addr_2)  or 
                             (current_read_address = curr_addr_3)  or 
                             (current_read_address = curr_addr_4)) 
                    else '1'; 
-- valid count is the used to make sure read count is 2 or high before deciding valid move due to 
-- 2 clock cycle delay
valid_count     <=  '1' when (read_count > 1) else '0';
-- valid output combines valid address and valid count to figure out when we can determine valid move
valid_output    <=  '1' when (valid_address = '1' and valid_count = '1') else '0';
-- output set to go into memory interface
collision_read_addr <= read_address;

end Behavioral;
