library verilog;
use verilog.vl_types.all;
entity contador_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        E               : in     vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end contador_vlg_sample_tst;
