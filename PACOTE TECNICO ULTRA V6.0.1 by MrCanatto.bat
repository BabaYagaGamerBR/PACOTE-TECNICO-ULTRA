@echo off
title PACOTE TECNICO ULTRA by TEC MrCANATTO V6.0.1
color 0A
mode con: cols=86 lines=32

:: Verifica permissao de Administrador e reabre elevado se necessario
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Solicitando permissao de Administrador...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo =====================================================================================
echo                    PACOTE TECNICO ULTRA by TEC Mr.CANATTO V.6.0.1
echo =====================================================================================
echo.
echo    __  __ ____        ____    _    _   _    _  _____ _____ ___
echo   ^|  \/  ^|  _ \      / ___^|  / \  ^| \ ^| ^|  / \^|_   _^|_   _/ _ \
echo   ^| ^|\/^| ^| ^|_) ^|    ^| ^|     / _ \ ^|  \^| ^| / _ \ ^| ^|   ^| ^|^| ^| ^| ^|
echo   ^| ^|  ^| ^|  _ ^<     ^| ^|___ / ___ \^| ^|\  ^|/ ___ \^| ^|   ^| ^|^| ^|_^| ^|
echo   ^|_^|  ^|_^|_^| \_\     \____/_/   \_\_^| \_/_/   \_\_^|   ^|_^| \___/
echo.
echo                              __^| ^|______^| ^|__
echo                           __^|                ^|__
echo                          ^|__    []      []    __^|
echo                             ^|                ^|
echo                             ^|___  \____/  ___^|
echo                                 \________/
echo.
echo                         COMPUTER REPAIR WITH A SMILE!
echo =====================================================================================
echo.
echo [0] Win ^& Office Magic Activation
echo [1] Reparo rapido Internet/Navegadores
echo [2] Limpeza e Otimizacao Completa
echo [3] Reparar Impressoras
echo [4] Reparar Impressoras ULTRA
echo [5] Reparar Audio
echo [6] Reparar Arquivos Windows (SFC)
echo [7] Reparar Imagem Windows (DISM)
echo [8] Abrir Ferramentas Tecnicas
echo [9] Sair
echo.
set /p op=Escolha uma opcao: 

if "%op%"=="0" goto ACTIVATION
if "%op%"=="1" goto RAPIDO
if "%op%"=="2" goto COMPLETO
if "%op%"=="3" goto IMPRESSORAS
if "%op%"=="4" goto IMPRESSORAS_ULTRA
if "%op%"=="5" goto AUDIO
if "%op%"=="6" goto SFC
if "%op%"=="7" goto DISM
if "%op%"=="8" goto TOOLS
if "%op%"=="9" exit

goto MENU

:ACTIVATION
cls
echo ==========================================
echo    Win ^& Office Magic Activation
echo ==========================================
echo.
echo Iniciando o script de ativação do Windows e Office...
echo.

powershell -Command "Start-Process powershell -ArgumentList '-Command ""irm https://get.activated.win | iex""' -Verb RunAs -WindowStyle Hidden"

echo.
echo Script de ativação iniciado em segundo plano.
echo Aguarde alguns segundos...
echo.
pause
goto MENU

:RAPIDO
cls
echo ==========================================
echo REPARO RAPIDO INTERNET/NAVEGADORES
echo ==========================================

set "PS1=%TEMP%\PacoteRapido.ps1"

