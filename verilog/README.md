
Verilog HDL Files in "verilog" folder
=====================================

* **[hw6.v](https://github.com/hbmin/ice2001/blob/master/verilog/hw6.v)**  
  &nbsp; &nbsp; 이 파일은 **74FSM의 Verilog 회로 model**을 담고 있습니다.
  이름은 숫자로 시작할 수 없어서, e74FSM으로 지었습니다.
  "e74FSM"은 3-bit counter인 "COUNTER3"와 3-bit-binary-to-7-segment converter인
  "BIN2SEG"를 사용하여 structural model로 이루어져 있으며,
  COUNTER3와 BIN2SEG는 behavioral model을 사용하였습니다.
  이 파일을 synthesis software에 입력으로 넣으면,
  gate-level 회로 혹은 FPGA 회로를 만들어 줍니다.  
  &nbsp; &nbsp; 이 파일은 synthesis를 통하여 IC로 만들 회로를 나타내는 것이므로,
  Verilog HDL 문장들 중에서 어느 것은 synthesis 가능하고 어느 것은 불가능한지
  알고 있어야 합니다. 즉, Verilog HDL의 모든 문장이
  synthesis 가능한 것이 아니며, Verilog simulation을 통과하였다고 하여,
  모두 syynthesis 가능한 것이 아닙니다.
  우리 과목에서는 강의 시간의 제약으로 인하여 이 주제를 다루지 못하지만,
  Verilog HDL을 제대로 공부할 기회가 다시 온다면,
  이 주제를 신경 써서 공부하세요.
* **[hw6tb.v](https://github.com/hbmin/ice2001/blob/master/verilog/hw6tb.v)**  
  &nbsp; &nbsp; 이 파일은 hw6.v의 설계 오류를 잡을 목적으로 만든
  **Verilog testbench** 파일입니다.
  Verilog simulator에 이 파일과 hw6.v를 넣어서 logic simulation을 수행하여
  hw6.v가 올바로 작성되었는지 점검합니다.
  hw6.v에 들어 있는 e74FSM의 입력에 논리값들을 인가하고, e74FSM의 출력에서
  나온 논리값들이 기대한 값과 같은지 점검하여, simulation을 수행하는
  program이 이 파일에 들어 있고, e74FSM이 주는 출력을 컴퓨터 화면에
  보여주는 일을 합니다.  
  &nbsp; &nbsp; 이 파일에 들어 있는 Verilog program은 hw6.v에 들어 있는 설계물을
  시험하기 위한 것일 뿐, IC로 만들 design이 아니므로 별도의 파일로 작성하고,
  hw6.v만 synthesis의 대상이 되도록 분리합니다.
  또한, 이 파일의 code는 synthesis의 대상이 아니므로, synthesis 가능 여부와
  관련 없이, Verilog가 제공하는 모든 기능의 code를 사용할 수 있습니다.
* **[hw6v.do](https://github.com/hbmin/ice2001/blob/master/verilog/hw6v.do)**   
  &nbsp; &nbsp; 이 파일은 Questa 혹은 Modelsim
  ([상위 폴더의 README.md](https://github.com/hbmin/ice2001#readme)에
  자세히 기술함)이라는
  HDL simulator에서 **Verilog simulation을 하는 순서를 담은 Questa 혹은
  Modelsim 명령어 ([Tcl script](https://en.wikipedia.org/wiki/Tcl))
  file**입니다. Questa와 Modelsim은 이 파일을 읽어서 이 파일에 쓰인 명령어들을
  순서대로 실행하여 simulation을 수행할 수 있습니다.
  이 파일을 이용하여 simulation하려면, text shell을 열고, 다음의 명령어를
  입력하면 됩니다.  
  &nbsp; &nbsp; &nbsp; text-shell-prompt> **vsim -c -do hw6v.do**  
  이 파일 안에 주어진 simulation command마다 바로 위의 echo 명령에서
  무었을 하는 것인지 설명하고 있어서 따로 comment를 붙이지 않았습니다.
  물론, echo 명령은 주어진 문장을 simulator 출력 화면에 보여주는 일을 합니다.
  Questa를 사용하는 경우 조금 달라질 수 있으니, hw6v.do 안에서 vsim command를
  사용한 부분 (hw6v.do의 line 31 ~ 36)에 적어 놓은 comment를 참조하세요.  
* **[verilog-questasim-results.txt](https://github.com/hbmin/ice2001/blob/master/verilog/verilog-questasim-results.txt)**  
  &nbsp; &nbsp; 위 3개의 파일을 다운로드 받아서 하나의 folder에 넣고,
  위 vsim command를 사용해서 **Verilog simulation을 수행한 결과**
  (computer screen에 나온 결과)를 보여 줍니다.
  Verilog simulator로는 Mentor Graphics (now, Siemens EDA)가 개발하고
  Intel이 배포하는 Questa - Intel FPGA Starter Edition, version 2021.2를
  사용하였습니다.  
  &nbsp; &nbsp; <b>[verilog-modelsim-results.txt](https://github.com/hbmin/ice2001/blob/master/verilog/verilog-modelsim-results.txt)</b>는
  같은 회사의 Modelsim - Intel FPGA Starter Edition, version 2020.1을
  사용하여 simulation한 결과를 보여줍니다.  
  &nbsp; &nbsp; 이 파일들의 마지막 줄을 보면,
  "<b># Errors: 0, Warnings: 4</b>"라고 쓰여 있죠? 물론, simulation 도중 발생한
  Error message가 0개이고 Wanring message가 4개라고 알려주는 것입니다.
  Error message가 없는 것은 맞는데, 이 파일의 어디를 보아도 Warning message가
  보이지 않는데도 4개가 있다고 하니, 이 부분은 program의 bug인 것으로
  추측됩니다.
* **[waveform-verilog.png](https://github.com/hbmin/ice2001/blob/master/verilog/waveform-verilog.png?raw=true)**  
  &nbsp; &nbsp; 위에 언급한 **Verilog simulation의 결과로 나온 waveform**입니다.
  Waveform viewer는 통상 HDL simuator의 기능 중의 하나로 내장되어 있으며,
  이 그림도 Questa 혹은 Modelsim에서 보여주는 것입니다. 그러나, hw6tb.v는
  [self-checking testbench](https://vhdlwhiz.com/how-to-create-a-self-checking-testbench/)이기
  때문에, waveform은 통상 보조 자료로서 이용될 뿐입니다.
  Self-checking testbench의 simulation 성공 여부 판단 방법은
  바로 위 항목에서 언급한 Errors, Warnings의 갯수를 보고 판단하는 것입니다.
* **[FPGA-synthesis-verilog.png](https://github.com/hbmin/ice2001/blob/master/verilog/FPGA-synthesis-verilog.png?raw=true)**  
  &nbsp; &nbsp; 파일 hw6.v를 FPGA synthesis software에 넣어서
  **FPGA를 target으로 회로를 만든 그림**을 보여 드립니다.
  Chapter 9에서 배운대로, FPGA의 부품은 gate가 아니고 CLB (Configurable Logic
  Block)과 flip-flop 들이니 그림에는 이 2가지만 보입니다.
  그림에서 초록색 4각형들이 flip-flop들이고, 파란색 4각형들이 CLB들입니다.
  이러한 synthesis 중에 synthesis software가 준 report와 message들을 보이는
  <b>[HW6.map.rpt](https://github.com/hbmin/ice2001/blob/master/verilog/HW6.map.rpt)</b>
  파일을 보이니 참고하세요.
  FPGA synthesis에 사용한 software는
  [상위 폴더의 README.md](https://github.com/hbmin/ice2001#readme)에
  자세하게 언급한 Intel Quartus Prime Lite Edition, version 2020.1.1 입니다.
  Synthesis에 사용한 FPGA device family는 "Arria II GX"이며, 그 중에서
  사용한 device는 "EP2AGX45DF25C4"입니다.

