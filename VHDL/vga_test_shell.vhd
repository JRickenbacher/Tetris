----------------------------------------------------------------------------------
-- Company: Dartmouth College
-- Engineers: Jason Rickenbacher and Nestor Orozco-Llamas
-- 
-- Create Date: 05/17/2022 06:20:28 PM
-- Design Name: 
-- Module Name: vga_test_shell - Behavioral
-- Project Name: Tetris
-- Target Devices: Basys 3 (Artix 7)
-- Tool Versions: 
-- Description: A shell to test the controller for VGA outputs
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

entity vga_test_shell is
    Port ( clk_ext_port : in STD_LOGIC;
           --w_row_port : in STD_LOGIC_VECTOR(4 downto 0);
          -- w_col_port : in STD_LOGIC_VECTOR(4 downto 0);
           --w_in_port : in STD_LOGIC_VECTOR(3 downto 0);
           --w_en_port : in STD_LOGIC;
           color_port : out STD_LOGIC_VECTOR (11 downto 0);
           hsynch_port : out STD_LOGIC;
           vsynch_port : out STD_LOGIC);
end vga_test_shell;

architecture Behavioral of vga_test_shell is
--=================================
--Sub component Declarations
--=================================
--+++++++++++++++++++++++++++++++++
--Pixel Clock Generator
--+++++++++++++++++++++++++++++++++
component pixel_clock_generator is
    port (
            --External clock
            input_clk_port		: in std_logic;
            --Pixel clock
            pixel_clk_port	    : out std_logic);
end component;

--+++++++++++++++++++++++++++++++++
--VGA Controller
--+++++++++++++++++++++++++++++++++
component vga_controller is
    Port ( pixel_clk : in STD_LOGIC;
           hsync : out STD_LOGIC;
           vsync : out STD_LOGIC;
           row : out STD_LOGIC_VECTOR(4 downto 0);
           col : out STD_LOGIC_VECTOR(4 downto 0);
           vblank : out STD_LOGIC;
           hblank : out STD_LOGIC;
           video_on : out STD_LOGIC;
           memory_update : out STD_LOGIC);
end component;

--+++++++++++++++++++++++++++++++++
--IP Core memory component
--+++++++++++++++++++++++++++++++++
component blk_mem_gen_0 IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end component;
  
component Piece_Generator IS
        Port ( clk_port : in STD_LOGIC;
           Generate_Piece_Port : in STD_LOGIC;
           New_Piece_Port : out STD_LOGIC_VECTOR (3 downto 0);
           New_Piece_Address_Port : out STD_LOGIC_VECTOR (9 downto 0));

END component;

--+++++++++++++++++++++++++++++++++
--color decoder component
--+++++++++++++++++++++++++++++++++
component Color_Decoder is
    Port ( Piece : in STD_LOGIC_VECTOR (3 downto 0);
           Color : out STD_LOGIC_VECTOR (11 downto 0));
end component;
--=================================
--Sub component Declarations
--=================================
--+++++++++++++++++++++++++++++++++
--Pixel Clock
--+++++++++++++++++++++++++++++++++
signal pixel_clk_signal : STD_LOGIC := '0';

--+++++++++++++++++++++++++++++++++
--VGA Controller
--+++++++++++++++++++++++++++++++++
signal row_signal : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal col_signal : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal read_mem_signal : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal address : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');

--signal hsynch_signal : STD_LOGIC := '0';
--signal vsynch_signal : STD_LOGIC := '0';

--+++++++++++++++++++++++++++++++++
--VGA Test Pattern
--+++++++++++++++++++++++++++++++++
--signal color_signal : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

begin
--+++++++++++++++++++++++++++++++++
--Wire pixel clock generator into the shell:
--+++++++++++++++++++++++++++++++++
clocking: pixel_clock_generator port map(
    input_clk_port => clk_ext_port,     -- External clock
    pixel_clk_port => pixel_clk_signal);   -- pixel clock

--++++++++++++++++++++++++++++++++++
--Wire VGA Controller into the shell:
--++++++++++++++++++++++++++++++++++
controller: vga_controller port map(
    pixel_clk => pixel_clk_signal,
    hsync => hsynch_port,
    vsync => vsynch_port,
    row => row_signal,
    col => col_signal,
    vblank => open,
    hblank => open,
    video_on => open,
    memory_update => open);

--+++++++++++++++++++++++++++++++++
--Wire VGA Test Block into the shell:
--+++++++++++++++++++++++++++++++++
memory: blk_mem_gen_0 PORT map(
    clka => pixel_clk_signal,
    ena => '1',
    wea => "0",
    addra => address,
    dina => "0000",
    douta => read_mem_signal
  );

piece_generation: Piece_Generator PORT MAP(
   clk_port => pixel_clk_signal,
   Generate_Piece_Port => '0',
   New_Piece_Port => open,
   New_Piece_Address_Port => open
);
--+++++++++++++++++++++++++++++++++
--Wire color decoder
--+++++++++++++++++++++++++++++++++
color: color_decoder port map(
          Piece => read_mem_signal,
          Color => color_port
           
           );

address <= row_signal & col_signal;

end Behavioral;
