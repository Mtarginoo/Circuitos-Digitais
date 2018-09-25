library verilog;
use verilog.vl_types.all;
entity Counter_vlg_check_tst is
    port(
        n               : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end Counter_vlg_check_tst;
