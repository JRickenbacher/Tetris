----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/17/2022 04:51:34 PM
-- Design Name: 
-- Module Name: vga_controller - Behavioral
-- Project Name: VGA Controller
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: A controller for VGA outputs
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
--  THE VGA CONTROLLER ITERATES THROUGH VGA MEMORY IP CORE AND OUTPUT THE NECESSARY
--  SIGNALS TO THE VGA MONITOR TO DISPLAY OUR 20 PIXEL X 20 PIXEL GRID SET UP IN
--  VGA MEMORY
----------------------------------------------------------------------------------


entity vga_controller is
    Port ( pixel_clk : in STD_LOGIC;
           hsync : out STD_LOGIC; -- HSYNC AND VSYNC USED FOR VGA CONTROL
           vsync : out STD_LOGIC;
           vga_read_addr : out STD_LOGIC_VECTOR(9 downto 0); -- ADDRESS TO READ FROM VGA MEMORY 
           vblank : out STD_LOGIC;
           hblank : out STD_LOGIC;         
           video_on : out STD_LOGIC;        -- HIGH WHEN VIDEO IS ON
           memory_update : out STD_LOGIC;   -- MEMORY UPDATE TO DETERMINE WHEN TO UPDATE
           h_count_port : out STD_LOGIC_VECTOR(9 downto 0);-- HORIZONTAL PIXEL COUNT
           v_count_port : out STD_LOGIC_VECTOR(9 downto 0) -- VERTICAL PIXEL COUNT
           );
end vga_controller;

architecture Behavioral of vga_controller is

------------INTERMEDIATE SIGNAL DECLARATIONS------------
signal h_count, v_count : unsigned(9 downto 0) := (others => '0');
signal v_block_enable, h_tc, v_tc, h_video_on, v_video_on, h_block_tc, v_block_tc, col_count_en: STD_LOGIC := '0';
signal v_block_count, h_block_count, row_count, col_count : unsigned(4 downto 0) := (others => '0');
signal prev_v_video_on : std_logic := '0';
signal hsync_direct, vsync_direct, vsync_next, hsync_next : STD_LOGIC := '0';

begin

counters : process(pixel_clk)
begin

if rising_edge(pixel_clk) then

    if h_tc ='1' then
        if v_tc = '1' then
            v_count <= (others => '0'); --reset v_count
        else
            v_count <= v_count + 1; --increment v_count
        end if;
        
        h_count <= (others => '0'); --reset h_count
    else
        h_count <= h_count + 1; --increment h_count
    end if;  
    
    
    -- BLOCK COUNT FOR ROW COUNT
    if (v_block_enable = '1') then
        if (v_block_tc = '1') then
            v_block_count <= "00000";
        else
        v_block_count <= v_block_count + 1;
        end if;
    end if;
   
   -- BLOCK COUNT FOR COLUMN COUNT
    if (h_block_tc = '1') then
        h_block_count <= "00000";
    elsif (h_video_on = '1') then
--    elsif (col_count_en = '1') then
        h_block_count <= h_block_count + 1;
    end if;
    
    -- ROW COUNT
    if ((v_count = 479 and h_count = 639) or (v_video_on = '0')) then
        row_count <= "00000";
    elsif (v_block_tc = '1' and v_block_enable = '1') then
        row_count <= row_count + 1;
    end if;
   
   -- COL COUNT
    if (h_video_on = '0') then
        col_count <= "00000";
    elsif (h_block_tc = '1') then
        col_count <= col_count + 1;
    end if;
    
    -- Previous v_video_on
    prev_v_video_on <= v_video_on;
    hsync_next <= hsync_direct;
    vsync_next <= vsync_direct;
    hsync <= hsync_next;
    vsync <= vsync_next;
end if;

end process counters;

--LOW during retrace, otherwise HIGH
hsync_direct <= '1' when ((h_count < 656) or (h_count > 751)) else '0';
vsync_direct <= '1' when ((v_count < 490) or (v_count > 491)) else '0';


--HIGH when on screen, LOW when off screen in given coordinate direction
h_video_on <= '1' when (h_count < 640) else '0';
v_video_on <= '1' when (v_count < 480) else '0';

--LOW when on screen, HIGH when off screen in given coordinate direction
hblank <= not(h_video_on);
vblank <= not(v_video_on);

--HIGH when both coordinates are on screen, otherwise LOW
video_on <= (v_video_on and h_video_on);

vga_read_addr <= STD_LOGIC_VECTOR(row_count) & STD_LOGIC_VECTOR(col_count);

--Terminal Counts
h_tc <= '1' when (h_count = 799) else '0';
v_tc <= '1' when (v_count = 520) else '0';
v_block_enable <= '1' when (h_count = 639 and v_video_on = '1') else '0';
v_block_tc <= '1' when (v_block_count = 19) else '0';
h_block_tc <= '1' when (h_block_count = 19) else '0';

-- memory update gives us a signal to determine if we can start changing vga memory/update our board
memory_update <= '1' when (prev_v_video_on = '1') and (v_video_on = '0') else '0';

-- counts for iterating through pixels
h_count_port <= STD_LOGIC_VECTOR(h_count);
v_count_port <= STD_LOGIC_VECTOR(v_count);
           
end Behavioral;
