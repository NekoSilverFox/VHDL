LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity vhd9_2 is
port ( d, c1, c2, r: in std_logic;
       q1, q2, q3: inout std_logic;
       q4: out std_logic);
end vhd9_2;

architecture behav of vhd9_2 is
begin
    process(r,d,c1, c2)
    begin
        if r='1' then
        if c1='1' then
            q1<=d;
            q3<=q2;
        end if;
		if c2='1' then
            q2<=q1;
            q4<=q3;
        end if;
        else q1<='0';
             q2<='0';
             q3<='0';
             q4<='0';
        end if;
    end process;
end behav;


