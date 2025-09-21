REM This code is no good on its own, it must be used as a function  in  a batch script
@echo off
REM Start of function
REM delayed expansion MUST BE enabled ----> setlocal enabledelayedexpansion
REM Function usage:-  call :trim " example input string zz " output_variable_name
:trim
set trim_output=
set /a token_number=0
:trim_begin
set /a token_number+=1
set trim_happen=0
for /f "tokens=%token_number% delims= " %%i in (%1) do ( if "%%i"=="" goto trim_end
set "trim_output=!trim_output! %%i"
set /a trim_happen=1
)
if %trim_happen%==1 goto trim_begin
for /f "tokens=* delims= " %%i in ("!trim_output!") do set "trim_output=%%i"
set "%~2=!trim_output!"
:trim_end
