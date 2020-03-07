library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity memory is
port( a :in std_logic_vector(1 downto 0);
d,c :in std_logic;
q :out std_logic);
end memory;

architecture behav of memory is
TYPE myType is array (0 to 3) of std_logic;
signal m :myType := (others => '0');
begin
process
variable i :integer :=0;
begin
if ( c = '1' ) then
m(conv_integer(unsigned(a))) <= d;

end if;
end process;

process
begin
q <= m( conv_integer(unsigned(a)) );
end process;
end behav;
