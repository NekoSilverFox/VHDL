library IEEE;
use IEEE.std_logic_1164.ALL;

entity coder2 is
              port (  ei  :  in std_logic;
                  e0  :  out std_logic;
                enable:  in std_logic;
                r  :  in std_logic_vector(15 downto 0);
                a  :  out std_logic_vector(3 downto 0));
					end coder2;

architecture behav of coder2 is
begin
      process (r,enable)
	begin
		if (enable='0') then a <= "0000";
		else
		e0 <= not(r(0) or r(1) or r(2) or r(3) or r(4) or r(5) or r(6) or r(7) or r(8) or r(9) or r(10) or r(11) or r(12) or r(13) or r(14) or r(15)) and ei;
			case r is
				when "0000000000000001" => a <="0000";
				when "0000000000000010" => a <="0001";
				when "0000000000000100" => a <="0010";
				when "0000000000001000" => a <="0011";
				when "0000000000010000" => a <="0100";
				when "0000000000100000" => a <="0101";
				when "0000000001000000" => a <="0110";
				when "0000000010000000" => a <="0111";
                when "0000000100000000" => a <="1000";
                when "0000001000000000" => a <="1001";
                when "0000010000000000" => a <="1010";
                when "0000100000000000" => a <="1011";
                when "0001000000000000" => a <="1100";
                when "0010000000000000" => a <="1101";
                when "0100000000000000" => a <="1110";
                when "1000000000000000" => a <="1111";
				when others => a <="0000";
			end case;
		end if;
	end process;
end behav;

