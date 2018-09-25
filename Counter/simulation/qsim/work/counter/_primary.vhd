library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        e               : in     vl_logic_vector(2 downto 0);
        s               : in     vl_logic_vector(2 downto 0);
        n               : out    vl_logic_vector(2 downto 0)
    );
end counter;
