library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity lifo_code is
	port (DI : in std_logic_vector(7 downto 0);
		 WR,RD, Reset: in std_logic;
   	     DO : out std_logic_vector(7 downto 0);
		  full, empty : out std_logic);
end lifo_code;

architecture behav of lifo_code is
type wordsArray is array (0 to 7) of std_logic_vector(7 downto 0);
signal outWord : std_logic_vector(7 downto 0);
signal words : wordsArray;
signal tmp : wordsArray;
signal tmpClock : std_logic;
signal isEmpty : std_logic;
signal isFull : std_logic;
begin
	tmpClock <= WR or RD;
    process(tmpClock, reset)
    variable counter : integer range 0 to 7 := 0;
    variable rdCounter : integer range 0 to 7 := 0;
	begin
    if(Reset = '1') then
      counter := 0;
    else
    	if rising_edge(tmpClock) then
    		if(WR = '1') then   			
        		words(counter) <= DI;
        		counter := counter + 1;
        		if counter > 7 then
        			counter := 0;
        		end if;
      		end if;
   			if(RD = '1') then 
   			counter := counter - 1;
       			outWord <= words(counter);      			
       			if counter < 0 then
       				counter := 7;
       			end if;
     		end if;
     		if counter = 7 then
     			isFull <= '1';
     			isEmpty <= '0';
     		elsif counter = 0 then
     			isFull <= '0';
     			isEmpty <= '1';
     		else
     			isFull <= '0';
     			isEmpty <= '0';
     		end if;
     	end if;
    end if;
    end process;
    DO <= outWord;
    full <= isFull;
    empty <= isEmpty;
 end behav;

