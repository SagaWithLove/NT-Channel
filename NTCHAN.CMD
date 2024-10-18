@ECHO OFF

REM  Please REMember me.
REM
REM           L M
REM        i      Þ
REM         ˜¤     )
REM    LÜMÞ
REM   (            (
REM   ˜¤
REM     M œc Ü ƒ~ T
REM
REM From Saga, with Love.

REM You are running NT Channel Version 0.2.3

:LOADR
IF NOT EXIST ".\LOG.TXT" >".\LOG.TXT" ECHO.
IF NOT EXIST ".\NTCHAN.INI" (
	>".\NTCHAN.INI" ECHO SITE=NT Channel
	>>".\NTCHAN.INI" ECHO MOTD=
	>>".\NTCHAN.INI" ECHO ANON=Anonymous
	>>".\NTCHAN.INI" ECHO LOAD=5
	>>".\NTCHAN.INI" ECHO COOL=60
)
IF EXIST ".\NTCHAN.INI" (
	SET /P SITE=
	SET /P MOTD=
	SET /P ANON=
	SET /P LOAD=
	SET /P COOL=
)<".\NTCHAN.INI"
SET "%SITE%"
SET "%MOTD%"
SET "%ANON%"
2>NUL SET /A "%LOAD%"
IF %ERRORLEVEL% GTR 0 SET /A LOAD=5
IF %LOAD% LSS 0 SET /A LOAD=1
IF %LOAD% GTR 9999 SET /A LOAD=9999
2>NUL SET /A "%COOL%"
IF %ERRORLEVEL% GTR 0 SET /A COOL=60
IF %COOL% LSS 0 SET /A COOL=0

:CHAN
CLS
ECHO.
ECHO   Welcome to %SITE%! %MOTD%
TYPE ".\LOG.TXT"
CHOICE /C ±X /T %LOAD% /D ±>NUL
IF %ERRORLEVEL% GTR 1 GOTO :CHAN_FORM
GOTO :CHAN

:CHAN_FORM
SETLOCAL EnableDelayedExpansion
SET /P "POST=.  Comment: "
IF "!POST:~0,1!"==">" (
	>>".\LOG.TXT" ECHO   ^<%ANON%^> [38;2;120;153;34m!POST![0m
) ELSE IF "!POST:~-1,1!"=="<" (
	>>".\LOG.TXT" ECHO   ^<%ANON%^> [38;2;255;104;45m!POST![0m
) ELSE >>".\LOG.TXT" ECHO   ^<%ANON%^> !POST!
ENDLOCAL
GOTO :CHAN