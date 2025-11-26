library verilog;
use verilog.vl_types.all;
entity ejemplo1 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        S               : in     vl_logic_vector(1 downto 0);
        Z               : out    vl_logic
    );
end ejemplo1;
