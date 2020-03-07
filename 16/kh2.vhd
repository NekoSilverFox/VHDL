library IEEE;
use ieee.std_logic_1164.all;
entity kh2 is
port(x: in std_logic_vector (3 downto 0);
     o: out std_logic_vector (7 downto 0));
end kh2;
architecture behavior of kh2 is
signal k1,k2,k3: std_logic;
begin
k1<= x(0) xor x(1) xor x(3);
k2<= x(0) xor x(2) xor x(3);
k3<= x(1) xor x(2) xor x(3);
o(0)<= k1;
o(1)<= k2;
o(2)<= x(0);
o(3)<= k3;
o(4)<= x(1);
o(5)<= x(2);
o(6)<= x(3);
o(7)<= k1 xor k2 xor x(0) xor k3 xor x(1) xor x(2) xor x(3);
end behavior;

