library ieee;
use ieee.std_logic_1164.all;
entity data2 is
port(T: in std_logic_vector (7 downto 0);
     a: in std_logic_vector (3 downto 0);
     OU: out std_logic_vector (3 downto 0);
     ONE_ERR:out std_logic;
     DBL_ERR: out std_logic);
end data2;
architecture behav of data2 is
signal g1,g2: std_logic_vector (7 downto 0);
component kh2
port(x: in std_logic_vector (3 downto 0);
     o: out std_logic_vector (7 downto 0));
end component;
component dh2
port(i: in std_logic_vector (7 downto 0);
     o: out std_logic_vector (3 downto 0);
     ONE: out std_logic;
     DBL: out std_logic);
end component;
begin
c1: kh2
    port map(a,g1);
g2<= T xor g1;
c2: dh2
    port map(g2,OU,ONE_ERR,DBL_ERR);
end behav;
configuration con of data2 is
   for behav
      for c1 : kh2
               use entity work.kh2(behavior);
      end for;
   for c2 : dh2
               use entity work.dh2(behavior);
      end for;
   end for;
end con;

