library ieee;
use ieee.std_logic_1164.all;

entity sistema is
	port (clock: in std_logic;
			sw: in std_logic_vector(1 downto 0);
			sensor: in std_logic_vector(1 downto 0);
			acai: out std_logic_vector(2 downto 0);
			guarana: out std_logic_vector(2 downto 0);
			adequado, inadequado: out std_logic
			clock_out: out std_logic);
			
end sistema;

architecture comportamento of sistema is
	signal cont1: integer range 1 to 25000000;
	signal cont2: integer range 1 to 825000000;
	signal cont3: integer range 1 to 500000000;
	signal cont4: integer range 1 to 575000000;
	begin
		process(clock, sw, sensor, acai, guarana, adequado, inadequado, clock_out);
		begin 
			if(clock'event and clock = '1')then
				if(sw(0)='1' and sw(1)='0') then
						if(cont1=25000000) then 
							acai(1) <= not (acai(1));
							guarana(1) <= not(guarana(1));
							cont1 <= 1;
						else
							cont1 <= cont1 + 1; 
						end if
				else if(sw(0) = '0' and sw(1) = '1') then
						acai(3)<= not(acai(3));
						guarana(1)<=not(guarana(1));
						if(cont4=500000000) then
								acai(3) <= not(acai(3));
								acai(2) <= not(acai(2));
						end if;
						
						if(cont4=575000000) then
						acai(2)<=not (acai(2));
						acai(1)<=not (acai(1));
						guarana(3)<=not (guarana(3));
						guarana(1)<=not (guarana(1));
						cont4 <= 1;
						end if;
						
						if(cont4=500000000) then
						guarana(3) <= not(guarana(3));
						guarana(2) <= not(guarana(2));
						end if;
						
						if(cont4=575000000) then
						guarana(2) <= not (guarana(2));
						acai(1) <= not (acai(1));
						cont4 <= 1;
						end if
						
						cont <= cont + 1;
						
						
						
				