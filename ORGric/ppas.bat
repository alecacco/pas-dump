@echo off
c:\progra~1\dev-pas\bin\ldw.exe  -s   -o f:\pas\orgric\orgric.exe link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