> "%PS1%" echo $Log = "$env:USERPROFILE\Desktop\Log_Reparo_Rapido.txt"
>> "%PS1%" echo "Iniciado em $(Get-Date)" ^| Out-File $Log
>> "%PS1%" echo $Host.UI.RawUI.ForegroundColor = "Green"
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[1/7] Encerrando apps leves..."
>> "%PS1%" echo $Apps = @("chrome","msedge","firefox","opera","opera_gx","brave","vivaldi","discord","spotify","teams","telegram","whatsapp")
>> "%PS1%" echo foreach ($a in $Apps) { Stop-Process -Name $a -Force -ErrorAction SilentlyContinue }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[2/7] Reparando rede com seguranca para IP fixo..."
>> "%PS1%" echo ipconfig /flushdns ^| Out-File $Log -Append
>> "%PS1%" echo arp -d * ^| Out-File $Log -Append
>> "%PS1%" echo netsh winsock reset ^| Out-File $Log -Append
>> "%PS1%" echo "Pulando netsh int ip reset para preservar IP fixo, mascara e gateway." ^| Out-File $Log -Append
>> "%PS1%" echo netsh winhttp reset proxy ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[3/7] Aplicando DNS Cloudflare..."
>> "%PS1%" echo $Adapters = Get-NetAdapter ^| Where-Object { $_.Status -eq "Up" -and $_.HardwareInterface -eq $true }
>> "%PS1%" echo foreach ($Adapter in $Adapters) {
>> "%PS1%" echo Set-DnsClientServerAddress -InterfaceIndex $Adapter.ifIndex -ServerAddresses "1.1.1.1","1.0.0.1" -ErrorAction SilentlyContinue
>> "%PS1%" echo }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[4/7] Limpando cache navegadores..."
>> "%PS1%" echo $CachePaths = @(
>> "%PS1%" echo "$env:LOCALAPPDATA\Google\Chrome\User Data\*\Cache",
>> "%PS1%" echo "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\Cache",
>> "%PS1%" echo "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\*\Cache",
>> "%PS1%" echo "$env:LOCALAPPDATA\Vivaldi\User Data\*\Cache",
>> "%PS1%" echo "$env:LOCALAPPDATA\Opera Software\Opera Stable\Cache",
>> "%PS1%" echo "$env:LOCALAPPDATA\Opera Software\Opera GX Stable\Cache",
>> "%PS1%" echo "$env:APPDATA\Mozilla\Firefox\Profiles\*\cache2"
>> "%PS1%" echo )
>> "%PS1%" echo foreach ($Path in $CachePaths) { Remove-Item $Path -Recurse -Force -ErrorAction SilentlyContinue }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[5/7] Limpando historico Chromium..."
>> "%PS1%" echo $HistoryFiles = @(
>> "%PS1%" echo "$env:LOCALAPPDATA\Google\Chrome\User Data\*\History",
>> "%PS1%" echo "$env:LOCALAPPDATA\Microsoft\Edge\User Data\*\History",
>> "%PS1%" echo "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\*\History",
>> "%PS1%" echo "$env:LOCALAPPDATA\Vivaldi\User Data\*\History",
>> "%PS1%" echo "$env:LOCALAPPDATA\Opera Software\Opera Stable\History",
>> "%PS1%" echo "$env:LOCALAPPDATA\Opera Software\Opera GX Stable\History"
>> "%PS1%" echo )
>> "%PS1%" echo foreach ($File in $HistoryFiles) { Remove-Item $File -Force -ErrorAction SilentlyContinue }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[6/7] Limpando temporarios, prefetch e recentes..."
>> "%PS1%" echo Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:WINDIR\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:WINDIR\Prefetch\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:APPDATA\Microsoft\Windows\Recent\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Clear-RecycleBin -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[7/7] Testando rede..."
>> "%PS1%" echo ping 1.1.1.1 -n 4 ^| Out-File $Log -Append
>> "%PS1%" echo nslookup google.com ^| Out-File $Log -Append
>> "%PS1%" echo ipconfig /all ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "FINALIZADO"
>> "%PS1%" echo Write-Host "Log salvo na Area de Trabalho."

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"

pause
goto MENU

:COMPLETO
cls
echo ==========================================
echo LIMPEZA E OTIMIZACAO COMPLETA
echo ==========================================

set "PS1=%TEMP%\PacoteCompleto.ps1"

