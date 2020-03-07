library ieee;
use ieee.std_logic_1164.all;

entity odd_2_vhdl_pov is
	port(
		x0, x1, d: in std_logic;
		o, e: out std_logic
	);
end odd_2_vhdl_pov;

architecture beh of odd_2_vhdl_pov is
begin
	e <= not (x0 xor x1 xor d);
	o <= x0 xor x1 xor d;
end beh;
