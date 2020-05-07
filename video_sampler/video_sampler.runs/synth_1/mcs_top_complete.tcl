# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config  -ruleid {1}  -id {[BD 41-1306]}  -suppress 
set_msg_config  -ruleid {2}  -id {[BD 41-1271]}  -suppress 
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/matta/Vivado_projects/video_sampler/video_sampler.cache/wt [current_project]
set_property parent.project_path C:/Users/matta/Vivado_projects/video_sampler/video_sampler.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/matta/Vivado_projects/video_sampler/video_sampler.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_io_map.svh
set_property file_type "Verilog Header" [get_files C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_io_map.svh]
read_verilog -library xil_defaultlib -sv {
  C:/Users/matta/Desktop/video_sampler_files/Hardware/adsr.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/bar_src.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/baud_gen.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/bram_fifo_fpro.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_adsr_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_ddfs_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_debounce_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_frame_buffer_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_gpi.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_gpo.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_i2c_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_io_pwm_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_led_mux_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_mcs_bridge.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_mmio_controller.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_ps2_core.sv
  {C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_rgb2gray_core .sv}
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_spi_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_timer.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_uart.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_bar_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_dummy_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_osd_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_sprite_ghost_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_sprite_mouse_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_vga_sync_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_video_controller.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/chu_xadc_core.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ddfs.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/debounce_counter.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/debounce_fsm.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ds_1bit_dac.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/fifo.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/fifo_ctrl.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/font_rom.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/frame_counter.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/frame_palette.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/frame_src.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ghost_ram.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ghost_src.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/i2c_master.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/led_mux8.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/line_buffer.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/mmio_sys_sampler.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/moue_ram.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/mouse_src.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/osd_src.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ps2_top.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ps2rx.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ps2tx.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/ram320K.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/reg_file.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/rgb2gray.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/sin_rom.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/spi.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/sync_rw_port_ram.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/uart.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/uart_rx.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/uart_tx.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/vga_sync.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/video_sys_daisy.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/xadc_fpro.sv
  C:/Users/matta/Desktop/video_sampler_files/Hardware/mcs_top_complete.sv
}
read_ip -quiet C:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/cpu.xci
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_0/bd_3914_microblaze_I_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_1/bd_3914_rst_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_2/bd_3914_ilmb_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_3/bd_3914_dlmb_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_6/bd_3914_lmb_bram_I_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/ip/ip_7/bd_3914_iomodule_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/bd_0/bd_3914_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/cpu_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/cpu/cpu_ooc.xdc]

read_ip -quiet C:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro.xci
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro.xdc]
set_property used_in_implementation false [get_files -all c:/Users/matta/Vivado_projects/video_sampler/video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/matta/Desktop/video_sampler_files/Nexys4_DDR_chu.xdc
set_property used_in_implementation false [get_files C:/Users/matta/Desktop/video_sampler_files/Nexys4_DDR_chu.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top mcs_top_complete -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mcs_top_complete.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mcs_top_complete_utilization_synth.rpt -pb mcs_top_complete_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]