::  A simple script that converts links like this:
::  E:\My Documents\File.txt

::  into links like this:
::  file:///E:\My%20Documents\File.txt

@echo off
chcp 65001 > nul  & rem Fix text encoding
setlocal enabledelayedexpansion

:: Get input (drag & drop or manual)
set "input=%~1"
if "%input%"=="" (
    set /p "input=Enter path or text: "
)

:: Remove quotes if dragged & dropped
set "input=!input:"=!"

:: Replace spaces with %20
set "output=!input: =%%20!"

:: Check if it's a path (has :\ or /)
echo !output! | findstr /i "[\\/]" > nul
if !errorlevel! equ 0 (
    set "output=file:///!output!"
)

:: Display and copy to clipboard
echo Result: !output!
echo !output! | clip
echo Text copied to clipboard!
pause