library ieee;
use ieee.std_logic_1164.all;

entity sistema is
	port (clock: in std_logic;
			sw: in std_logic_vector(1 downto 0);
			sensor: in std_logic_vector(1 downto 0);
			acai: out std_logic_vector(2 downto 0);
			guarana: out std_logic_vector(2 downto 0);
			adequado, inadequado: out std_logic;
			clock_out: out std_logic );
			
end sistema;

architecture comportamento of sistema is
	signal cont10: integer range 1 to 25000000;
	signal cont01: integer range 1 to 825000000;
	signal cont00: integer range 1 to 500000000;
	--signal cont4: integer range 1 to 575000000;
	begin
		process(clock, sw, sensor, acai, guarana, adequado, inadequado, clock_out)
		begin 
			if(clock'event and clock = '1')then    
	if(sw(0) = '1' and sw(1) = '0') then	-- C (10)
		cont00 <= 1;
		cont01 <= 1;
		if(cont10 = 25000000) then 
			acai(0) <= not(acai(0));
			guarana(0) <= not(guarana(0));
			cont10 <= 1;
		else
		cont10 <= cont10 + 1; 
		end if;
else if (sw(0) = '0' and sw(1) = '0') then	-- A (00)
	cont10 <= 1;
	cont01 <= 1;
	if (acai(0) = '0') then
		acai(2) <= '1';
		guarana(0) <= '1';
		if (cont00 = 500000000) then
			acai(2) <= '0';
			acai(1) <= '1';
		else if (cont00 = 575000000) then
			acai(1) <= '0';
			acai(0) <= '1';
			guarana(0) <= '0';
			cont00 <= 1;		
		end if;
		end if;
	 if (acai(0) = '1') then
		guarana(2) <= '1';
		if (cont00 = 500000000) then
			guarana(2) <= '0';
			guarana(1) <= '1';
		else if (cont00 = 575000000) then
			guarana(1) <= '0';
			acai(0) <= '0';
			cont00 <= 1;
		end if;
	end if;
	cont00 <= cont00 + 1;
else if (sw(0) = '0' and sw(1) = '1') then	-- B (01)
	cont00 <= 1;
	cont10 <= 1;
	if (acai(0) = '0') then
		acai(2) <= '1';
		guarana(0) <= '1';
		if (cont01 = 750000000) then
			acai(2) <= '0';
			acai(1) <= '1';
		else if (cont01 = 825000000) then
			acai(1) <= '0';
			acai(0) <= '1';
			guarana(1) <= '0';
			cont01 <= 1;		
		end if;
		end if;
	 if (acai(0) = '1') then
		guarana(2) <= '1';
		if (cont01 = 250000000) then
			guarana(2) <= '0';
			guarana(1) <= '1';
		else if (cont01 = 325000000) then
			guarana(1) <= '0';
			guarana(0) <= '1';
			acai(0) <= '0';
			cont01 <= 1;
		end if;
	end if;
	cont01 <= cont01 + 1;
  end if;
  end if;
end process;
end architecture;
						
						
				