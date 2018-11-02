onerror {quit -f}
vlib work
vlog -work work Divi_freq.vo
vlog -work work Divi_freq.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Divi_freq_vlg_vec_tst
vcd file -direction Divi_freq.msim.vcd
vcd add -internal Divi_freq_vlg_vec_tst/*
vcd add -internal Divi_freq_vlg_vec_tst/i1/*
add wave /*
run -all
