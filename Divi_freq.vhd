library ieee;
use ieee.std_logic_1164.all;

entity divi_freq is
	port ( clock_in: in std_logic;
			 clock_out1, clock_out2 : out std_logic);
end divi_freq;

architecture divisora of divi_freq is
signal contagem1, contagem2 : integer range 1 to 50000000;
signal estado1, estado2: std_logic;
begin
	process(clock_in)
	begin
		if(clock_in'event and clock_in='1') then
			if(contagem1=50000000) then
				estado1 <= '1';
				contagem1 <=1;
			else
				estado1 <= '0';
				contagem1 <= contagem1 + 1;
			end if;
			if(contagem2=5000000) then
				estado2 <='1';
				contagem2 <=1;
			else
				estado2 <='0';
				contagem2<=contagem2+1;
			end if;	
		end if;
	end process;
	
clock_out1 <= estado1;
clock_out2 <= estado2;
end architecture;