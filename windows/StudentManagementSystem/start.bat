@echo off
chcp 65001 >nul
title 学生信息管理系统

echo.
echo ========================================
echo    学生信息管理系统 - 一键启动
echo ========================================
echo.

:: 检查是否已编译
if not exist out\Main.class (
    echo [INFO] 首次运行，正在编译...
    call compile.bat
    if %errorlevel% neq 0 exit /b 1
)

:: 运行程序
echo [INFO] 启动程序...
java -Dfile.encoding=UTF-8 -cp "out;lib\*" Main
pause
