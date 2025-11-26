library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_JK is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        J      : in  STD_LOGIC;
        K      : in  STD_LOGIC;
        Q      : out STD_LOGIC
    );
end FF_JK;

architecture Behavioral of FF_JK is
    signal Q_int : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Q_int <= '0';
        elsif falling_edge(clk) then
            if enable = '1' then
					if J = '0' and K = '0' then
						 Q_int <= Q_int; -- mantener estado
					elsif J = '0' and K = '1' then
						 Q_int <= '0';
					elsif J = '1' and K = '0' then
						 Q_int <= '1';
					elsif J = '1' and K = '1' then
						 Q_int <= not Q_int;
					end if;

            end if;
        end if;
    end process;
    Q <= Q_int;
end Behavioral;
