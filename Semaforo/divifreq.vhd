library ieee;
use ieee.std_logic_1164.all;

entity divifreq is 
	port (clock_in : in std_logic;
			clock_out : out std_logic);
			
end divifreq;

architecture divisora of divifreq is
signal contagem : integer range 1 to 250000000;
signal estado : std_logic;
component sistema is
	port (clock: in std_logic;
			sw: in std_logic_vector(1 downto 0);
			sensor: in std_logic_vector(1 downto 0);
			acai: out std_logic_vector(2 downto 0);
			guarana: out std_logic_vector(2 downto 0);
			adequado, inadequado: out std_logic);
end component;			
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
		p1: sistema port map()
end divisora;		
			