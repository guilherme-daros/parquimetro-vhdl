library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity top is port (
	--entradas
	m  		: in std_logic; --moeda inserida
	vm 		: in std_logic_vector(6 downto 0); -- valor da moeda inserida
	imprime	: in std_logic;
	cancela	: in std_logic;
	rst		: in std_logic;
	clock	: in std_logic;

	--saídas
	devolve 	: out std_logic; --troco
	totalm		: out std_logic_vector(7 downto 0); -- valor acumulado de moedas
	totalt		: out std_logic_vector(7 downto 0); -- minutos de estacionamento do valor acumulado de moeda
	bilhete		: out std_logic;
	erro        : out std_logic --quando o pagamento não é o suficiente
	);
	end entity;
architecture bhv of confere is 

component confere is
port (
	CLOCK 				: in  std_logic;
	moeda 				: in  std_logic;
	valor				: in  std_logic_vector (6 downto 0);
	soma_moeda			: in  std_logic_vector (6 downto 0);
	min_moeda, tot_moeda: out std_logic_vector (3 downto 0)
);
end component; 
begin   
	
conf : confere port map (
		
		clock => CLOCK, 						
		m => moeda,						
		vm => valor,					
		tot_moeda => totalt,
		totalm => min_moeda
	);

end architecture;

