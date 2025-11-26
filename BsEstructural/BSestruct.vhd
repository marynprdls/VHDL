-- Componente multiplexor 4:1
entity mux4 is
    port (
        I0, I1, I2, I3 : in std_logic;
        S              : in std_logic_vector(1 downto 0);
        Y              : out std_logic
    );
end mux4;

architecture Behavioral of mux4 is
begin
    with S select
        Y <= I0 when "00",
             I1 when "01",
             I2 when "10",
             I3 when others;
end Behavioral;
