@echo off
REM SET stime=%TIME:~0,-3%
SET FNAME="%~1%"
SET FNAME_TMP="%~1.new"
SET GUARD=generated_version_header

FOR /F "" %%F IN ('"git describe --tags --always --dirty --long --abbrev=7"') DO (
	SET ver=%%F
)

ECHO #ifndef %GUARD% > %FNAME_TMP%
ECHO #define %GUARD% >> %FNAME_TMP%
ECHO /* Automatically generated file, do not modify! */ >> %FNAME_TMP%
REM ECHO #define SOFTWARE_VERSION "%ver% %date% %stime%" >> %FNAME_TMP%
ECHO #define SOFTWARE_VERSION "%ver% %date%" >> %FNAME_TMP%
ECHO #endif >> %FNAME_TMP%

IF NOT EXIST %FNAME% GOTO LCOPY

FC /B %FNAME% %FNAME_TMP% > nul
IF %ERRORLEVEL% EQU 0 GOTO LDONE

:LCOPY 
COPY /Y %FNAME_TMP% %FNAME% > nul

:LDONE
DEL %FNAME_TMP% > nul

EXIT /b 0