@echo off
chcp 65001 >nul
echo.
echo ========================================
echo    学生信息管理系统 - 启动
echo ========================================
echo.

if not exist out (
    echo [ERROR] 请先运行 compile.bat 编译项目！
    pause
    exit /b 1
)

echo [INFO] 正在启动程序...
java -Dfile.encoding=UTF-8 -cp "out;lib\*" Main

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] 程序异常退出
    pause
)
