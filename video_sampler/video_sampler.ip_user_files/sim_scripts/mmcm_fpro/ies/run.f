-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro_clk_wiz.v" \
  "../../../../video_sampler.srcs/sources_1/ip/mmcm_fpro/mmcm_fpro.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

