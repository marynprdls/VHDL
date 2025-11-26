library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Para un contador binario progresivo:

--Q0: siempre cambia → J0 = 1, K0 = 1

--Q1: cambia cuando Q0 = 1 → J1 = K1 = Q0

--Q2: cambia cuando Q1·Q0 = 1 → J2 = K2 = Q1 and Q0
entity contador_sync_3bit is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR (2 downto 0)
    );
end contador_sync_3bit;

architecture Structural of contador_sync_3bit is
    component FF_JK
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            J      : in  STD_LOGIC;
            K      : in  STD_LOGIC;
            Q      : out STD_LOGIC
        );
    end component;

    signal Q0, Q1, Q2 : STD_LOGIC;

begin
    -- FF0: LSB, siempre toggle
    FF0: FF_JK port map(clk, reset, enable, '1', '1', Q0);

    -- FF1: cambia cuando Q0 = 1
    FF1: FF_JK port map(clk, reset, enable, Q0, Q0, Q1);

    -- FF2: cambia cuando Q1 and Q0 = 1
    FF2: FF_JK port map(clk, reset, enable, Q1 and Q0, Q1 and Q0, Q2);

    Q <= Q2 & Q1 & Q0;
end Structural;
