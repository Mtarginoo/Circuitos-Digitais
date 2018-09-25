library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador is 
	port (clock, S, E, R: in std_logic;
	q : out std_logic_vector(2 downto 0));
end contador;

architecture comportamento of contador is
		signal aux: std_logic_vector(2 downto 0);
begin
	process(clock, E, R, S)
	begin 
		if(clock = '1' and clock'event) then
			if(E = '1') then
				if(s = '1') then
					aux <= aux+1;
				else 
					aux <= aux-1;
				end if;
			else
				if (R = '0') then
				aux <= "000";
				end if;
			end if;	
		end if;
	end process;
	q <= aux;
end comportamento;	
	