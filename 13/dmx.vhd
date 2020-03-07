library ieee;
use ieee.std_logic_1164.all;

entity dmx is
port (  x  :  in std_logic_vector(1 downto 0);
	e  :  in std_logic;
	f  :  out std_logic_vector(3 downto 0)  );
end dmx;

architecture behavior of dmx is
begin
	process (x, e)
	begin
		case x is
			when "00" => f(0) <= e; f(3 downto 1) <= "000";
			when "01" => f(1) <= e; f(3 downto 2) <= "00"; f(0) <= '0';
			when "10" => f(2) <= e; f(1 downto 0) <= "00"; f(3) <= '0';
			when "11" => f(3) <= e; f(2 downto 0) <= "000";
			when others => f <= "0000";
		end case;
	end process;
end behavior;

