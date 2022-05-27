----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineer: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/23/2022 01:05:49 AM
-- Design Name: 
-- Module Name: address_generator - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity address_generator is
  Port (
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
        rotation_number, action_number : in STD_LOGIC_VECTOR(1 downto 0);
        piece_number : in STD_LOGIC_VECTOR(3 downto 0);
        next_addr_1, next_addr_2, next_addr_3, next_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_rotation : out STD_LOGIC_VECTOR(1 downto 0)
  );
end address_generator;

architecture Behavioral of address_generator is

signal next_addr_1_row, next_addr_1_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_2_row, next_addr_2_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_3_row, next_addr_3_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_4_row, next_addr_4_col : unsigned(4 downto 0) := (others => '0');

begin

get_addresses: process(curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4, rotation_number, piece_number, action_number)
begin

next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));

next_addr_2_row <= unsigned(curr_addr_2(9 downto 5));
next_addr_2_col <= unsigned(curr_addr_2(4 downto 0));

next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
next_addr_3_col <= unsigned(curr_addr_3(4 downto 0));

next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));

----LEFT MOVEMENT----
if (action_number = "00") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
    
    next_addr_2_row <= unsigned(curr_addr_2(9 downto 5));
    next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
    
    next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
    next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
    
    next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
    next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
end if;

----RIGHT MOVEMENT----
if (action_number = "01") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
    
    next_addr_2_row <= unsigned(curr_addr_2(9 downto 5));
    next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
    
    next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
    next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
    
    next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
    next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
end if;

----DOWN MOVEMENT----
if (action_number = "11") then
    next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
    next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
    
    next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
    next_addr_2_col <= unsigned(curr_addr_2(4 downto 0));
    
    next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
    next_addr_3_col <= unsigned(curr_addr_3(4 downto 0));
    
    next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
    next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
end if;

next_rotation <= rotation_number;

if (action_number = "10") then
--==========================================================================================
----I PIECE----
--==========================================================================================
    if (piece_number = "0001") then
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0));
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
            
            next_rotation <= "01";
        
        ----ROTATION 1----
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            next_rotation <= "00";
            
        end if;
    end if;
    
--==========================================================================================
----O PIECE----
--==========================================================================================
    
--==========================================================================================
----J PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 2;
            
            next_rotation <= "01";
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
            
            next_rotation <= "10";
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
            
            next_rotation <= "11";
            
        ----ROTATION 3----
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
            
            next_rotation <= "00";
        end if;
    end if;

--==========================================================================================
----L PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
            
            next_rotation <= "01";
                
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
            
            next_rotation <= "10";
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
            
            next_rotation <= "11";
            
        ----ROTATION 3----
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
            
            next_rotation <= "00";
        end if;
    end if;
    
--==========================================================================================
----S PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
            
            next_rotation <= "01";
            
        ----ROTATION 1----
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            next_rotation <= "00";
        end if;
    end if;


--==========================================================================================
----Z PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            next_rotation <= "01";
            
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
            
            next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
            next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
            
            next_rotation <= "00";
            
        end if;
    end if;


--==========================================================================================
----T PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
            
            next_rotation <= "01";
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            next_rotation <= "10";
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            next_rotation <= "11";

        ----ROTATION 3----
        else
            next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
            next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
            
            next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
            
            next_rotation <= "00";
            
        end if;
    end if;
    
end if;

end process;

next_addr_1 <= std_logic_vector(next_addr_1_row) & std_logic_vector(next_addr_1_col);
next_addr_2 <= std_logic_vector(next_addr_2_row) & std_logic_vector(next_addr_2_col);
next_addr_3 <= std_logic_vector(next_addr_3_row) & std_logic_vector(next_addr_3_col);
next_addr_4 <= std_logic_vector(next_addr_4_row) & std_logic_vector(next_addr_4_col);
                
end Behavioral;
