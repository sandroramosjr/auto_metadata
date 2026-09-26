@echo off
chcp 65001 >nul
title Auto Metadata - Atualizador de Metadados EXIF

:: Garante execucao no diretorio do script
cd /d "%~dp0"

:: Invoca o script PowerShell passando qualquer pasta ou arquivos arrastados
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\process_metadata.ps1" %*

if %ERRORLEVEL% neq 0 (
    echo.
    echo [Erro na execucao]
    pause
)
