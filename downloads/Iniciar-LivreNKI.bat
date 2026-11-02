@echo off
setlocal

set "LIVRENKI_EXE=%~dp0LivreNKI-Universal.exe"

if not exist "%LIVRENKI_EXE%" set "LIVRENKI_EXE=%~dp0LivreNKI-Leve.exe"

if not exist "%LIVRENKI_EXE%" (
    echo.
    echo ERRO: LivreNKI-Universal.exe nao foi encontrado.
    echo Coloque Iniciar-LivreNKI.bat na mesma pasta do programa.
    echo.
    pause
    exit /b 1
)

pushd "%~dp0" >nul 2>&1
if errorlevel 1 (
    echo.
    echo ERRO: nao foi possivel acessar a pasta do LivreNKI.
    echo.
    pause
    exit /b 1
)

start "" "%LIVRENKI_EXE%"
set "LIVRENKI_RESULT=%ERRORLEVEL%"
popd

if not "%LIVRENKI_RESULT%"=="0" (
    echo.
    echo ERRO: o Windows nao conseguiu iniciar o LivreNKI.
    echo Codigo: %LIVRENKI_RESULT%
    echo.
    pause
    exit /b %LIVRENKI_RESULT%
)

endlocal
exit /b 0
