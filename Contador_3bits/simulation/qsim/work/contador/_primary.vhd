library verilog;
use verilog.vl_types.all;
entity contador is
    port(
        clock           : in     vl_logic;
        S               : in     vl_logic;
        E               : in     vl_logic;
        R               : in     vl_logic;
        q               : out    vl_logic_vector(2 downto 0);
        saida           : out    vl_logic_vector(6 downto 0)
    );
end contador;
