--=============================================================================
--Library Declarations:
--=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
library UNISIM;
use UNISIM.VComponents.all;

--=============================================================================
--Entity Declaration:
--=============================================================================
entity button_interface is
    Port( clk_port            : in  std_logic;
		  button_port         : in  std_logic;
		  button_db_port      : out std_logic;
		  button_mp_port      : out std_logic);	
end button_interface;

--=============================================================================
--Architecture
--=============================================================================
architecture Behavioral of button_interface is
--=============================================================================
--Signal Declarations
--=============================================================================
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Synchronizer
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
signal synchronizer  : std_logic_vector(1 downto 0) := "00";
signal synchronized_button_press  : std_logic := '0';

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Debouncer
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
type state_type is (LOW, LOW_TO_HIGH, HIGH, HIGH_TO_LOW);
signal current_state    : state_type := LOW;
signal next_state       : state_type;
signal timeout_counter  : unsigned(7 downto 0) := (others => '0');
signal reset            : std_logic := '0';
signal timeout          : std_logic := '0';
constant MAXCOUNT       : integer := 100;
signal debounced        : std_logic := '0';

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Monopulser
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
signal mp_delay_reg	: std_logic := '0';

--=============================================================================
--Processes
--=============================================================================
begin
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Double-Flop Synchronizer:
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Prevents metastability on the input by passing the raw button press through a
--double flop synchronizer.
synchronize: process(clk_port, synchronizer)
begin
    if rising_edge(clk_port) then
        synchronizer <= button_port & synchronizer(1);
    end if;
    synchronized_button_press <= synchronizer(0);
end process;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Debouncer:
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
state_update: process(clk_port)
begin
    if rising_edge(clk_port) then
        current_state <= next_state;
    end if;
end process;

next_state_logic: process(current_state, synchronized_button_press, timeout)
begin
    next_state <= current_state;
    case current_state is
        when LOW =>
            if synchronized_button_press = '1' then
                next_state <= LOW_TO_HIGH;
            end if;
        
        when LOW_TO_HIGH =>
            if synchronized_button_press = '0' then
                next_state <= LOW;
            elsif timeout = '1' then
                next_state <= HIGH;
            end if;
            
        when HIGH =>
            if synchronized_button_press = '0' then
                next_state <= HIGH_TO_LOW;
            end if;
            
        when HIGH_TO_LOW =>
            if synchronized_button_press = '1' then
                next_state <= HIGH;
            elsif timeout = '1' then
                next_state <= LOW;
            end if;
    end case;
end process;

output_logic: process(current_state, debounced)
begin
    case current_state is
        when LOW =>
            reset       <= '1';
            debounced   <= '0';
            
        when LOW_TO_HIGH =>
            reset       <= '0';
            debounced   <= '0';
            
        when HIGH =>
            reset       <= '1';
            debounced   <= '1';
        
        when HIGH_TO_LOW =>
            reset       <= '0';
            debounced   <= '1';
    end case;
    button_db_port <= debounced;
end process;

timer: process(clk_port, timeout_counter)
begin
    if rising_edge(clk_port) then
        if reset = '1' then
            timeout_counter <= (others => '0'); 
        else
            timeout_counter <= timeout_counter + 1;
        end if;
    end if;
    
    if timeout_counter = MAXCOUNT - 1 then
        timeout <= '1';
    else
        timeout <= '0';
    end if;
end process;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Monopulser:
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--A monopulsed output is an output that is high for one clock cycle.
monopulser: process(clk_port, debounced, mp_delay_reg)
begin	
	if rising_edge(clk_port) then	
		mp_delay_reg <= debounced;
	end if;
	button_mp_port <= debounced and not(mp_delay_reg);
end process monopulser;
end Behavioral;
