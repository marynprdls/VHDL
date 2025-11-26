library IEEE;
use IEEE.std_logic_1164.all;


--La señal de control opSel selecciona la operación:

--opSel = '0' → producto

--opSel = '1' → suma
entity ALU_reducida is
  port (
    A     : in  std_logic_vector(1 downto 0);
    B     : in  std_logic_vector(1 downto 0);
    opSel : in  std_logic;
    Z     : out std_logic_vector(3 downto 0)
  );
end entity;

architecture estructural of ALU_reducida is

  -- Señales internas
  signal Z_mul, Z_sum : std_logic_vector(3 downto 0);

  -- Componentes
  component multiplicador_2bit is
    port (
      A : in  std_logic_vector(1 downto 0);
      B : in  std_logic_vector(1 downto 0);
      Z : out std_logic_vector(3 downto 0)
    );
  end component;

  component sumador_2bit is
    port (
      A : in  std_logic_vector(1 downto 0);
      B : in  std_logic_vector(1 downto 0);
      Z : out std_logic_vector(2 downto 0)
    );
  end component;

begin

  -- Instancia del multiplicador
  U1: multiplicador_2bit port map(
    A => A,
    B => B,
    Z => Z_mul
  );

  -- Instancia del sumador
  U2: sumador_2bit port map(
    A => A,
    B => B,
    Z => Z_sum(2 downto 0)
  );
  Z_sum(3) <= '0';  -- Extensión del bit más alto

  -- Selección de operación
  Z <= Z_sum when opSel = '1' else Z_mul;

end architecture;
