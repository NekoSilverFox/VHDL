LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity vhd9_3 is
port( X1,X2,X3,X4, write,read,reset :in std_logic;
		DopQ1,DopQ2,DopQ3,DopQ4:INOUT std_logic;
		Q1,Q2,Q3,Q4: OUT std_logic
);
end vhd9_3;

architecture behav of vhd9_3 is
begin
	process(X1,X2,X3,X4, read,write, reset)
	begin
		if reset = '1' then
			if write = '1' then
				DopQ1<=X1;
				DopQ2<=X2;
				DopQ3<=X3;
				DopQ4<=X4;
			end if;
		else
			DopQ1<='0';
			DopQ2<='0';
			DopQ3<='0';
			DopQ4<='0';
		end if;
		if read = '1' then
			Q1<=DopQ1;
			Q2<=DopQ2;
			Q3<=DopQ3;
			Q4<=DopQ4;
		else
			Q1<='0';
			Q2<='0';
			Q3<='0';
			Q4<='0';
		end if;

	end process;
end behav;

