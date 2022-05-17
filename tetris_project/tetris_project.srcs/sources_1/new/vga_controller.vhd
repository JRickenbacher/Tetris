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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_controller is
    Port ( pixel_clk : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           pixel_x : out STD_LOGIC_VECTOR(9 downto 0);
           pixel_y : out STD_LOGIC_VECTOR(9 downto 0);
           vblank : out STD_LOGIC;
           hblank : out STD_LOGIC;
           video_on : out STD_LOGIC);
end vga_controller;

architecture Behavioral of vga_controller is

------------SIGNAL DECLARATIONS------------
signal h_count, v_count : unsigned(9 downto 0) := (others => '0');
signal h_tc, v_tc, h_video_on, v_video_on: STD_LOGIC := '0';

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
end if;

end process counters;

--LOW during retrace, otherwise HIGH
hsync <= '1' when ((h_count < 656) or (h_count > 751)) else '0';
vsync <= '1' when ((v_count < 490) or (v_count > 491)) else '0';

--HIGH when on screen, LOW when off screen in given coordinate direction
h_video_on <= '1' when (h_count < 640) else '0';
v_video_on <= '1' when (v_count < 480) else '0';

--LOW when on screen, HIGH when off screen in given coordinate direction
hblank <= not(h_video_on);
vblank <= not(v_video_on);

--HIGH when both coordinates are on screen, otherwise LOW
video_on <= (v_video_on and h_video_on);

pixel_x <= STD_LOGIC_VECTOR(h_count);
pixel_y <= STD_LOGIC_VECTOR(v_count);

--Terminal Counts
h_tc <= '1' when (h_count = 799) else '0';
v_tc <= '1' when (v_count = 520) else '0';

end Behavioral;
