#
# File name : hw6vhd.do
# Description : Tcl script for Modelsim and QuestaSim for VHDL simulation.
#
# You may do simulation by the following 3 steps.
# (1) Download 3 files, hw6.vhd, hw6tb.vhd, and hw6vhd.do to a folder.
# (2) Open text shell such as Windows command prompt or Windows PowerShell,
#     and get into the downloaded folder at step (1).
# (3) Enter the following command.
#     vsim -c -do hw6vhd.do
#
    echo DO: Creating project hw6vhd_project at working directory
project new . hw6vhd_project
    echo DO: Adding two VHDL code files to the project
project addfile hw6.vhd
project addfile hw6tb.vhd
    echo DO: Compiling hw6.vhd
vcom hw6.vhd
    echo DO: Compiling hw6tb.vhd
vcom hw6tb.vhd
    echo DO: Preparing simulation : Elaboration
vsim work.hw6tb
    echo DO: Preparing simulation : Add objects for waveform data collection
add wave -r -depth 1 *
    echo DO: Simulation run begins
run 200 ns
exit

