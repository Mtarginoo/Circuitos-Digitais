library verilog;
use verilog.vl_types.all;
entity Dec7Seg_vlg_sample_tst is
    port(
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Dec7Seg_vlg_sample_tst;
