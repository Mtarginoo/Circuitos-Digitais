library verilog;
use verilog.vl_types.all;
entity Dec7Seg is
    port(
        s2              : in     vl_logic;
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        a               : out    vl_logic;
        b               : out    vl_logic;
        c               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        f               : out    vl_logic;
        g               : out    vl_logic
    );
end Dec7Seg;
