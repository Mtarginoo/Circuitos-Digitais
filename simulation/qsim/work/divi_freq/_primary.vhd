library verilog;
use verilog.vl_types.all;
entity divi_freq is
    port(
        clock_in        : in     vl_logic;
        clock_out       : out    vl_logic
    );
end divi_freq;
