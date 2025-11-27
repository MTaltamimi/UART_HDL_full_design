library ieee;
use ieee.std_logic_1164.all;

entity uart_rx_parity is 
generic ( N : integer :=8);
port (
	data_bits : IN std_logic_vector (N-1 downto 0) ;
	parity_bit : IN std_logic;
	parity_res : OUT std_logic
	);
	end uart_rx_parity;
	
architecture parity of uart_rx_parity is 

signal parity_cal : std_logic :='0';
begin
process (data_bits)
variable i : integer :=0;
variable p : std_logic :='0';
begin
	p:='0';
	for i in 0 to N-1 loop
		p := p xor data_bits(i); -- verifying parity for the data frame
		end loop;
		parity_cal <= p;
end process;
	parity_res <= parity_cal xor parity_bit ; -- calculating the parity between the data frame and the parity bit sent by TX

end parity;