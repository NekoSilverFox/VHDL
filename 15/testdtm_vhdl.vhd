library ieee;
use ieee.std_logic_1164.all;

entity testdtm_vhdl is
	port(
		x: in std_logic_vector(7 downto 0);
		e: in std_logic_vector (8 downto 0);
		odd, even: out std_logic;
		o: out std_logic_vector (7 downto 0)
	);
end testdtm_vhdl;

architecture beh of testdtm_vhdl is
	component dtm_vhdl
		port(
			i: in std_logic_vector(7 downto 0);
			e: in std_logic_vector(8 downto 0);
			o: out std_logic_vector(7 downto 0);
			ik: in std_logic; ok: out std_logic
		);
	end component;

	component odd_8_vhdl
		port(
			x: in std_logic_vector(7 downto 0);
			d: in std_logic;
			o, e: out std_logic
		);
	end component;

	signal gnd: std_logic;
	signal uu: std_logic_vector(8 downto 0);
	signal k: std_logic;
begin
	gnd <= '0';

	u0: odd_8_vhdl
		port map(x, gnd, open, k);

	data: dtm_vhdl
		port map(x, e, uu(7 downto 0), k, uu(8));

	u1: odd_8_vhdl
		port map(uu(7 downto 0), uu(8), odd, even);

	o <= uu(7 downto 0);
end beh;
