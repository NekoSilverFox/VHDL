library ieee;
use ieee.std_logic_1164.all;

entity odd_8_vhdl is
	port(
		x: in std_logic_vector(7 downto 0);
		d: in std_logic;
		o, e: out std_logic
	);
end odd_8_vhdl;

architecture beh of odd_8_vhdl is
	component odd_2_vhdl_pov
		port(
			x0, x1, d: in std_logic;
			e: out std_logic;
			o: out std_logic
		);
	end component;

	signal gnd: std_logic;
	signal uu: std_logic_vector(3 downto 0);
	signal uuu: std_logic_vector(1 downto 0);
begin
	gnd <= '0';
	
	u0: odd_2_vhdl_pov
		port map(x(1), x(0), gnd, uu(0), open);

	u1: odd_2_vhdl_pov
		port map(x(3), x(2), gnd, uu(1), open);

	u2: odd_2_vhdl_pov
		port map(x(5), x(4), gnd, uu(2), open);

	u3: odd_2_vhdl_pov
		port map(x(7), x(6), gnd, uu(3), open);

	uu0: odd_2_vhdl_pov
		port map(uu(1), uu(0), gnd, uuu(0), open);

	uu1: odd_2_vhdl_pov
		port map(uu(3), uu(2), gnd, uuu(1), open);

	uuu0: odd_2_vhdl_pov
		port map(uuu(1), uuu(0), d, e, o);
end beh;

