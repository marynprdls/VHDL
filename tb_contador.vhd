library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_contador is
end tb_contador;

architecture Behavioral of tb_contador is
    signal clk      : STD_LOGIC := '0';
    signal reset    : STD_LOGIC := '0';
    signal up_down  : STD_LOGIC := '1'; -- empieza progresivo
    signal Q        : STD_LOGIC_VECTOR(2 downto 0);

    component contador_async_mod5_dir
        Port (
            clk      : in  STD_LOGIC;
            reset    : in  STD_LOGIC;
            up_down  : in  STD_LOGIC;
            Q        : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

begin
    uut: contador_async_mod5_dir
        port map (
            clk     => clk,
            reset   => reset,
            up_down => up_down,
            Q       => Q
        );

    -- Generador de reloj: 13 kHz → período ≈ 76.9 µs
    clk_process : process
    begin
        clk <= '0';
        wait for 38.45 us;
        clk <= '1';
        wait for 38.45 us;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset inicial
        reset <= '1';
        wait for 100 us;
        reset <= '0';

        -- Conteo progresivo
        up_down <= '1';
        wait for 500 us;

        -- Conteo regresivo
        up_down <= '0';
        wait for 500 us;

        -- Fin de simulación
        wait;
    end process;
end Behavioral;
