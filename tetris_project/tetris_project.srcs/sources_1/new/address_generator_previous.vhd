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

entity address_generator_previous is
  Port (
        curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4 : in STD_LOGIC_VECTOR(9 downto 0);
        rotation_number, action_number : in STD_LOGIC_VECTOR(1 downto 0);
        piece_number : in STD_LOGIC_VECTOR(3 downto 0);
        check_addr_1, check_addr_2, check_addr_3, check_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_addr_1, next_addr_2, next_addr_3, next_addr_4 : out STD_LOGIC_VECTOR(9 downto 0);
        next_rotation : out STD_LOGIC_VECTOR(1 downto 0)
  );
end address_generator_previous;

architecture Behavioral of address_generator_previous is

signal next_addr_1_row, next_addr_1_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_2_row, next_addr_2_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_3_row, next_addr_3_col : unsigned(4 downto 0) := (others => '0');
signal next_addr_4_row, next_addr_4_col : unsigned(4 downto 0) := (others => '0');

signal check_1_row, check_1_col, check_2_row, check_2_col, check_3_row, check_3_col, check_4_row, check_4_col : unsigned(4 downto 0) := (others => '0');

begin

get_addresses: process(curr_addr_1, curr_addr_2, curr_addr_3, curr_addr_4, rotation_number, piece_number, action_number)
begin

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

----DEFAULTS----
check_1_row <= "00000";
check_1_col <= "00000";

check_2_row <= "00000";
check_2_col <= "00000";

check_3_row <= "00000";
check_3_col <= "00000";

check_4_row <= "00000";
check_4_col <= "00000";

next_rotation <= rotation_number;

--==========================================================================================
----I PIECE----
--==========================================================================================
    if (piece_number = "0001") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_4(9 downto 5));
                check_1_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_3(9 downto 5)) - 2;
                check_1_col <= unsigned(curr_addr_3(4 downto 0)) ;
                
                check_2_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                check_2_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5));
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        
        ----ROTATION 1----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_3(9 downto 5));
                check_1_col <= unsigned(curr_addr_3(4 downto 0)) - 2;
                
                check_2_row <= unsigned(curr_addr_3(9 downto 5));
                check_2_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                check_1_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        end if;
    end if;
    
--==========================================================================================
----O PIECE----
--==========================================================================================
    if (piece_number = "0010") then
        ----ROTATION 0----
        ----LEFT MOVEMENT----
        if (action_number = "00") then
            check_1_row <= unsigned(curr_addr_1(9 downto 5));
            check_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
            
            check_3_row <= unsigned(curr_addr_3(9 downto 5));
            check_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;

        ----RIGHT MOVEMENT----
        elsif (action_number = "01") then  
            check_2_row <= unsigned(curr_addr_2(9 downto 5));
            check_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
            
            check_4_row <= unsigned(curr_addr_4(9 downto 5));
            check_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
        
        ----DOWN MOVEMENT----
        else
            check_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
            check_3_col <= unsigned(curr_addr_3(4 downto 0));
            
            check_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
            check_4_col <= unsigned(curr_addr_4(4 downto 0));

        end if;
    end if;
    
--==========================================================================================
----J PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") theN 
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_1_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 2;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))-1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))-1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;
                
            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5));
                check_3_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_3_col <= unsigned(curr_addr_2(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
            end if;
            
        ----ROTATION 3----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5));
                check_3_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        end if;
    end if;

--==========================================================================================
----L PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;

                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_3(9 downto 5))-1;
                check_1_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_2(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_3(9 downto 5));
                check_1_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5));
                check_3_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5));
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 2;
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_3_col <= unsigned(curr_addr_2(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
            end if;
            
        ----ROTATION 3----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_2(9 downto 5));
                check_1_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 2;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0));
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        end if;
    end if;
    
--==========================================================================================
----S PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then         
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))-1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5));
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 2;
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
            
        ----ROTATION 1----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-2;
                
                check_2_row <= unsigned(curr_addr_1(9 downto 5));
                check_2_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
            end if;
        end if;
    end if;