> "%PS1%" echo $Log = "$env:USERPROFILE\Desktop\Log_Otimizacao_Completa.txt"
>> "%PS1%" echo "Iniciado em $(Get-Date)" ^| Out-File $Log
>> "%PS1%" echo $Host.UI.RawUI.ForegroundColor = "Green"
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[1/10] Encerrando apps pesados..."
>> "%PS1%" echo $Apps = @("chrome","msedge","firefox","opera","opera_gx","brave","vivaldi","discord","spotify","teams","telegram","whatsapp","steam","epicgameslauncher","battle.net","onedrive")
>> "%PS1%" echo foreach ($a in $Apps) { Stop-Process -Name $a -Force -ErrorAction SilentlyContinue }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[2/10] Limpando temporarios completos..."
>> "%PS1%" echo $Temp = @("$env:TEMP\*","$env:LOCALAPPDATA\Temp\*","$env:WINDIR\Temp\*","$env:WINDIR\Prefetch\*")
>> "%PS1%" echo foreach ($t in $Temp) { Remove-Item $t -Recurse -Force -ErrorAction SilentlyContinue }
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[3/10] Limpando caches Windows..."
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\WebCache\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[4/10] Limpando thumbnails e icones..."
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*" -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:LOCALAPPDATA\IconCache.db" -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[5/10] Limpando logs e relatorios..."
>> "%PS1%" echo Remove-Item "$env:ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[6/10] Limpando Windows Update..."
>> "%PS1%" echo Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Stop-Service bits -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Service bits -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Service wuauserv -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[7/10] Executando DISM Cleanup... (pode demorar varios minutos)"
>> "%PS1%" echo DISM /Online /Cleanup-Image /StartComponentCleanup ^| Out-File $Log -Append
>> "%PS1%" echo Write-Host "DISM Cleanup finalizado."
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[8/10] Limpando Lixeira..."
>> "%PS1%" echo Clear-RecycleBin -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[9/10] Diagnostico de processos..."
>> "%PS1%" echo Get-Process ^| Sort-Object CPU -Descending ^| Select-Object -First 20 ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[10/10] Salvando informacoes do sistema..."
>> "%PS1%" echo systeminfo ^| Out-File $Log -Append
>> "%PS1%" echo ipconfig /all ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "FINALIZADO"
>> "%PS1%" echo Write-Host "Log salvo na Area de Trabalho."

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"

pause
goto MENU

:IMPRESSORAS
cls
echo =====================================
echo      REPARO DE IMPRESSORAS
echo =====================================
echo.

echo [1/6] Parando spooler...
net stop spooler

echo.
echo [2/6] Limpando fila de impressao...
del /q /f %systemroot%\System32\spool\PRINTERS\*.* >nul 2>&1

echo.
echo [3/6] Limpando cache de spool...
rd /s /q "%systemroot%\System32\spool\drivers\x64\3\Old" >nul 2>&1

echo.
echo [4/6] Reiniciando spooler...
net start spooler

echo.
echo [5/6] Reiniciando descoberta de rede...
net stop FDResPub >nul 2>&1
net start FDResPub >nul 2>&1

echo.
echo [6/6] Testando status...
sc query spooler

echo.
echo =====================================
echo     REPARO FINALIZADO
echo =====================================
echo.
pause
goto MENU

:IMPRESSORAS_ULTRA
cls
echo =======================================
echo      REPARO DE IMPRESSORAS ULTRA
echo =======================================
echo.

set "PS1=%TEMP%\ReparoImpressorasUltra.ps1"

