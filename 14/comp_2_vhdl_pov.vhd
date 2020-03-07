library ieee;
use ieee.std_logic_1164.all;

entity comp_2_vhdl_pov is
	port(
		x, y: in std_logic_vector(1 downto 0);
		
		xmy0, xey0, xly0: in std_logic;
		xmy, xey, xly: out std_logic
	);
end comp_2_vhdl_pov;

architecture beh of comp_2_vhdl_pov is
	signal xmy1, xey1, xly1: std_logic;
begin
	process(x, y)
	begin
		if x = y then
			xey1 <= '1';
			xmy1 <= '0';
			xly1 <= '0';
		elsif x > y then
			xey1 <= '0';
			xmy1 <= '1';
			xly1 <= '0';
		else
			xey1 <= '0';
			xmy1 <= '0';
			xly1 <= '1';
		end if;
	end process;

	process(xey0, xey1, xly0, xly1, xmy0, xly0)
	begin
		xey <= xey0 and xey1;
		xly <= (xly0 and xey1) or xly1;
		xmy <= (xmy0 and xey1) or xmy1;
	end process;
end beh;
