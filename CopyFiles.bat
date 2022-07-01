rem This batch file is used to copy file.

:: Hide extra stuff
@echo off

:: clear the screen
cls

:: Current path
set cur_dir=%cd%
:: echo %cur_dir%

:: Set source 
set sourceFile=%cur_dir%\fileList.txt
set sourcePath=%cur_dir%\SourceFolder
set targetPath=%cur_dir%\TargetFolder
:: echo %sourceFile%

FOR /F "tokens=* delims=" %%f IN (%sourceFile%) DO (
    echo %%f

    :: Touch empty file in source folder with name is defined in fileList
    rem type nul > %sourcePath%\%%f.txt

    :: Zip file
    rem tar -cvzf %sourcePath%\%%f.tar %sourcePath%\%%f.txt

    :: remove file tar
    :: del %sourcePath%\%%f.tar

    :: Copy file to tartget folder
    copy %sourcePath%\%%f.txt %targetPath%\
)
