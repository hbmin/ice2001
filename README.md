
Examples of VHDL and Verilog Programs
=====================================

This repository (ice2001) contains example VHDL and Verilog programs
for students enrolled in ICE2001-43 at Fall semester of 2022.
These files are designs, testbenches, and simulation scripts,
which are the same as the design in HW6, 3-bit counter with 7-segment driver.

* The above
  ["vhdl" folder](https://github.com/hbmin/ice2001/tree/master/vhdl),
  contains VHDL files, and detailed explanations for the files are given at
  <!-- https://github.com/hbmin/ice2001/blob/master/vhdl/README.md -->
  [README.md](https://github.com/hbmin/ice2001/tree/master/vhdl#readme)
  inside the "vhdl" folder.
* The above
  ["verilog" folder](https://github.com/hbmin/ice2001/tree/master/verilog),
  contains Verilog files, and detailed explanations for the files are given at
  <!-- https://github.com/hbmin/ice2001/blob/master/verilog/README.md -->
  [README.md](https://github.com/hbmin/ice2001/tree/master/verilog#readme)
  inside the "verilog" folder.
* The above "questa" folder contains pictures to which words and phrases
  at the following section are linked.

**HDL을 이용한 설계에 관심있는 학생들은 여기에 주어진 자료를 공부하고 나서,
design project 등 우리 수업에서 주어진 회로들을 대상으로 design model,
testbench 등을 스스로 만들어서 simulation과 synthesis를 해 보시길
권장 드립니다.**

HDL Simulators and Synthesis Softwares for FPGA
===============================================

FPGA를 공급하는 양대 회사인 Xilinx와 Intel이 모두 기능이 제한된
무료 simulator와 synthesis software를 배포하고 있으니, 관심이 있으면,
설치해서 simulation과 synthesis를 해 보세요.
언어를 배우고 연습하는데 사용하는 용도로 적절할 것입니다.
첫 시도로 위에 드린 file들을 사용할 수 있을 것입니다.

<!-- **>>** -->
🔴
&nbsp;**DOWNLOAD** >> **[Xilinx](https://www.xilinx.com/)
([now, AMD](https://www.amd.com/en/press-releases/2022-02-14-amd-completes-acquisition-xilinx))의 경우**,
[download page](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)에서
"**Vivado**"를 다운로드 받을 수 있습니다. Xilinx software는 7~8년 전에
사용한 적이 있을 뿐 요즘 사용해보지 않아서,
요즘 어떤 것이 무료인지, 어떻게 사용하는지 등 자세한 사항을 잘 모릅니다.
따라서, 도와드리는 것이 불가능할 것으로 생각되니, Xilinx software를 더
선호한다면 Xilinx page를 주의깊게 읽어보고, 부족하면 web 검색을 해 보세요.

<!--
[download page](https://www.intel.com/content/www/us/en/collections/products/fpga/software/downloads.html?edition=lite&s=Newest)
-->
<!-- **>>** -->
🔴
&nbsp;**DOWNLOAD** >> **[Intel](https://www.intel.com/content/www/us/en/products/details/fpga.html)의 경우**,
[Windows 사용자를 위한 Quartus Prime download page](https://www.intel.com/content/www/us/en/software-kit/757262/intel-quartus-prime-lite-edition-design-software-version-22-1-for-windows.html)에서
"Intel® Quartus® Prime Lite Edition Design Software"를 다운로드 받아서
사용할 수 있습니다.
위에 링크된 페이지에 주어진 Lite Edition
([the other editions](https://www.intel.com/content/www/us/en/products/details/fpga/development-tools/quartus-prime/article.html))만이 무료로 배포되며,
이 페이지의 software는 Windows 사용자를 위한 것입니다.
[GNU/Linux 사용자는 여기](https://www.intel.com/content/www/us/en/software-kit/757261/intel-quartus-prime-lite-edition-design-software-version-22-1-for-linux.html)에서
다운로드 받을 수 있습니다.
2021년까지는 VHDL과 Verilog simulator로 **Modelsim**을 Quartus Prime Lite
Edition Design Software package의 일부로서 넣어 놓았었는데,
올해는 **Questa**를 넣어 놓았네요.
Questa는 사용법이 Modelsim과 매우 유사해서, 지금 보고 있는 이 repository의
"verilog" folder에 주어진 "hw6v.do"와 "vhdl" folder에 주어진 "hw6vhd.do"를
사용하는데 문제가 없을 것으로 기대됩니다. 이 2개의 file들은 simulation
과정을 기술하여 자동화하는데 사용하는 script file들입니다.
위에 링크된 다운로드 페이지에서는 다운로드 받는 파일이 1개이고 그 크기가
6 GB 내외인데, <b>학생의 사용 목적에 따라, 이 6 GB 파일을 분리해서
필요한 것들만 다운로드 받음으로써, 다운로드 크기를 줄일 수 있습니다.</b>

* 위에서 link한 Windows 사용자를 위한 Quartus Prime download page를 아래쪽으로
조금 내려가 보면 (scroll down하면), "Multiple Download", "Individual Files"라는
tab들이 보이죠? 이 tab들이 screen의 상단에 보이도록 만들어 보세요.
그리고 나서, "Individual Files" tab을 클릭해 보세요. 이제, 위 다운로드 페이지가
[이 그림의 모습](https://github.com/hbmin/ice2001/blob/master/questa/intel-download3.png?raw=true)이
될 것입니다. 이 그림에 보인 페이지에서 "Individual Files" tab이 보이고
파일을 분리해서 다운로드 받을 수 있음을 알 수 있습니다.
학생의 공부 목적에 따라, 다음의 2가지 중에서 하나를 선택하세요.
* (1) FPGA synthesis에 관심이 없고, HDL simulation만 해 보고 싶다면,
위에서 2번째 버튼, 즉, **"Questa-Intel FPGA Edition"**
(파일 이름: **QuestaSetup-22.1std.0.915-windows.exe**) 1개만 다운로드 받아서,
이 설치 파일을 double click하여 설치하면 됩니다.
* (2) FPGA synthesis까지 하고 싶다면, 위의 2개 설치 파일,
**"Intel Quartus Prime"과 "Questa Intel FPGA Edition"의 2개 설치 파일**을
다운로드 받으세요. 이제, **"Devices" file** (FPGA 정보가 들어 있는 파일)도
필요합니다.  위 다운로드 페이지를 조금 더 scroll down하면
[이 그림의 모습](https://github.com/hbmin/ice2001/blob/master/questa/intel-download4.png?raw=true)으로 보입니다.
즉, Device file이 모두 보입니다. Quartus Prime을 synthesis하는데 사용할 때,
이 중에서 **Arria II, MAX II, MAX 10의 3개**만 다운로드 받으면
공부 목적으로 충분합니다.  
이렇게 프로그램 설치 파일 2개와 "Devices" 파일 3개를 같은 폴더에
다운로드 받은 후, "Intel Quartus Prime" 설치 파일을 double click해서 설치하면,
Quartus Prime은 물론, Questa와 Devices를 포함한 모든 것을 알아서 설치해 줍니다.
단, 프로그램 설치가 종료될 무렵에 나타나는
[마지막 dialog box](https://github.com/hbmin/ice2001/blob/master/questa/final_screen_install.png?raw=true)에서
[이 그림](https://github.com/hbmin/ice2001/blob/master/questa/final_screen_install.png?raw=true)처럼
선택하길 권장합니다. 여기에서 어떤 선택을 하던 상관없지만,
아마도 가장 편안한 방법일 것입니다.
* <b>Questa의 Verilog simulator에
[optimization 관련 issue](https://3omh4.tistory.com/entry/verilog-modelsim-vish-4014-No-objects-found-matching-Testbench)</b>가 있어서,
사용하기 조금 불편합니다. 이 issue를 회피하는 방법을
[hw6v.do](https://github.com/hbmin/ice2001/blob/master/verilog/hw6v.do)에
써놓았습니다. 위에 link한 "optimization 관련 issue" 페이지에서는 issue와
관련하여 어떤 현상이 나타나는지에 대한 설명 만을 살펴 보고,
그 페이지에서 제시한 -novopt를 사용하는 해법은 무시하세요.
이 해법은 Questa의 개발사에서 -novopt option을 없앨 예정이니 사용하지 말라고
경고하는 방법이며, hw6v.do에 써놓은 +acc를 사용하는 방법이 Questa 개발사가
권장하는 방법입니다.
* 위 paragraph에서 언급한 issue를 원천적으로 피하고 싶다면,
[Windows 사용자 Quartus Prime download page](https://www.intel.com/content/www/us/en/software-kit/757262/intel-quartus-prime-lite-edition-design-software-version-22-1-for-windows.html)의
상단에서 최신 버젼인 22.1 대신에 과거 버젼 (20.1.1)을 선택하여 다운로드 받아서
사용하면 됩니다.
20.1.1 이전의 버젼에는 HDL simulation을 위하여 Questa 대신에 Modelsim이
들어 있으며, Modelsim은 이런 문제가 없습니다.
20.1.1 버젼에 들어 있는 Modelsim의 경우, 실행에 license를 요구하지 않는다는
것도 편리한 점이죠.
그러나, 편의성은 중요하지만, version 22.1을 사용할 지,
20.1.1을 사용할 지 결정할 때, 편의성만 고려하지 마세요.
Questa와 Modelsim의 개발사인 Siemens EDA (aka Mentor Graphics)가 Modelsim을
개발 중단 및 퇴역시키고, Questa를 주력 HDL simulator로 개발하고 있음도
염두에 두세요.
* 이런 issue는 Questa의 Verilog에서만 문제가 되며, VHDL의 경우
이런 issue가 없어서 Questa이건 Modelsim이건 사용하는데 문제가 없습니다.
* Questa 혹은 Modelsim을 설치하고 나서, double click으로 GUI 프로그램을
시작하기 위한 Windows shortcut (바로가기) Icon이
Windows Desktop (바탕 화면)에 보이지 않아서 다소 불편하다고 느낄 수 있습니다.
Windows의 start menu (시작 메뉴)에서 program을 시작할 수 있으나,
바로가기 Icon을 원한다면,
[Questa의 경우는 여기](https://github.com/hbmin/ice2001/blob/master/questa/windows-questasim-in-explorer.png),
[Modelsim의 경우는 여기](https://github.com/hbmin/ice2001/blob/master/questa/windows-modelsim-in-explorer.png)에
GUI program이 들어 있으니, 이 프로그램에서 바탕 화면에 Windows shortcut
(윈도우 바로가기) 파일을 만들어놓고 사용하면 될 것입니다.
* Intel Quartus Prime의 설치 후, 바탕 화면에 보이는 Quartus Prime icon
<img width="18" height="18" src="https://github.com/hbmin/ice2001/blob/master/questa/quartus_icon.png?raw=true" style="position:relative;top:5px;" />을
double click하여 program을 처음으로 실행할 때, license에 대하여 묻는
[이런 dialogbox](https://github.com/hbmin/ice2001/blob/master/questa/quartus_1strun.png?raw=true)를
만나게 될 것입니다. Lite edition의 경우 license는 필요없으니,
링크된 dialogbox 그림에서 보여주는 선택을 하면 됩니다.

<!-- **>>** -->
🔴
&nbsp;**FEATURES** >> **Intel과 Xilinx 모두**, VHDL / Verilog / SystemVerilog simulator와
synthesis software를 모두 포함하고 있습니다.
Synthesis는 물론 ASIC synthesis는 불가능하고 FPGA synthesis만 가능합니다.
Software download를 위하여, 회원 가입과 login이 필요할 수 있습니다.
또한, software 설치 후에 software license를 받아야
program을 실행할 수 있을른지도 모릅니다.
회원 가입 및 license 발급과 관련된 요구 사항은 없어지기도 하고,
새로 요구하기도 하는 등, 해마다 바뀌어서 확실히 말하기 어렵습니다.
다운로드할 때 login을 요구하거나, program을 실행시켰을 때 license를 요구하면,
회원 가입 메뉴 혹은 license 발급 페이지를 찾아보세요.

<!-- **>>** -->
🔴
&nbsp;**LICENSE** >> **2022년 가을, Intel의 경우**, "Intel® Quartus® Prime"
(FPGA synthesis software) 설치 파일의 다운로드와 설치 후 프로그램 실행에는
회원 가입도 필요 없고 아무 제한도 없습니다.
그러나, Questa (HDL simulator)의 경우, 설치 파일의 다운로드는 회원 가입도
필요 없고 제한도 없으나, Questa 설치 후 프로그램을 처음 실행하면
license를 설치하라고 요구하는 화면
([GUI 화면](https://github.com/hbmin/ice2001/blob/master/questa/license-error-gui.png?raw=true),
[text shell](https://github.com/hbmin/ice2001/blob/master/questa/license-error.png?raw=true))이
나타나고 실행하지 않네요. 이 문제를 해결하려면, 무료로 발급하는 1년간 유효한
license file을 받아서 설치해야 합니다.
음~~ 복잡해졌군요. 다음의 순서대로 해 보세요.

* Intel의 [Self Service Licensing Center](https://fpgasupport.intel.com/Licensing/license/index.html)에서
Questa Starter Edition을 위한 무료 license file을 발급 받으세요.
Licensing Center의 link를 click하면 login page
([snapshot](https://github.com/hbmin/ice2001/blob/master/questa/intel-signin.png?raw=true))가
나타나는데, 일단 화면의 우측 Register 화면에서 회원 가입을 하고,
화면 좌측에서 login한 후, Licensing Center에 들어가세요.
Login한 후에 Licensing Center에 들어가면, 바로 아래에 보인 Step 1의 화면이
나타납니다.
* Licensing Center에서 지시하는 순서대로
([Step 1](https://github.com/hbmin/ice2001/blob/master/questa/SSLC1.png?raw=true),
[Step 2](https://github.com/hbmin/ice2001/blob/master/questa/SSLC2.png?raw=true),
[Step 3](https://github.com/hbmin/ice2001/blob/master/questa/SSLC3.png?raw=true),
[Step 4](https://github.com/hbmin/ice2001/blob/master/questa/SSLC4.png?raw=true))
입력하세요. Step 4에서, FIXED license와 NIC ID를 선택하고,
Computer Name과 NIC ID를 알아내는 방법
([Windows 방법](https://github.com/hbmin/ice2001/blob/master/questa/hostname-nicid-win.png?raw=true),
[GNU/Linux 방법](https://github.com/hbmin/ice2001/blob/master/questa/hostname-nicid-linux.png?raw=true))을
참고하여 Computer Name과 NIC ID를 입력하고 나서, license file을
generation하는 버튼 (위 Step 4 그림의 오른쪽 아래의 "Generate License" 버튼)을
click하세요. NIC ID의 경우, hyphen(-)은 제거하고 hex number 12개만
이어서 입력하세요. "Generate License" 버튼을 입력하면,
회원 가입 (Register)할 때 입력한 e-mail로 license file을 첨부하여 보내 줍니다.
* 위 Step 4에서 "Generate License" 버튼을 클릭하고나서 잠시 기다리면,
e-mail로 발송된 license에 관한 자세한 정보를 보여주는 페이지가 나타납니다.
발송에 사용된 e-mail 주소도 여기에 나타나니, 전체를 살펴보고 나서
페이지를 닫으면 됩니다.
* E-mail의 첨부 파일로 받은 이 license file의 이름은 "xxxx_License.dat"일
것입니다. 여기에서 xxxx 부분은 license를 만드는 사람마다 만들때마다 달라집니다.
이 파일을 관리하기 편리한 folder (예: Questa folder인 questa_fse) 안에 저장하고,
이 파일의 full path name을 환경 변수 "MGLS_LICENSE_FILE"에
setting 시켜주면 됩니다. 즉, Windows의 경우 Command Prompt 혹은 PowerShell을
열고, 다음의 command를 사용하면 환경 변수가 setting됩니다.
물론, 다음 명령어에서 license file의 path name은 학생이 e-mail의 첨부 파일로
받은 license file을 실제로 저장한 folder에 따라서 달라질 수 있으니,
license file의 full path name을 확인하여 입력하세요.
([Refer to this snapshot](https://github.com/hbmin/ice2001/blob/master/questa/mgls-license-file-setx.png?raw=true))
<pre>
<b>setx MGLS_LICENSE_FILE "C:\intelFPGA\22.1std\questa_fse\xxxx_License.dat"</b>
</pre>
* 물론, 환경 변수 설정은 Settings App의 GUI에서도 할 수 있으나, GUI에서 설정하는
방법이 더 복잡해서, 위 setx 명령어를 사용하는 것이 훨씬 간편합니다.
그런데, 환경 변수가 유효하게 되려면,
Windows PC를 다시 booting해야 하는 것은 아시죠?
Windows PC를 다시 booting한 후에, Command Prompt를 열고 (1)의 명령어를
입력하거나, PowerShell을 열고 (2)의 명령어를 입력해서,
잘 setting되었나 점검해 보세요.
([Refer to this snapshot](https://github.com/hbmin/ice2001/blob/master/questa/mgls-license-file.png?raw=true))
<pre>
(1) <b>echo %MGLS_LICENSE_FILE%</b>
    <b>if exist %MGLS_LICENSE_FILE% (echo okay) else (echo file not found)</b>
(2) <b>$env:MGLS_LICENSE_FILE</b>
    <b>if (test-path -path $env:MGLS_LICENSE_FILE -pathtype leaf) {echo okay} else {echo "file not found"}</b>
</pre>
* 위에서도 한번 언급했지만, 이런 license file은 Questa의 경우에만 필요합니다.
[Windows 사용자를 위한 Quartus Prime download page](https://www.intel.com/content/www/us/en/software-kit/757262/intel-quartus-prime-lite-edition-design-software-version-22-1-for-windows.html)에서,
최신 version 22.1 대신에 version 20.1.1을 다운로드 받아서,
여기에 들어 있는 Modelsim을 사용한다면,
license 발급 과정이 필요 없습니다.

**[[ HDL Software 사용법 자료 ]]**
-------------------  
HDL simulation과 synthesis를 수행하는 위 software를 실제로 실행해 보려면,
software 사용법에 대한 1 ~ 2시간의 공부가 필요할 듯합니다. 이 과정에 대하여
관심이 있고 꼭 한번 해 보고 싶은 학생이 있다면,
Modelsim (HDL simulator)와 Intel Quartus Prime (Synthesis)의 사용법을
설명하는 Powerpoint slide file과 동영상이 있으니,
2022년 2학기, ICE2001-43에 등록한 학생에 한하여 보내드릴 용의가 있습니다.
이 자료들은 2021년 2학기 디지털시스템 (ICE3021) 과목에서 사용한 자료들입니다.
보내주면 공부할 학생에 한하여, 학번과 이름, 그리고, Simulation만 필요한지,
아니면 Simulation과 Synthesis 모두 필요한지를
명시하여, software 사용법 자료를 e-mail로 요청하세요.

* Intel에서 2021년 연말부터 배포하는 Questa는 Modelsim과 사용법이 거의 같으니,
위 자료들은 Modelsim에 관한 자료이지만 Questa 사용법을 공부하는데 문제가
없을 것입니다.
* 물론, [Quartus Prime User Guide](https://www.intel.com/content/www/us/en/support/programmable/support-resources/design-software/user-guides.html)와
Questa 설치 폴더 (INSTALL_PATH/questa_fse/docs/pdfdocs) 안에
PDF file들로 주어진 Questa manual들을 참고할 수 있습니다.
Modelsim의 PDF manual들은 Modelsim 설치 폴더
(INSTALL_PATH/modelsim_ase/docs/pdfdocs) 안에서 찾을 수 있습니다.
* Modelsim 혹은 Questa를 text shell에서 실행할 때 사용되는 do file들
(hw6v.do, hw6vhd.do)은 프로그래밍 언어인 Tcl file들입니다.
[Tcl](https://en.wikipedia.org/wiki/Tcl)은 명령어의
조합으로 이루어진 프로그래밍 언어이며, 많은 EDA software들의 user interface로
흔하게 사용됩니다. 관심이 있다면, 3~4 시간 들여다보면 배울 수 있는
[Tcl tutorial](https://www.google.com/search?q=tcl+tutorial)들이 많이 있습니다.
* Intel과 Xilinx의 예에서 보듯, EDA vendor들은 거의 모든 software들에 대하여
Windows edition과 GNU/Linux edition을 모두 공급합니다.
Digital chip을 설계하는 회사들은 이들 software를 주로 server들에 설치해서
설계팀원 누구나 쓸 수 있도록 운영하기 때문에, server PC가 이런 software들
전용으로 운용됩니다.
따라서, 이런 PC에 사용하기 위하여 Windows license를 구매하는 것은
낭비일 뿐이죠. 비용 절감에 대한 개념이 있는 회사라면, 이런 PC에는 GNU/Linux를
사용하는 것이 당연한 선택이겠죠.

**[[ 주의 사항 ]]**  
-------------------
Design file 등 software에서 사용되는 파일들의 이름,
이 파일들이 들어있는 folder의 full path name,
software를 설치한 folder의 full path name 등,
이 software와 관련된 모든 이름과 입력하는 문자에
ASCII가 아닌 문자들 (예: 한글, 중국어, 일본어 등)을 사용하지 마세요.
이런 전문 software들은 ASCII를 제외한 문자 지원이 좋지 않아서,
말썽의 원인이 될 수 있습니다. 

