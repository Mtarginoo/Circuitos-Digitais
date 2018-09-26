library ieee;
use ieee.std_logic_1164.all;

entity ffjk is 
	port(j, k: in std_logic;
			clock, preset, clear: in std_logic;
			q : out std_logic);
end ffjk;

architecture ffjk of ffjk is
signal estado: std_logic;
begin
		process(clock, preset, clear)
		begin
		if(preset = '1') then estado<='1';
		elsif(clear = '0') then estado <='0';
		elsif (clock = '1' and clock 'EVENT) then
			if(j='0' and k='1') then estado<='0';
			elsif (j='1' and k='0') then estado<='1';
			elsif (j='1' and k='1') then estado<= not(estado);
			end if;
		end if;
	end process;
		q <=estado;
end ffjk;		
			
