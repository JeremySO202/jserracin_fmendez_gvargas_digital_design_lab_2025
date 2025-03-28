transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/sum_N.sv}
vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/alu.sv}
vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/fullAdder.sv}
vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/nBitsSubstractor.sv}
vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/division.sv}

vlog -sv -work work +incdir+C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU {C:/MPointer/jserracin_fmendez_gvargas_digital_design_lab_2025/laboratorio_2/ALU/alu_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
