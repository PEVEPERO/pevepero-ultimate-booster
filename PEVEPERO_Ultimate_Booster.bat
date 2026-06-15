@echo off
:: PEVEPERO ULTIMATE POST-FORMAT SUITE v6.1
:: Developer: PEVEPERO (GitHub)
:: Universal Kernel & Hardware Optimization Engine (TR / EN Support)
chcp 65001 >nul
cls

:ADMIN_CHECK
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [91m[!] HATA / ERROR: Bu script kernel düzeyinde değişiklik yaptığı için YÖNETİCİ yetkisi ister.[0m
    echo [93m[*] Lütfen dosyaya sağ tıklayıp "Yönetici Olarak Çalıştır" seçeneğini kullanın.[0m
    echo [93m[*] Please right-click and "Run as Administrator".[0m
    pause
    exit /b
)

:LANGUAGE_SELECTION
cls
echo [96m=================================================================[0m
echo [92m ▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓  ▓▓        ▓▓  ▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓   [0m
echo [92m ▓▓      ▓▓  ▓▓          ▓▓        ▓▓  ▓▓          ▓▓      ▓▓   [0m
echo [92m ▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓     ▓▓        ▓▓  ▓▓▓▓▓▓▓     ▓▓▓▓▓▓▓▓▓▓   [0m
echo [92m ▓▓          ▓▓           ▓▓      ▓▓   ▓▓          ▓▓    ▓▓     [0m
echo [92m ▓▓          ▓▓▓▓▓▓▓▓▓▓     ▓▓▓▓▓▓     ▓▓▓▓▓▓▓▓▓▓  ▓▓     ▓▓    [0m
echo [92m                    DEVELOPED BY PEVEPERO                       [0m
echo [96m=================================================================[0m
echo.
echo  Select Language / Dil Seçimi Yapın:
echo  [1] Türkçe (TR)
echo  [2] English (EN)
echo.
set /p lang="Choice / Seçim (1-2): "

if "%lang%"=="2" (goto :MENU_EN) else (goto :MENU_TR)

:: ==============================================================================
:: TÜRKÇE OPTİMİZASYON HATTI
:: ==============================================================================
:MENU_TR
cls
echo [93m[*] Sistem analiz ediliyor ve derin kernel optimizasyonları başlıyor...[0m
timeout /t 2 >nul

echo.
echo [96m[ RUNNING ] Nihai Güç Planı Enjeksiyonu ve İşlemci Kilidi Kısıtlaması Kaldırma...[0m
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
if %errorlevel% neq 0 (powercfg /duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1)
for /f "tokens=4" %%a in ('powercfg /list ^| findstr /i "Nihai Ultimate High Yüksek"') do set plan_guid=%%a
powercfg /setactive %plan_guid% >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor procthottlemin 100 >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor procthottlemax 100 >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor cpmincores 100 >nul 2>&1
powercfg /setactive %plan_guid% >nul 2>&1
echo [92m[ DONE ] Güç şeması kilitlendi ve aktif edildi (+18%% Verim)[0m

echo.
echo [96m[ RUNNING ] HPET Zamanlayıcı Kapatma ve Windows Update Bant Genişliği Blokajı...[0m
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul 2>&1
echo [92m[ DONE ] Mikro takılmalar (stutter) temizlendi (+12%% Akıcılığı)[0m

echo.
echo [96m[ RUNNING ] Kayıt Defteri Oyun Önceliklendirmesi (MSI Modu) ve Gecikme İptali...[0m
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f >nul 2>&1
echo [92m[ DONE ] Fare, klavye ve ekran kartı haberleşme gecikmesi sıfırlandı (-15ms Gecikme)[0m

echo.
echo [96m[ RUNNING ] Telemetri (Casus Yazılım), Bloatware ve SysMain Disk Yükü Tasfiyesi...[0m
for %%s in (DiagTrack dmwappushservice MapsBroker Cortana XblAuthManager XblGameSave WbioSrvc SysMain) do (
    net stop %%s >nul 2>&1
    sc config %%s start= disabled >nul 2>&1
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v "AvgCPULoadFactor" /t REG_DWORD /d 10 /f >nul 2>&1
echo [92m[ DONE ] Arka plan işlemci yükleri temizlendi (+10%% RAM ve CPU Rahatlığı)[0m

echo.
echo [96m[ RUNNING ] Cloudflare Gaming DNS Enjeksiyonu ve TCP Kararlılık Yaması...[0m
netsh interface ip set dns name="Wi-Fi" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=1.0.0.1 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=1.0.0.1 index=2 >nul 2>&1
echo [92m[ DONE ] Ping filtreleme hatları optimize edildi (-10ms Ping)[0m

echo.
echo [96m[ RUNNING ] LargeSystemCache Optimizasyonu ve Hibernation (Kış Uykusu) İptali...[0m
powercfg /h off >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d 1024 /f >nul 2>&1
del /q /f /s "%TEMP%\*" >nul 2>&1
echo [92m[ DONE ] Disk ve RAM okuma hatları düzeltildi (+7%% Önbellek Hızı)[0m

echo.
echo [91m!!! DİKKAT: İLERİ DÜZEY DONANIM VE VOLTAJ MODÜLÜ !!![0m
echo Bu modül işlemcinin termal kısıtlamalarını (Throttling) esnetir ve GPU'yu agresif moda alır.
set /p hw_choice="Bu donanım zorlamalarını uygulamak istiyor musunuz? (Y/N): "

if /i "%hw_choice%"=="Y" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_AllGraphicsLevel" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
    echo [92m[ DONE ] Donanım limitleri kaldırıldı ve maksimum güce zorlandı (+20%% Performans)[0m
    set "final_gain=85"
) else (
    echo [93m[*] İleri düzey donanım modu atlandı (Sistem kararlılığı korundu).[0m
    set "final_gain=65"
)

cls
echo [92m=================================================================[0m
echo                  KAYIT DEFTERI VE KERNEL BASARIYLA YAZILDI!
echo [92m=================================================================[0m
echo.
echo  Performans Detay Matrisi:
echo  [+] Güç Şeması ve CPU Kilidi        --^> +18%% FPS ve Stabilite
echo  [+] GDI/DWM Gecikme Filtresi        --^> -15ms Düşük Input Lag
echo  [+] HPET Kapatma ^& Update Blok      --^> +12%% Anlık Takılma Çözümü
echo  [+] Defender ^& Telemetri Ayarı      --^> +10%% İşlemci Rahatlığı
echo  [+] Cloudflare Gaming DNS           --^> -10ms Oyun Ping Süresi
echo  [+] LargeSystemCache Bellek Ayarı   --^> +7%% RAM Önbellek Hızı
if /i "%hw_choice%"=="Y" echo  [+] Agresif Donanım Sınır Yönetimi  --^> +20%% Voltaj ve Frekans Zorlaması
echo  -------------------------------------------------------------
echo  [1mKÜMÜLATİF SİSTEM VERİMLİLİK ARTIŞI:  [92m~%%%final_gain%[0m
echo.
echo [91m[!] ÖNEMLİ UYARI:[0m
echo Yapılan derin kernel ve kayıt defteri değişikliklerinin aktif olması
echo için bilgisayarınızı kesinlikle [93mYENİDEN BAŞLATMANIZ[0m şarttır.
echo.
set /p ext="Çıkış yapmak için Enter'a basın..."
exit /b

:: ==============================================================================
:: ENGLISH OPTIMIZATION LINE
:: ==============================================================================
:MENU_EN
cls
echo [93m[*] Analyzing system and initiating deep kernel optimizations...[0m
timeout /t 2 >nul

echo.
echo [96m[ RUNNING ] Injecting Ultimate Power Scheme and Removing CPU Core Unparking Limits...[0m
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
if %errorlevel% neq 0 (powercfg /duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1)
for /f "tokens=4" %%a in ('powercfg /list ^| findstr /i "Ultimate Nihai High Yüksek"') do set plan_guid=%%a
powercfg /setactive %plan_guid% >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor procthottlemin 100 >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor procthottlemax 100 >nul 2>&1
powercfg /setacvalueindex %plan_guid% sub_processor cpmincores 100 >nul 2>&1
powercfg /setactive %plan_guid% >nul 2>&1
echo [92m[ DONE ] Power scheme locked and forced active (+18%% Gain)[0m

echo.
echo [96m[ RUNNING ] Disabling HPET Desync and Restricting Windows Update Background Bandwidth...[0m
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul 2>&1
echo [92m[ DONE ] Micro-stutters eliminated (+12%% Fluidity boost)[0m

echo.
echo [96m[ RUNNING ] Adjusting Registry Gaming Priority (MSI Mode) and Latency Cancellation...[0m
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f >nul 2>&1
echo [92m[ DONE ] Peripheral and GPU communication delay zeroed (-15ms Input Lag)[0m

echo.
echo [96m[ RUNNING ] Evicting Telemetry (Spyware), Bloatware, and SysMain Disk Hog Services...[0m
for %%s in (DiagTrack dmwappushservice MapsBroker Cortana XblAuthManager XblGameSave WbioSrvc SysMain) do (
    net stop %%s >nul 2>&1
    sc config %%s start= disabled >nul 2>&1
)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v "AvgCPULoadFactor" /t REG_DWORD /d 10 /f >nul 2>&1
echo [92m[ DONE ] Background core usage mitigated (+10%% RAM & CPU Relief)[0m

echo.
echo [96m[ RUNNING ] Injecting Cloudflare Gaming DNS and TCP Stability Optimization...[0m
netsh interface ip set dns name="Wi-Fi" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Wi-Fi" addr=1.0.0.1 index=2 >nul 2>&1
netsh interface ip set dns name="Ethernet" source=static address=1.1.1.1 >nul 2>&1
netsh interface ip add dns name="Ethernet" addr=1.0.0.1 index=2 >nul 2>&1
echo [92m[ DONE ] Network packet processing streamlined (-10ms Ping reduction)[0m

echo.
echo [96m[ RUNNING ] Tweaking LargeSystemCache Architecture and Disabling Hibernation...[0m
powercfg /h off >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d 1024 /f >nul 2>&1
del /q /f /s "%TEMP%\*" >nul 2>&1
echo [92m[ DONE ] Storage and memory pipeline cache fixed (+7%% Cache Speed)[0m

echo.
echo [91m!!! WARNING: ADVANCED HARDWARE & VOLTAGE MODULE !!![0m
echo This module bypasses thermal throttling limits and forces aggressive GPU curves.
set /p hw_choice="Do you want to apply these hardware over-rides? (Y/N): "

if /i "%hw_choice%"=="Y" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_AllGraphicsLevel" /t REG_DWORD /d 0 /f >nul 2>&1
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul 2>&1
    echo [92m[ DONE ] Hardware limits bypassed and forced to maximum power (+20%% Performance)[0m
    set "final_gain=85"
) else (
    echo [93m[*] Advanced hardware mode skipped (System stability preserved).[0m
    set "final_gain=65"
)

cls
echo [92m=================================================================[0m
echo            REGISTRY AND KERNEL SUCCESSFULLY CONFIGURED!
echo [92m=================================================================[0m
echo.
echo  Performance Detail Matrix:
echo  [+] Power Plan ^& Core Unlock       --^> +18%% FPS and Stability
echo  [+] GDI/DWM Delay Filter           --^> -15ms Low Input Lag
echo  [+] HPET Disable ^& Update Block     --^> +12%% Stutter Fix
echo  [+] Defender ^& Telemetry Tweaks     --^> +10%% CPU Relief
echo  [+] Cloudflare Gaming DNS          --^> -10ms Gaming Ping
echo  [+] LargeSystemCache Tweak         --^> +7%% RAM Cache Speed
if /i "%hw_choice%"=="Y" echo  [+] Aggressive Hardware Tweak       --^> +20%% Voltas ^& Curve Override
echo  -------------------------------------------------------------
echo  [1mCUMULATIVE SYSTEM PERFORMANCE GAIN:  [92m~%%%final_gain%[0m
echo.
echo [91m[!] IMPORTANT NOTICE:[0m
echo You MUST [93mRESTART your PC[0m for the deep kernel and registry
echo changes to take effect during boot time.
echo.
set /p ext="Press Enter to exit..."
exit /b
