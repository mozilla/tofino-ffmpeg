git submodule init
git submodule update

mkdir -p yasm
curl -fsSL -o yasm\yasm.exe http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe

set target_arch=%architecture:x86=ia32%
set /p REVISION=<LCC_REVISION
