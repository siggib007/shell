REM batch file to download the GGSN configuration files from HPNA archive server using WinSCP then kick of the VBScript
REM Make sure all three files are in the same folder or adjust paths accordingly.

@ECHO OFF
set ConfFolder=c:\temp\dir2
set FileName=c:\temp\Pools.xlsx
set USERNAME=sbjarna
set PASSWORD=%1

if "%PASSWORD%"=="" (
	echo Please provide password as a parameter. 
	echo Example: %0 mypass
	goto end
)

winscp /script=HPNA-GGSNGet.txt /parameter %ConfFolder% /log="c:\temp\WinSCP.log"

if %ERRORLEVEL% neq 0 goto error
 
cscript CiscoASR5KPools.vbs %ConfFolder% %FileName%
if %ERRORLEVEL% neq 0 goto error

net use X: "\\docs.eng.t-mobile.com@SSL\InfoRouter\dav\T-Mobile\Engineering and Operations\Data Systems Engineering\IP Services\Network Implementation New\Per Application Documentation\GPRS\Mobile Pools"
copy /y %FileName% X:
goto end

:error
echo Error!

:end