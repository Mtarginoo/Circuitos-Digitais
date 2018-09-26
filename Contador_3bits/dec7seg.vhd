library ieee;
use ieee.std_logic_1164.all;

entity Dec7Seg is
	port(s2, s1, s0 : in std_logic;
		a, b, c, d, e, f, g : out std_logic);
end Dec7Seg;

architecture estrutura of Dec7Seg is
begin
 a <= ((not(s2) and not(s1) and s0) or (s2 and not(s1) and not(s0)));
 b <= ((s2 and not(s1) and s0)or(s2 and s1 and not(s0)));
 c <= (not(s2) and s1 and not(s0));
 d <= ((not(s2) and not(s1) and s0) or (s2 and not(s1) and not(s0)) or (s2 and s1 and s0));
 e <= not((not(s2) and not(s1) and not(s0)) or (not(s2) and s1 and not(s0)) or (s2 and s1 and not(s0)));
 f <= ((not(s2) and not(s1) and s0) or (not(s2) and s1 and not(s0)) or (not(s2) and s1 and s0) or (s2 and s1 and s0));
 g <= ((not(s2) and not(s1) and not(s0)) or (not(s2) and not(s1) and s0) or (s2 and s1 and s0));
end estrutura; 
