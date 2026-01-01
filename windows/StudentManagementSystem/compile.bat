@echo off
chcp 65001 >nul
echo.
echo ========================================
echo    学生信息管理系统 - 编译脚本
echo ========================================
echo.

set SRC_DIR=src
set OUT_DIR=out
set LIB_DIR=lib

echo [INFO] 检查Java环境...
javac -version 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 未找到javac，请先安装JDK
    pause
    exit /b 1
)

echo [INFO] 清理输出目录...
if exist %OUT_DIR% rmdir /s /q %OUT_DIR%
mkdir %OUT_DIR%

echo [INFO] 收集源文件...
dir /s /b %SRC_DIR%\*.java > sources.txt

echo [INFO] 编译源代码...
javac -encoding UTF-8 -cp "%LIB_DIR%\*" -d %OUT_DIR% @sources.txt

if %errorlevel% neq 0 (
    echo [ERROR] 编译失败！
    del sources.txt
    pause
    exit /b 1
)

echo [INFO] 复制资源文件...
if exist resources xcopy /s /y resources %OUT_DIR%\ >nul

del sources.txt

echo.
echo ========================================
echo [SUCCESS] 编译成功！
echo ========================================
pause
