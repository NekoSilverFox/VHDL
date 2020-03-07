library IEEE;
use IEEE.std_logic_1164.ALL;

entity lab11_7 is
                      port( x : in  std_logic_vector(2 downto 0);
                     x3 : in  std_logic; 
                     f1 : inout  std_logic; 
                     f2 : inout  std_logic; 

                     f : inout  std_logic_vector(15 downto 0));
end lab11_7;

architecture behav of lab11_7 is

component dc
                   port(  a  :  in  std_logic_vector(2 downto 0);
         q  :  inout  std_logic_vector(7 downto 0)  );
end component;

component dcand		-- c <= a and b
                        port(  a  :  in std_logic;
                        b  :  in  std_logic;
                        c  :  inout  std_logic  );
end component;

component dcor		-- m <= k or l
                          port(  k  :  in  std_logic;
                           l  :  in  std_logic;
                           m  :  inout  std_logic  );
end component;

component dcnot		-- s <= not p
                            port(  p  :  in  std_logic;
                            s  :  inout  std_logic  );
end component;

signal y : std_logic_vector(5 downto 0);
signal z : std_logic;

begin	
 or1: dcor
     port map (x(0), x3, y(0));
 or2: dcor
     port map (x(1), x3, y(1));
 or3: dcor
    port map (x(2), x3, y(2));
 and1: dcand
    port map (x(0), x3, y(3));
 and2: dcand
    port map (x(1), x3, y(4));
 and3: dcand
    port map (x(2), x3, y(5));
 decoder1: dc
    port map (y(5 downto 3), f(15 downto 8));	
 decoder2: dc
    port map (y(2 downto 0), f(7 downto 0));
 not1: dcnot
    port map (x3, z);
 or4: dcor
    port map (f(8), z, f2);
 or5: dcor
    port map (f(7), x3, f1);
end behav;

