library ieee;
use ieee.std_logic_1164.ALL;
entity jktr is
    port( j,k,s,r:in std_logic;
          q,qi:out std_logic);
end jktr;
architecture behavior of jktr is
signal i1,i2,i3,i4,i5,i6,i7,i8,i9,i10:std_logic;
       begin
process(j,k,s,r)
	begin
		i1<=not (j and i10);
		i2<=not (k and i9);
		i3<= s and i1;
		i4<= r and i2;
		i5<= not (i3 and i6);
		i6<= not (i4 and i5);
		i7<= not ((not k) and i5);
		i8<= not ((not k) and i6);
		i9<= not (i7 and i10);
		i10<= not (i9 and i8);
		q<=i5;
		qi<=i6;
	end process;

end behavior;




