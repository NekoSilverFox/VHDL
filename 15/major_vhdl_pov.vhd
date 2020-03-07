library ieee;
use ieee.std_logic_1164.all;

entity major_vhdl_pov is
	port(
		x1, x2, x3: in std_logic;
		a0, a1, x: out std_logic
	);
end major_vhdl_pov;

architecture beh of major_vhdl_pov is
begin
	x <= (x1 and x2) or (x1 and x3) or (x2 and x3);
	a1 <= x2 xor x3;
	a0 <= x1 xor x3;
end beh;
