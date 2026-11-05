@echo off
setlocal
title Assistente - instalar e testar
cd /d "%~dp0"

echo ==================================================
echo    Assistente - gerar o instalador para testar
echo ==================================================
echo.

if not exist "windows\package.json" goto :nowindows

where node >nul 2>nul
if errorlevel 1 goto :nonode

where cargo >nul 2>nul
if errorlevel 1 goto :norust

cd windows

if not exist node_modules (
  echo Baixando as dependencias do projeto...
  call npm install
  if errorlevel 1 goto :failinstall
)

echo.
echo Compilando o Assistente. A primeira vez leva de 5 a 15 minutos...
call npm run pack
if errorlevel 1 goto :failbuild

echo.
echo Pronto: o instalador esta na pasta windows\release
if exist "release" start "" explorer "release"
pause
exit /b 0

:nowindows
echo [ERRO] A pasta "windows" nao esta aqui. Extraia o zip inteiro e rode este arquivo de dentro dele.
pause
exit /b 1

:nonode
echo [ERRO] Node.js nao encontrado. Instale a versao LTS em https://nodejs.org e rode de novo.
pause
exit /b 1

:norust
echo [ERRO] Rust nao encontrado. Instale em https://rustup.rs e rode de novo.
echo        Tambem e preciso o Visual Studio Build Tools com "Desktop development with C++".
pause
exit /b 1

:failinstall
echo [ERRO] O npm install falhou. Veja as mensagens acima.
pause
exit /b 1

:failbuild
echo [ERRO] A compilacao falhou. Veja as mensagens acima.
echo        Se o erro falar de link.exe ou MSVC, falta o Visual Studio Build Tools com C++.
pause
exit /b 1
