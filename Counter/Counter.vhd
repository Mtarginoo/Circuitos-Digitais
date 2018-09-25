library ieee;
use ieee.std_logic_1164.all;

entity Counter is 
		port(
			e: in std_logic_vector (2 downto 0);
			s: in std_logic_vector (2 downto 0);
			n: out std_logic_vector (2 downto 0));
end Counter;

architecture hardware of Counter is
begin
		n(2)<=(not(s(2)) and not(s(1)) and not(s(0)) and e(0) and not(e(2))) or (not(s(2))and s(1) and s(0) and e(0) and e(2)) or (s(2) and not(s(1)) and s(0) and e(1)) or (s(2) and not(s(1)) and e(0) and e(2)) or (s(2) and not(s(0))and e(0) and e(2)) or (s(2) and not(e(0))and e(1)) or (s(2) and s(1) and e(0) and not(e(2)));
		n(1)<=(not(s(1))and not(s(0)) and e(0) and not(e(2))) or (not(s(1)) and s(0) and e(0) and e(2)) or (s(1) and not(s(0)) and e(0) and e(2)) or (s(1) and not(e(0)) and e(1)) or (s(1) and s(0) and e(0) and not(e(2)));
		n(0)<=(not(s(0)) and e(0)) or (s(0) and not(e(0)) and e(1)); 
end hardware;
		