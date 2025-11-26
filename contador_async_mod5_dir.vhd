library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_async_mod5_dir is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC; -- reset externo  asincrónico
        up_down  : in  STD_LOGIC; --Dirección de conteo: 1: progresivo, 0: regresivo
        Q        : out STD_LOGIC_VECTOR (2 downto 0)
    );
end contador_async_mod5_dir;

architecture Behavioral of contador_async_mod5_dir is
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0); --  estado interno del contador
    signal reset_logic : STD_LOGIC; --activa el reset cuando se detecta 101
begin
    -- Lógica para detectar el estado "101" (decimal 5)
    reset_logic <= Q_int(2) and not Q_int(1) and Q_int(0); --Cuando se cumple, fuerza el contador a 000

    -- FF0: controlado por clk
    process(clk, reset, reset_logic)
    begin
        if reset = '1' or reset_logic = '1' then
            Q_int(0) <= '0';
        elsif falling_edge(clk) then
            Q_int(0) <= not Q_int(0);
        end if;
    end process;

    -- FF1: controlado por Q0
    process(Q_int(0), reset, reset_logic)
    begin
        if reset = '1' or reset_logic = '1' then
            Q_int(1) <= '0';
        elsif falling_edge(Q_int(0)) then
            if up_down = '1' then -- progresivo cuando Q0 baja de 1 a 0
                if Q_int(0) = '1' then
                    Q_int(1) <= not Q_int(1);
                end if;
            else -- regresivo cuando Q0 baja de 0 a 1
                if Q_int(0) = '0' then
                    Q_int(1) <= not Q_int(1);
                end if;
            end if;
        end if;
    end process;

    -- FF2: controlado por Q1
    process(Q_int(1), reset, reset_logic)
    begin
        if reset = '1' or reset_logic = '1' then
            Q_int(2) <= '0';
        elsif falling_edge(Q_int(1)) then
            if up_down = '1' then -- progresivo
                if Q_int(1) = '1' then
                    Q_int(2) <= not Q_int(2);
                end if;
            else -- regresivo
                if Q_int(1) = '0' then
                    Q_int(2) <= not Q_int(2);
                end if;
            end if;
        end if;
    end process;

    Q <= Q_int;
end Behavioral;
