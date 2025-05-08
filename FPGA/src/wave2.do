onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal sim:/tb/c1/BAUD_RATE
add wave -noupdate -radix decimal sim:/tb/c1/block_WIDTH
add wave -noupdate -radix decimal sim:/tb/c1/CACHE_LINE_WIDTH
add wave -noupdate -radix decimal sim:/tb/c1/CLK_RATE
add wave -noupdate -radix decimal sim:/tb/c1/DATA_WIDTH
add wave -noupdate -radix unsigned sim:/tb/c1/DWIDTH
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_clk
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_rst_n
add wave -noupdate -radix octal sim:/tb/c1/i_cache_line
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_icache_rdata
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_icache_rready
add wave -noupdate -radix decimal sim:/tb/c1/i_mem_read_done
add wave -noupdate -radix decimal sim:/tb/c1/i_mem_write_done
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_dcache_rdata
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_dcache_rready
add wave -noupdate -radix decimal sim:/tb/c1/i_riscv_core_dcache_wresp
add wave -noupdate -radix decimal sim:/tb/c1/o_riscv_core_dcache_raddr_axi
add wave -noupdate -radix decimal sim:/tb/c1/o_riscv_core_dcache_raddr_valid
add wave -noupdate -radix decimal sim:/tb/c1/o_riscv_core_dcache_waddr
add wave -noupdate -radix decimal sim:/tb/c1/o_mem_read_address
add wave -noupdate -radix decimal sim:/tb/c1/o_mem_read_req
add wave -noupdate -radix decimal sim:/tb/c1/o_mem_write_address
add wave -noupdate -radix decimal sim:/tb/c1/o_mem_write_valid
add wave -noupdate -radix decimal sim:/tb/c1/o_riscv_core_dcache_wvalid
add wave -noupdate -radix decimal sim:/tb/c1/o_riscv_core_icache_raddr_axi
add wave -noupdate sim:/tb/rst_n
add wave -noupdate sim:/tb/clk
add wave -noupdate sim:/tb/fd
add wave -noupdate sim:/tb/rv
add wave -noupdate sim:/tb/rst_n
add wave -noupdate sim:/tb/clk
add wave -noupdate sim:/tb/fd
add wave -noupdate sim:/tb/rv
add wave -noupdate sim:/tb/rst_n
add wave -noupdate sim:/tb/clk
add wave -noupdate sim:/tb/fd
add wave -noupdate sim:/tb/rv
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3014765 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 270
configure wave -valuecolwidth 84
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {3014564 ps} {3019256 ps}
