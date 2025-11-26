library ieee;

use ieee.std_logic_1164.ALL;

entity ejemplo1 is
port(
 D : in std_logic;
 clk : in std_logic;
 clrn : in std_logic;
 Q: out std_logic
);
end entity;

architecture arch1 of ejemplo1 is
begin
ff:
	process(clrn, clk) is  
	begin 
		if(clrn = '0') then
			Q <= '0';
		elsif(rising_edge(clk)) then
			Q <= D;
		end if;
	end process; 

end architecture;