library ieee;
use ieee.std_logic_1164.all;

entity Dec7Seg is
	port(s2, s1, s0 : in std_logic;
		a, b, c, d, e, f, g : out std_logic);
end Dec7Seg;

architecture estrutura of dec7Seg is
signal a1, a2, b1, d1, d2, d3, d4, e1, e2, f1, f2, f3, g1, g2, g3: std_logic;
begin
 a <= (not(s2)and not(s0)) or (s2 and s0) or s1;
 b <= not(s2) or (not(s1) and not(s0)) or s1;
 c <= not(s1) or s2 or s0;
 d <= (not(s2) and not(s0)) or (not(s2) and s1) or (s2 and not(s1) and s0) or (s1 and not(s0));
 e <= (not(s2) and not(s0)) or (s1 and not(s0));
 f <= (not(s1) and not(s0)) or (s2 and not(s1)) or (s2 and not(s0));
 g <= (not(s2) and s1) or (s2 and not(s1)) or (s1 and not(s0));
end estrutura; 