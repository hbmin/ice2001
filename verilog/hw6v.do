#
# File name : hw6v.do
# Description : Tcl script for Modelsim and QuestaSim for Verilog simulation.
#
# You may do simulation by the following 3 steps.
# (1) Download 3 files, hw6.v, hw6tb.v, and hw6v.do to a folder.
# (2) Open text shell such as Windows command prompt or Windows PowerShell,
#     and get into the downloaded folder at step (1).
# (3) Enter the following command.
#     vsim -c -do hw6v.do
#

# Which simulator do you use?
# (1) QuestaSim or Modelsim?
set is_questa [string match -nocase *questa* [vsimVersionString]]; list
# (2) vsimId: vsim version.
set is_theid [expr {[vsimId] == 2021.2}]; list

# Begin simulation.
    echo DO: Creating project hw6v_project at working directory
project new . hw6v_project
    echo DO: Adding two Verilog code files to the project
project addfile hw6.v
project addfile hw6tb.v
    echo DO: Compiling hw6.v
vlog hw6.v
    echo DO: Compiling hw6tb.v
vlog hw6tb.v
    echo DO: Preparing simulation : Elaboration
if { $is_questa && $is_theid } {
    # QuestaSim performs design optimization by default for faster simulation.
    # But, the optimization does not work with debugging such as 'add wave'.
    # 'add wave' command gives vish-4014 error with the optimization.
    # To prevent this error, we need optimization with '+acc' option
    # so that 'add wave' works with the optimization.
    # Refer to page 91 of QuestaSim User's Manual for this topic.
    vsim work.hw6tb -voptargs=+acc
} else {
    vsim work.hw6tb
}
    echo DO: Preparing simulation : Add objects for waveform data collection
add wave -r -depth 1 *
    echo DO: Simulation run begins
run 200 ns
exit

