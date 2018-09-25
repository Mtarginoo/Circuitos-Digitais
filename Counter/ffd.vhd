library ieee;
use ieee.std_logic_1164.all;

entity ffd is
	port(data: in std_logic;
	     clock: in std_logic;
		  q : out std_logic);
end ffd;		  

architecture ffd of ffd is
begin 
		process(clock)
		begin 
			if (clock='1' and clock 'EVENT) then
				q <= data;
			end if;
		end process;
end ffd;		
				