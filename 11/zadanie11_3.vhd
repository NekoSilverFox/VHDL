library ieee; 
use ieee.std_logic_1164.all; 
entity zadanie11_3 is 
port(x:in std_logic_vector(2 downto 0); 
y:out std_logic_vector(7 downto 0)); 
end entity zadanie11_3; 
architecture a of zadanie11_3 is 
signal x: std_logic_vector(2 downto 0);
begin with x select 
y<="00000010" when "001", 
"00000100" when "010", 
"00001000" when "011", 
"00010000" when "100", 
"00100000" when "101", 
"01000000" when "110", 
"10000000" when "111", 
"00000001" when others; 
end a; 