> "%PS1%" echo $Log = "$env:USERPROFILE\Desktop\Log_Reparo_Impressoras_ULTRA.txt"
>> "%PS1%" echo "Iniciando reparo de impressoras em $(Get-Date)" ^| Out-File $Log
>> "%PS1%" echo $Host.UI.RawUI.ForegroundColor = "Green"
>> "%PS1%" echo Write-Host "======================================="
>> "%PS1%" echo Write-Host " REPARO DE IMPRESSORAS ULTRA"
>> "%PS1%" echo Write-Host "======================================="
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[1/8] Listando impressoras instaladas..."
>> "%PS1%" echo Get-Printer ^| Format-Table Name, PrinterStatus, Default, DriverName, PortName -AutoSize ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[2/8] Parando Spooler..."
>> "%PS1%" echo Stop-Service Spooler -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Sleep -Seconds 2
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[3/8] Limpando fila de impressao..."
>> "%PS1%" echo Remove-Item "$env:SystemRoot\System32\spool\PRINTERS\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo "Fila de impressao limpa." ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[4/8] Limpando arquivos temporarios do spool..."
>> "%PS1%" echo Remove-Item "$env:SystemRoot\System32\spool\SERVERS\*" -Recurse -Force -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[5/8] Reiniciando servicos relacionados..."
>> "%PS1%" echo Start-Service Spooler -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Service FDResPub -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Service SSDPSRV -ErrorAction SilentlyContinue
>> "%PS1%" echo Start-Service upnphost -ErrorAction SilentlyContinue
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[6/8] Verificando impressoras com erro/offline..."
>> "%PS1%" echo Get-Printer ^| Where-Object { $_.PrinterStatus -ne "Normal" } ^| Format-Table Name, PrinterStatus, DriverName, PortName -AutoSize ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[7/8] Verificando portas de impressao..."
>> "%PS1%" echo Get-PrinterPort ^| Format-Table Name, PrinterHostAddress, PortNumber, Protocol -AutoSize ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host "[8/8] Status final do Spooler..."
>> "%PS1%" echo Get-Service Spooler ^| Format-Table Name, Status, StartType -AutoSize ^| Out-File $Log -Append
>> "%PS1%" echo.
>> "%PS1%" echo Write-Host ""
>> "%PS1%" echo Write-Host "======================================="
>> "%PS1%" echo Write-Host " REPARO FINALIZADO"
>> "%PS1%" echo Write-Host "======================================="
>> "%PS1%" echo Write-Host "Log salvo em: $Log"
>> "%PS1%" echo Write-Host "Recomendo testar uma pagina de impressao agora."

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"

echo.
echo Processo finalizado.
echo Verifique o log na Area de Trabalho.
echo.
pause
goto MENU

:AUDIO
cls
echo ==========================================
echo              REPARAR AUDIO
echo ==========================================
echo.
echo [1/5] Reiniciando servicos de audio...
net stop Audiosrv /y >nul 2>&1
net stop AudioEndpointBuilder /y >nul 2>&1
net start AudioEndpointBuilder >nul 2>&1
net start Audiosrv >nul 2>&1

echo.
echo [2/5] Limpando configuracoes temporarias de audio...
reg delete "HKCU\Software\Microsoft\Multimedia\Audio" /f >nul 2>&1

echo.
echo [3/5] Verificando servicos principais...
sc query Audiosrv
sc query AudioEndpointBuilder

echo.
echo [4/5] Abrindo painel de som...
start control mmsys.cpl sounds

echo.
echo [5/5] Reparo de audio finalizado.
echo Se o audio ainda nao voltar, reinicie o computador.
echo.
pause
goto MENU

:SFC
cls
echo ==========================================
echo REPARANDO ARQUIVOS WINDOWS (SFC)
echo ==========================================
sfc /scannow
pause
goto MENU

:DISM
cls
echo ==========================================
echo REPARANDO IMAGEM WINDOWS (DISM)
echo ==========================================
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto MENU

:TOOLS
cls
echo ==========================================
echo FERRAMENTAS TECNICAS
echo ==========================================
echo.
echo [1] MSConfig
echo [2] Programas e Recursos
echo [3] Gerenciador de Tarefas
echo [4] Monitor de Recursos
echo [5] Conexoes de Rede
echo [6] Servicos
echo [7] Gerenciador de Dispositivos
echo [8] Limpeza de Disco
echo [9] Voltar
echo.

set /p tool=Escolha: 

if "%tool%"=="1" start msconfig
if "%tool%"=="2" start appwiz.cpl
if "%tool%"=="3" start taskmgr
if "%tool%"=="4" start resmon
if "%tool%"=="5" start ncpa.cpl
if "%tool%"=="6" start services.msc
if "%tool%"=="7" start devmgmt.msc
if "%tool%"=="8" start cleanmgr

goto MENU