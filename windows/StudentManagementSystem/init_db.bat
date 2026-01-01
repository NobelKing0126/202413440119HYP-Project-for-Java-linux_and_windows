@echo off
chcp 65001 >nul
echo.
echo ========================================
echo    数据库初始化脚本
echo ========================================
echo.

set /p MYSQL_PWD=请输入MySQL root密码: 

echo.
echo [INFO] 初始化数据库...
mysql -u root -p%MYSQL_PWD% < sql\init.sql

if %errorlevel% neq 0 (
    echo [ERROR] 数据库初始化失败！
    pause
    exit /b 1
)

echo.
echo [INFO] 创建应用用户...
mysql -u root -p%MYSQL_PWD% -e "CREATE USER IF NOT EXISTS 'stuadmin'@'localhost' IDENTIFIED BY 'Aa123456!'; GRANT ALL PRIVILEGES ON student_management.* TO 'stuadmin'@'localhost'; FLUSH PRIVILEGES;"

echo.
echo ========================================
echo [SUCCESS] 数据库初始化完成！
echo ========================================
echo.
echo 请确保 resources\db.properties 配置正确：
echo   db.username=stuadmin
echo   db.password=Aa123456!
echo.
pause
