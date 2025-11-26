library ieee;

use ieee.std_logic_1164.ALL;

entity ejemplo1 is
port(
 A : in std_logic_vector(3 downto 0);
 S : in std_logic_vector (1 downto 0);
 Z : out std_logic
);
end entity;

architecture arch1 of ejemplo1 is
begin

 miand:
	process(A,S) is 
		
	begin 
	--
--		if S="00" then
--			Z <=A(0);
--		elsif S="01" then
--			Z<=A(1);
--		elsif S="10" then
--			Z<=A(2);
--		else
--			Z<= A(3);
--		end if;

case S is
	when "00" =>Z <=A(0);
	when S="01" =>Z<=A(1);
	when S="10" =>Z<=A(2);
	
	when others =>
		Z<=A(3);
end case;

			
	end process;
end architecture;
