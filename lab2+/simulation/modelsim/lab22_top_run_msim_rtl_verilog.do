transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/DAV\ Stuff/lab2+ {C:/DAV Stuff/lab2+/clock_divider_top.sv}
vlog -sv -work work +incdir+C:/DAV\ Stuff/lab2+ {C:/DAV Stuff/lab2+/clock_divider_tb.sv}

