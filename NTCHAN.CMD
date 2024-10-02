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

REM You are running NT Channel Version 0.2.0

:LOADR
IF NOT EXIST ".\LOG.TXT" ECHO.>".\LOG.TXT"
IF NOT EXIST ".\NTCHAN.INI" (
	ECHO SITE=NT Channel>".\NTCHAN.INI"
	ECHO MOTD=>>".\NTCHAN.INI"
	ECHO ANON=Anonymous>>".\NTCHAN.INI"
	ECHO LOAD=15>>".\NTCHAN.INI"
	ECHO COOL=60>>".\NTCHAN.INI"
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
SET "%LOAD%"
SET "%COOL%"

:CHAN
CLS
ECHO.
ECHO   Welcome to %SITE%! %MOTD%
TYPE ".\LOG.TXT"
CHOICE /C X± /T %LOAD% /D ±>NUL
IF %ERRORLEVEL% EQU 1 GOTO :CHAN_FORM
GOTO :CHAN

:CHAN_FORM
SETLOCAL EnableDelayedExpansion
SET /P "POST=.  Comment: "
IF "!POST:~0,1!"==">" (
	ECHO   ^<%ANON%^> [92m!POST![0m>>".\LOG.TXT"
) ELSE ECHO   ^<%ANON%^> !POST!>>".\LOG.TXT"
ENDLOCAL
GOTO :CHAN