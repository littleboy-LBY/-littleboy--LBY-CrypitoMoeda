@echo off

REM Verifica se o Python está instalado
where python >nul 2>nul
IF ERRORLEVEL 1 (
    echo Python não está instalado. Por favor, instale o Python primeiro.
    exit /b
)

REM Nome do arquivo de controle para verificar a instalação dos pacotes
set "control_file=packages_installed.txt"

REM Verifica se os pacotes já foram instalados
IF EXIST "%control_file%" (
    echo Pacotes já instalados. Iniciando o aplicativo...
) ELSE (
    echo Instalando pacotes necessários...
    pip install requests
    pip install qrcode
    pip install PyQt5
    pip install Flask
    pip install numpy

    REM Cria o arquivo de controle para indicar que os pacotes foram instalados
    echo Pacotes instalados. > "%control_file%"
)

REM Inicia o aplicativo littleboy(LBOY)
start "" "littleboy(LBY).exe"
@echo off
cd /d "%~dp0"  # Muda para o diretório onde o script está localizado
start "" "python.exe" "littleboy(LBOY).py"  # Executa o script
exit
