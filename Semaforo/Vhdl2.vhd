library ieee;
use ieee.std_logic_1164.all;

entity divifreq is 
	port (clock_in : in std_logic;
			clock_out : out std_logic);
			
end divifreq;

architecture divisora of divifreq is
signal contagem : integer range 1 to 250000000;
signal estado : std_logic;
begin
		process(clock_in)
		begin 
			if(clock_in'event and clock_in = '1') then
				if(contagem = 25000000) then 
				estado <= NOT estado;
				contagem <= 1;
				else
					contagem <= contagem+1;
				end if;
			end if;
		end process;	
		clock_out <= estado;
end divisora;		
			