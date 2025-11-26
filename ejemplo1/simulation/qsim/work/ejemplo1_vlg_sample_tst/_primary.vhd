library verilog;
use verilog.vl_types.all;
entity ejemplo1_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        S               : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end ejemplo1_vlg_sample_tst;
