transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_1/4bitsBCD {D:/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_1/4bitsBCD/bcd_4bits.sv}

vlog -sv -work work +incdir+D:/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_1/4bitsBCD {D:/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_1/4bitsBCD/bcd_4bits_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  bcd_4bits_tb

add wave *
view structure
view signals
run -all
