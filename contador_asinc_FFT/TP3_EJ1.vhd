library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TP3_EJ1 is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (2 downto 0)
    );
end TP3_EJ1;

architecture contador_async_3bit of TP3_EJ1 is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0); --es la señal interna que representa el estado del contador.
begin
    -- FF0: controlado por clk
    process(clk, reset)
    begin
        if reset = '1' then
            Q_int(0) <= '0';  -- Se activa con el flanco descendente de clk
        elsif falling_edge(clk) then
            Q_int(0) <= not Q_int(0);-- Cambia su estado (toggle) si reset no está activo
        end if;
    end process;
	 
	 -- FF1: controlado por Q0
    process(Q_int(0), reset)
    begin
        if reset = '1' then
            Q_int(1) <= '0';
        elsif falling_edge(Q_int(0)) then
            Q_int(1) <= not Q_int(1);  --  Se activa con el flanco descendente de Q0
        end if;
    end process;
	 
	  -- FF2: controlado por Q1
    process(Q_int(1), reset)
    begin
        if reset = '1' then
            Q_int(2) <= '0';
        elsif falling_edge(Q_int(1)) then
            Q_int(2) <= not Q_int(2); -- Se activa con el flanco descendente de Q1
        end if;
    end process;

    Q <= Q_int; -- Conecta la señal interna Q_int a la salida Q
end contador_async_3bit;