--==========================================================================================
----Z PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5))-2;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_1(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) - 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))-1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))-1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        ----ROTATION 1----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 2;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                next_addr_2_row <= unsigned(curr_addr_2(9 downto 5)) + 1;
                next_addr_2_col <= unsigned(curr_addr_2(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        end if;
    end if;


--==========================================================================================
----T PIECE----
--==========================================================================================
    if (piece_number = "0011") then
        ----ROTATION 0----
        if (rotation_number = "00") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then               
                check_2_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "01";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        
        ----ROTATION 1----
        elsif (rotation_number = "01") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))+1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) + 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) - 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) - 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "10";
            
            ----DOWN MOVEMENT----
            else
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
            
        ----ROTATION 2----
        elsif (rotation_number = "10") then
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5))-1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) + 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) - 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) + 1;
                
                next_rotation <= "11";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5))+1;
                check_2_col <= unsigned(curr_addr_2(4 downto 0));
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5))+1;
                check_3_col <= unsigned(curr_addr_3(4 downto 0));
                
            end if;
            
        ----ROTATION 3----
        else
            ----LEFT MOVEMENT----
            if (action_number = "00") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))-1;
                
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))-1;

            ----RIGHT MOVEMENT----
            elsif (action_number = "01") then
                check_1_row <= unsigned(curr_addr_1(9 downto 5));
                check_1_col <= unsigned(curr_addr_1(4 downto 0))+1;
                
                check_3_row <= unsigned(curr_addr_3(9 downto 5));
                check_3_col <= unsigned(curr_addr_3(4 downto 0))+1;
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5));
                check_4_col <= unsigned(curr_addr_4(4 downto 0))+1;
            
            ----ROTATION MOVEMENT----
            elsif (action_number = "10") then
                check_2_row <= unsigned(curr_addr_2(9 downto 5));
                check_2_col <= unsigned(curr_addr_2(4 downto 0))-1;
                
                next_addr_1_row <= unsigned(curr_addr_1(9 downto 5)) - 1;
                next_addr_1_col <= unsigned(curr_addr_1(4 downto 0)) - 1;
                
                next_addr_3_row <= unsigned(curr_addr_3(9 downto 5)) + 1;
                next_addr_3_col <= unsigned(curr_addr_3(4 downto 0)) + 1;
                
                next_addr_4_row <= unsigned(curr_addr_4(9 downto 5)) + 1;
                next_addr_4_col <= unsigned(curr_addr_4(4 downto 0)) - 1;
                
                next_rotation <= "00";
            
            ----DOWN MOVEMENT----
            else
                check_1_row <= unsigned(curr_addr_1(9 downto 5))+1;
                check_1_col <= unsigned(curr_addr_1(4 downto 0));
                
                check_4_row <= unsigned(curr_addr_4(9 downto 5))+1;
                check_4_col <= unsigned(curr_addr_4(4 downto 0));
                
            end if;
        end if;
    end if;

end process;

next_addr_1 <= std_logic_vector(next_addr_1_row) & std_logic_vector(next_addr_1_col);
next_addr_2 <= std_logic_vector(next_addr_2_row) & std_logic_vector(next_addr_2_col);
next_addr_3 <= std_logic_vector(next_addr_3_row) & std_logic_vector(next_addr_3_col);
next_addr_4 <= std_logic_vector(next_addr_4_row) & std_logic_vector(next_addr_4_col);

check_addr_1 <= std_logic_vector(check_1_row) & std_logic_vector(check_1_col);
check_addr_2 <= std_logic_vector(check_2_row) & std_logic_vector(check_2_col);
check_addr_3 <= std_logic_vector(check_3_row) & std_logic_vector(check_3_col);
check_addr_4 <= std_logic_vector(check_4_row) & std_logic_vector(check_4_col);
                
end Behavioral;
