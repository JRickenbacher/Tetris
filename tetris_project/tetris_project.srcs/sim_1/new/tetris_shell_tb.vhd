----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 09:45:04 PM
-- Design Name: 
-- Module Name: tetris_shell_tb - testbench
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

entity tetris_shell_tb is
end tetris_shell_tb;

architecture testbench of tetris_shell_tb is


component tetris_shell is
    Port ( clk_ext_port : in STD_LOGIC;
           KEY_UP_PORT : in STD_LOGIC;
           KEY_DOWN_PORT : in STD_LOGIC;
           KEY_LEFT_PORT : in STD_LOGIC;
           KEY_RIGHT_PORT : in STD_LOGIC;
           color_port : out STD_LOGIC_VECTOR (11 downto 0);
           hsynch_port : out STD_LOGIC;
           vsynch_port : out STD_LOGIC);
end component;




CONSTANT clk_period : TIME := 10 ns;
SIGNAL clk_signal : STD_LOGIC := '0';
SIGNAL KEY_UP_SIGNAL : STD_LOGIC := '0';
SIGNAL KEY_LEFT_SIGNAL : STD_LOGIC := '0';
SIGNAL KEY_RIGHT_SIGNAL : STD_LOGIC := '0';
SIGNAL KEY_DOWN_SIGNAL : STD_LOGIC := '0';


SIGNAL hsynch_signal : STD_LOGIC := '0';
SIGNAL vsynch_signal : STD_LOGIC := '0';
SIGNAL color_signal : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');


begin
shell_ut : tetris_shell
    PORT MAP(
        clk_ext_port => clk_signal,
        KEY_UP_PORT => KEY_UP_SIGNAL,
        KEY_LEFT_PORT => KEY_LEFT_SIGNAL,
        KEY_RIGHT_PORT => KEY_RIGHT_SIGNAL,
        KEY_DOWN_PORT => KEY_DOWN_SIGNAL,
        color_port => color_signal,
        hsynch_port => hsynch_signal,
        vsynch_port => vsynch_signal);
        
clkgen_proc : PROCESS
BEGIN
    WAIT for clk_period / 2;
    clk_signal <= NOT(clk_signal);
END PROCESS clkgen_proc;


--test : process
--begin

--wait for 50ms;
--KEY_LEFT_SIGNAL <= '1';
--wait for 1ms;
--KEY_LEFT_SIGNAL <= '0';
--wait for 20ms;
--KEY_RIGHT_SIGNAL <= '1';
--wait for 1ms;
--KEY_RIGHT_SIGNAL <= '0';
--wait;
--end process test;


end testbench;

