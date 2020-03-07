library ieee;
use ieee.std_logic_1164.all;

entity dtm_vhdl is
	port(
		i: in std_logic_vector(7 downto 0);
		e: in std_logic_vector(8 downto 0);
		o: out std_logic_vector(7 downto 0);
		ik: in std_logic; ok: out std_logic
	);
end dtm_vhdl;

architecture beh of dtm_vhdl is
begin
	o(0) <= i(0) xor e(0);
	o(1) <= i(1) xor e(1);
	o(2) <= i(2) xor e(2);
	o(3) <= i(3) xor e(3);
	o(4) <= i(4) xor e(4);
	o(5) <= i(5) xor e(5);
	o(6) <= i(6) xor e(6);
	o(7) <= i(7) xor e(7);
	ok <= ik xor e(8);
end beh;
