library ieee;

use ieee.std_logic_1164.ALL;

entity ejemplo1 is
port(
 A : in std_logic
 clk : in std_logic;
 clrn : in std_logic;
 Q: out std_logic
);
end entity;
-- ffd es el flip flot program en otro archivo que instancio
architecture arch1 of ffd is
-- declaro el flip flop que voy a adjuntar al programa
-- lo tengo que instanciar desde el programa
<instance_name> : <component_name> 
	generic map
	(
		<name> => <value>,
		...
	)
	port map 
	(
		<formal_input> => <expression>,
		<formal_output> => <signal>,
		<formal_inout> => <signal>,
		...
	);
begin
	


end architecture;