----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Nestor Orozco-Llamas and Jason Rickenbacher
-- 
-- Create Date: 05/17/2022 07:00:27 PM
-- Design Name: 
-- Module Name: vga_test_shell_tb - testbench
-- Project Name: VGA Test Shell Testbench
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: A testbench for VGA_TEST_SHELL.vhd
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

entity vga_test_shell_tb is
end entity;

architecture testbench of vga_test_shell_tb is
--=============================================================================
--Components
--=============================================================================
component vga_test_shell is
    Port ( clk_ext_port : in STD_LOGIC;
           color_port : out STD_LOGIC_VECTOR (11 downto 0);
           hsynch_port : out STD_LOGIC;
           vsynch_port : out STD_LOGIC);
end component;

--=============================================================================
--Signals
--=============================================================================
CONSTANT clk_period : TIME := 10 ns;
SIGNAL clk_signal : STD_LOGIC := '0';

SIGNAL hsynch_signal : STD_LOGIC := '0';
SIGNAL vsynch_signal : STD_LOGIC := '0';
SIGNAL color_signal : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

begin
shell_ut : vga_test_shell
    PORT MAP(
        clk_ext_port => clk_signal,
        color_port => color_signal,
        hsynch_port => hsynch_signal,
        vsynch_port => vsynch_signal);
        
clkgen_proc : PROCESS
BEGIN
    WAIT for clk_period / 2;
    clk_signal <= NOT(clk_signal);
END PROCESS clkgen_proc;

end testbench;
