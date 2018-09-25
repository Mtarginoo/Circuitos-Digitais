library verilog;
use verilog.vl_types.all;
entity counter_vlg_sample_tst is
    port(
        e               : in     vl_logic_vector(2 downto 0);
        s               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end counter_vlg_sample_tst;
