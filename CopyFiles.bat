:: This batch file is used to copy file.

:: Hide extra stuff
@echo off

:: clear the screen
cls

echo   _______________________________________________________________
echo  ^|  TuanTran                                                    ^| 
echo  ^|  https://github.com/quoctuan-iot                             ^|
echo  ^|                                                              ^|
echo  ^|______________________________________________________________^|

:: Current path
set cur_dir=%cd%
:: echo %cur_dir%

:: Set source 
set sourceFile=%cur_dir%\fileList.txt
set sourcePath=%cur_dir%\SourceFolder
set targetPath=%cur_dir%\TargetFolder
:: echo %sourceFile%

setlocal 
:: Call function
echo 1. Copy file to target path with name taken from text: 
echo 2. Check number of lines in file: 
echo 3. crate file:

CHOICE /C 123 /M "Enter your choice: "
if ERRORLEVEL 3 goto creat_file
if ERRORLEVEL 2 goto check_file
if ERRORLEVEL 1 goto copy_file_taken_from_text

:: Defile function
EXIT /B %ERRORLEVEL%

:creat_file
ECHO  ^================================================= 
echo  Function crate file

for /f "tokens=* delims=" %%f in (%sourceFile%) do (
    set filename=%%f
    echo %%f
    :: Touch empty file in source folder with name is defined in fileList
    @REM type nul > %sourcePath%\%filename%.txt

    :: Zip file
    @REM tar -cvzf %sourcePath%\%filename%.tar %sourcePath%\%filename%.txt

    :: ::ove file tar
    @REM del %sourcePath%\%\%filename%.tar

    :: Copy file to tartget folder
    @REM copy %sourcePath%%\%filename%.txt %targetPath%
)   
EXIT /B 0

:check_file
ECHO =================================================
echo Function check file
for /f tokens^=* %%i in ('where SourceFolder:*') do (
    :: echo Path: %%~dpi ^| Name: %%~nxi ^| Modified data: %%~ti
    find /v /c "" SourceFolder\%%~nxi
)
EXIT /B 0

:copy_file_taken_from_text
ECHO =================================================
echo Function copy file taken from text
for /f "tokens=* delims=" %%l in (%sourceFile%) do (
    @REM echo %%l
    copy %sourcePath%\%%l.txt %targetPath%
)
EXIT /B 0