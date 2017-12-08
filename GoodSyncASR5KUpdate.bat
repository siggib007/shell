@ECHO OFF
cscript c:\scripts\vbscript\CiscoASR5KPools.vbs %1 %2

if %ERRORLEVEL% neq 0 goto error

net use X: "\\docs.eng.t-mobile.com@SSL\InfoRouter\dav\T-Mobile\Engineering and Operations\Data Systems Engineering\IP Services\Network Implementation New\Per Application Documentation\GPRS\Mobile Pools"  /user:sbjarna 
copy /y %2 X:
goto end

:error
echo Error!

:end