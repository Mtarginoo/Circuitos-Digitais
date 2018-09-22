onerror {quit -f}
vlib work
vlog -work work Dec7Seg.vo
vlog -work work Dec7Seg.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Dec7Seg_vlg_vec_tst
vcd file -direction Dec7Seg.msim.vcd
vcd add -internal Dec7Seg_vlg_vec_tst/*
vcd add -internal Dec7Seg_vlg_vec_tst/i1/*
add wave /*
run -all
