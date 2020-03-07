library ieee;
use ieee.std_logic_1164.all;

entity comp_4_vhdl is
	port(
		x, y: in std_logic_vector(3 downto 0);
		
		xmy0, xey0, xly0: in std_logic;
		xmy, xey, xly: out std_logic
	);
end comp_4_vhdl;

architecture beh of comp_4_vhdl is
	component comp_2_vhdl_pov
		port(
			x, y: in std_logic_vector(1 downto 0);
		
			xmy0, xey0, xly0: in std_logic;
			xmy, xey, xly: out std_logic
		);
	end component;

	signal xmy1, xey1, xly1: std_logic;
begin
	u0: comp_2_vhdl_pov
		port map (x(1 downto 0), y(1 downto 0), xmy0, xey0, xly0, xmy1, xey1, xly1);

	u1: comp_2_vhdl_pov
		port map (x(3 downto 2), y(3 downto 2), xmy1, xey1, xly1, xmy, xey, xly);
end beh;

configuration config of comp_4_vhdl is
	for beh
		for u0, u1: comp_2_vhdl_pov
			use entity work.comp_2_vhdl(beh);
		end for;
	end for;
end config;
