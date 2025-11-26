library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_contador_sync_3bit is
end tb_contador_sync_3bit;

architecture Behavioral of tb_contador_sync_3bit is
    signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '0';
    signal enable : STD_LOGIC := '1';
    signal Q      : STD_LOGIC_VECTOR(2 downto 0);

    component contador_sync_3bit
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            Q      : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

begin
    uut: contador_sync_3bit
        port map (
            clk    => clk,
            reset  => reset,
            enable => enable,
            Q      => Q
        );

    -- Generador de reloj
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        reset <= '1';
        wait for 30 ns;
        reset <= '0';

        wait for 200 ns;

        enable <= '0'; -- pausa
        wait for 40 ns;

        enable <= '1'; -- reanuda
        wait for 100 ns;

        wait;
    end process;
end Behavioral;
