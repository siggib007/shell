@echo off

"C:\Program Files (x86)\WinSCP\WinSCP.com" ^
  /log="C:\writable\path\to\log\WinSCP.log" /ini=nul ^
  /command ^
    "open sftp://sbjarna:xxxx@10.46.45.40/ -hostkey=""ssh-rsa 2048 7c:e6:6e:a1:2a:44:11:af:14:aa:e2:74:32:37:7f:02""" ^
    "Your command 1" ^
    "Your command 2" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
) else (
  echo Error
)

exit /b %WINSCP_RESULT%
