LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_shift is

generic ( bits_size : integer := 8);
port (
	clk : IN std_logic;
	enable_shifting : IN std_logic :='0';
	sampled_bit : IN std_logic;
	data_reg : OUT std_logic_vector(bits_size-1 downto 0)
	);
	end uart_rx_shift;
architecture shift of uart_rx_shift is 
signal data_sig : std_logic_vector (bits_size-1 downto 0);
	begin
	process(clk, enable_shifting) 
	begin
	if rising_edge(clk) then 
		if enable_shifting = '1' then
			data_sig <= sampled_bit & data_sig(bits_size-1 downto 1); -- Right shifting little-endian
		end if;
	end if;
	end process;
	data_reg <= data_sig;
end shift;
			