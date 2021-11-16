
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity confere is
port (
	CLOCK 				: in  std_logic;
	moeda 				: in  std_logic;
	valor				: in  std_logic_vector (6 downto 0);
    soma_moeda			: in  std_logic_vector (6 downto 0);
	min_moeda, tot_moeda: out std_logic_vector (3 downto 0)
);
end confere;

architecture bhv of confere is
begin
	process(CLOCK, moeda, valor, soma_moeda, min_moeda, tot_moeda)
		begin
			if (moeda  = '1') then
				valor <= "0000";
					soma_moeda <= valor;
					soma_moeda <= (soma_moeda + 1);
			end if;
			tot_moeda <= soma_moeda;
			-- tot_moeda / 0.1 - ve quanto min está disponível
			min_moeda <= resize(shift_right(tot_moeda*1010,7));
			
	end process;
	
end architecture;