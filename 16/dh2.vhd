library IEEE;
use ieee.std_logic_1164.all;
entity dh2 is
port(i: in std_logic_vector (7 downto 0);
     o: out std_logic_vector (3 downto 0);
     ONE: out std_logic;
     DBL: out std_logic);
end dh2;
architecture behavior of dh2 is
signal p1,p2,p3,KP: std_logic;
begin
p1<= i(0) xor i(2) xor i(4) xor i(6);
p2<= i(1) xor i(2) xor i(5) xor i(6);
p3<= i(3) xor i(4) xor i(5) xor i(6);
KP<= i(0) xor i(1) xor i(2) xor i(3) xor i(4) xor i(5) xor i(6) xor i(7);
ONE<= KP and (p1 or p2 or p3);
DBL<= not(KP or not(p1 or p2 or p3));
o(0)<= i(2) xor (KP and (not p3 and p2 and p1));
o(1)<= i(4) xor (KP and (p3 and not p2 and p1));
o(2)<= i(5) xor (KP and (p3 and p2 and not p1));
o(3)<= i(6) xor (KP and (p3 and p2 and p1));
end behavior;

