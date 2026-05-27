# ==============================================================================
# ------------------------------------------------------------------------------
#   C L E A R S T R I K E
#   ULTIMATE 2-STAGE SHADER PURGE & HARDCORE ESPORTS OPTIMIZER
# ------------------------------------------------------------------------------
#   [CREDITS / OWNERSHIP]
#   Project ClearStrike is strictly designed, engineered, and maintained by:
#   > Developed by @diazdroid
#   > Made by @diazdroid
#   > Engineered by @diazdroid
#   > Creado por @diazdroid (Spanish)
#   > Fait par @diazdroid (French)
#   > Hergestellt von @diazdroid (German)
#   > Creato da @diazdroid (Italian)
#   > Yapımcı: @diazdroid (Turkish)
#   > 開発者 @diazdroid (Japanese)
# ------------------------------------------------------------------------------
#   ARCHITECTURE: 2-STAGE NORMAL BOOT ONLY (Bypasses Safe Mode loops)
#   EXECUTION: Built for Web-Execution (irm | iex)
#   VERSION: 1.0.3 (Global Stable Build - Self-Hosted Dependencies)
# ==============================================================================

$ErrorActionPreference = "Continue"
$TempDir = "$env:SystemRoot\Temp"

# --- Force TLS 1.2 for Web Requests (Prevents download errors on older systems) ---
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# --- Administrator Privilege Check (Fixed for Web Execution) ---
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Clear-Host
    Write-Host "==================================================" -ForegroundColor Red
    Write-Host "    [ERROR] ADMINISTRATOR PRIVILEGES REQUIRED     " -ForegroundColor Red
    Write-Host "==================================================" -ForegroundColor Red
    Write-Host "ClearStrike is designed to be executed directly from the web." -ForegroundColor White
    Write-Host "Please close this window, open PowerShell as ADMINISTRATOR," -ForegroundColor Yellow
    Write-Host "and paste your command again." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
    Exit
}

# --- Advanced Logging Configuration ---
$LogDir = "$env:SystemDrive\ClearStrike"
if (!(Test-Path $LogDir)) { New-Item -ItemType Directory -Force -Path $LogDir | Out-Null }
$DebugLog = "$LogDir\ClearStrike_Debug.log"

function Write-CSLog {
    param([string]$Message, [string]$Level = "INFO")
    $Timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fff'
    "$Timestamp - [$Level] $Message" | Out-File -FilePath $DebugLog -Append -Encoding UTF8
}

# --- Initial Telemetry ---
$OS = (Get-CimInstance Win32_OperatingSystem).Caption
$PSVer = $PSVersionTable.PSVersion.ToString()
$Arch = $env:PROCESSOR_ARCHITECTURE

$Host.UI.RawUI.WindowTitle = "ClearStrike Optimizer (STAGE 1) | Engineered by @diazdroid"
Clear-Host
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "                  CLEARSTRIKE                     " -ForegroundColor White
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "DEBUG MODE: Full verbose output and logging enabled." -ForegroundColor DarkGray
Write-CSLog "ClearStrike Initialized. (2-Stage Normal Boot Architecture)" "INIT"
Write-CSLog "Host Environment: $OS | Architecture: $Arch | PS Version: $PSVer" "SYSINFO"
Write-CSLog "Executing User: $env:USERNAME" "SYSINFO"

# ==============================================================================
# USER CONSENT & DISCLAIMER
# ==============================================================================
Write-Host "================================================================================" -ForegroundColor Red
Write-Host "                              !!! DISCLAIMER !!!                                " -ForegroundColor Red
Write-Host "================================================================================" -ForegroundColor Red
Write-Host "ClearStrike will aggressively optimize your system in NORMAL MODE" -ForegroundColor White
Write-Host "for the absolute lowest input lag and peak E-Sports performance.`n" -ForegroundColor White
Write-Host "  1. Your system will AUTOMATICALLY REBOOT 2 TIMES." -ForegroundColor DarkGray
Write-Host "  2. NVIDIA services will be suspended to purge locked shader caches." -ForegroundColor DarkGray
Write-Host "  3. Hardcore registry tweaks (P0 State, MSI Mode, HDCP OFF) will be enforced." -ForegroundColor DarkGray
Write-Host "  4. ClearStrike NVIDIA Profile ('Unlimited' Cache, ULLM) will be injected.`n" -ForegroundColor DarkGray
Write-Host "  Log Path: $DebugLog" -ForegroundColor DarkYellow
Write-Host "  Made by: @diazdroid" -ForegroundColor Cyan
Write-Host "================================================================================" -ForegroundColor Red
$confirm = Read-Host "Do you wish to proceed? (Y/N)"
if ($confirm -notmatch '^[Yy]$') {
    Write-Host "`n[-] Operation cancelled by user. ClearStrike shutting down." -ForegroundColor Yellow
    Write-CSLog "User aborted the operation. Exiting." "WARN"
    Start-Sleep -Seconds 2
    Exit
}
Write-CSLog "User Consent Confirmed. Proceeding to Stage 1." "INFO"

# --- Connectivity Check ---
Write-Host "`n[*] Verifying active network routes and DNS..." -ForegroundColor DarkGray
$Ping = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet -ErrorAction SilentlyContinue
if (!$Ping) {
    Write-Host "[!] Active Internet connection required to resolve dependencies!" -ForegroundColor Red
    Write-CSLog "Network validation failed (ICMP 8.8.8.8 timeout). Exiting." "FATAL"
    Start-Sleep -Seconds 3
    exit
}
Write-Host "[+] Network validation passed." -ForegroundColor Green
Write-CSLog "Network validation passed. DNS resolving actively." "DEBUG"

# ==============================================================================
# STAGE 2 PAYLOAD (Cache Purge, Hardcore Tweaks & ClearStrike Profile)
# ==============================================================================
$Stage2Script = @'
$ErrorActionPreference = "Continue"
$TempDir = "$env:SystemRoot\Temp"
$LogDir = "$env:SystemDrive\ClearStrike"
$DebugLog = "$LogDir\ClearStrike_Debug.log"

function Write-CSLog {
    param([string]$Message, [string]$Level = "INFO")
    $Timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fff'
    "$Timestamp - [$Level] $Message" | Out-File -FilePath $DebugLog -Append -Encoding UTF8
}

Write-CSLog "=========================================" "STAGE2"
Write-CSLog "STAGE 2 PAYLOAD EXECUTION INITIATED" "STAGE2"
Write-CSLog "=========================================" "STAGE2"

$Host.UI.RawUI.WindowTitle = "ClearStrike Optimizer (STAGE 2) | Engineered by @diazdroid"
Clear-Host
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " STAGE 2: CACHE PURGE & HARDCORE CLEARSTRIKE TWEAKS" -ForegroundColor Cyan
Write-Host " Made by @diazdroid" -ForegroundColor DarkGray
Write-Host "==================================================" -ForegroundColor Cyan
Start-Sleep -Seconds 2

Write-Host "`n[*] Issuing kill signals to NVIDIA subsystems..." -ForegroundColor Yellow
Write-CSLog "Sending stop command to NVDisplay.ContainerLocalSystem..." "DEBUG"
Stop-Service -Name "NVDisplay.ContainerLocalSystem" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "nvcontainer" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
Write-Host "[+] NVIDIA subsystems suspended." -ForegroundColor Green

$TargetPaths = [System.Collections.Generic.List[string]]::new()
if (Test-Path "$env:LOCALAPPDATA\d3dscache") { $TargetPaths.Add("$env:LOCALAPPDATA\d3dscache") }
if (Test-Path "$env:LOCALAPPDATA\NVIDIA\DXCache") { $TargetPaths.Add("$env:LOCALAPPDATA\NVIDIA\DXCache") }
if (Test-Path "$env:LOCALAPPDATA\NVIDIA\GLCache") { $TargetPaths.Add("$env:LOCALAPPDATA\NVIDIA\GLCache") }
if (Test-Path "$env:APPDATA\NVIDIA\ComputeCache") { $TargetPaths.Add("$env:APPDATA\NVIDIA\ComputeCache") }
if (Test-Path "$env:PROGRAMDATA\NVIDIA Corporation\NV_Cache") { $TargetPaths.Add("$env:PROGRAMDATA\NVIDIA Corporation\NV_Cache") }
if (Test-Path $env:TEMP) { $TargetPaths.Add($env:TEMP) }

$SteamReg = Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -Name "SteamPath" -ErrorAction SilentlyContinue
if ($SteamReg -and $SteamReg.SteamPath) {
    $NormalizedSteamPath = $SteamReg.SteamPath.Replace('/', '\')
    $CS2ShaderCache = Join-Path $NormalizedSteamPath "steamapps\shadercache\730"
    if (Test-Path $CS2ShaderCache) { $TargetPaths.Add($CS2ShaderCache) }
}

Write-Host "`n[*] Executing Deep Cache Purge..." -ForegroundColor Yellow
Write-CSLog "Commencing Deep Cache Purge across $($TargetPaths.Count) targeted directories." "INFO"
$TotalDeleted = 0
foreach ($Path in $TargetPaths) {
    Write-Host "    -> Traversing: $Path" -ForegroundColor DarkGray
    if (Test-Path $Path) {
        $Items = Get-ChildItem -Path $Path -Recurse -Force -ErrorAction SilentlyContinue
        $deletedCount = 0
        foreach ($Item in $Items) {
            try {
                if ($Item.Attributes -band [System.IO.FileAttributes]::ReadOnly) {
                    $Item.Attributes = $Item.Attributes -band -bnot [System.IO.FileAttributes]::ReadOnly
                }
                Remove-Item -Path $Item.FullName -Recurse -Force -ErrorAction Stop
                $deletedCount++
                $TotalDeleted++
            } catch {}
        }
        Write-Host "       [+] Purged $deletedCount fragmented objects." -ForegroundColor Green
        Write-CSLog "Purged $deletedCount items successfully from target: $Path" "DEBUG"
    }
}
Write-CSLog "Cache Purge Complete. Total fragmented objects destroyed: $TotalDeleted" "INFO"

Write-Host "`n[*] Injecting Hardcore Registry Tweaks..." -ForegroundColor Yellow
$regCommands = @(
    @("HKLM\System\ControlSet001\Services\nvlddmkm\Parameters\Global\NVTweak", "NvCplPhysxAuto", "0"),
    @("HKLM\System\ControlSet001\Services\nvlddmkm\Parameters\Global\NVTweak", "NvDevToolsVisible", "1"),
    @("HKLM\System\ControlSet001\Services\nvlddmkm\Parameters\Global\NVTweak", "RmProfilingAdminOnly", "0"),
    @("HKCU\Software\NVIDIA Corporation\NvTray", "StartOnLogin", "0"),
    @("HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS", "EnableGR535", "0"),
    @("HKLM\SYSTEM\ControlSet001\Services\nvlddmkm\Parameters\FTS", "EnableGR535", "0"),
    @("HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters\FTS", "EnableGR535", "0"),
    @("HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client", "OptInOrOutPreference", "0"),
    @("HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup", "SendTelemetryData", "0"),
    @("HKLM\SOFTWARE\Microsoft\Windows\Dwm", "OverlayTestMode", "5")
)

foreach ($cmd in $regCommands) {
    $path = $cmd[0]; $name = $cmd[1]; $value = $cmd[2]
    cmd /c "reg add `"$path`" /v `"$name`" /t REG_DWORD /d `"$value`" /f >nul 2>&1"
    Write-CSLog "Registry injected: [$name] = $value into $path" "TWEAK"
}
Write-Host "[+] Base registry injection successful." -ForegroundColor Green

# --- GPU Class Settings ---
Write-Host "`n[*] Forcing P0 State & HDCP Isolation..." -ForegroundColor Yellow
Write-CSLog "Applying P0 State and disabling HDCP globally across Display Adapters." "DEBUG"
$subkeys = Get-ChildItem -Path "Registry::HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" -Force -ErrorAction SilentlyContinue
foreach($key in $subkeys){
    if ($key.Name -notmatch 'Configuration'){
        $regPath = $key.Name -replace "HKEY_LOCAL_MACHINE", "HKLM"
        cmd /c "reg add `"$regPath`" /v `"RmProfilingAdminOnly`" /t REG_DWORD /d `"0`" /f >nul 2>&1"
        cmd /c "reg add `"$regPath`" /v `"RMHdcpKeyglobZero`" /t REG_DWORD /d `"1`" /f >nul 2>&1"
        cmd /c "reg add `"$regPath`" /v `"DisableDynamicPstate`" /t REG_DWORD /d `"1`" /f >nul 2>&1"
        Write-CSLog "Applied Dynamic P-State override to Video Controller: $regPath" "TWEAK"
    }
}
Write-Host "[+] Power States enforced." -ForegroundColor Green

# --- MSI Mode Injection ---
Write-Host "`n[*] Re-routing IRQs to Message Signaled Interrupts (MSI)..." -ForegroundColor Yellow
$gpuDevices = Get-PnpDevice -Class Display -ErrorAction SilentlyContinue
foreach ($gpu in $gpuDevices) {
    if ($gpu.InstanceId) {
        $instanceID = $gpu.InstanceId
        cmd /c "reg add `"HKLM\SYSTEM\ControlSet001\Enum\$instanceID\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties`" /v `"MSISupported`" /t REG_DWORD /d `"1`" /f >nul 2>&1"
        Write-CSLog "MSI Mode active for device: $instanceID" "TWEAK"
        Write-Host "    -> Hardware ID: $instanceID" -ForegroundColor DarkGray
    }
}
Write-Host "[+] Interrupt routing optimized." -ForegroundColor Green

# --- nvidia-smi optimization ---
$smiPath = "C:\Program Files\NVIDIA Corporation\NVSMI\nvidia-smi.exe"
if (Test-Path $smiPath) {
    Write-CSLog "NVIDIA-SMI detected. Forcing optimal application clocks and ECC states." "DEBUG"
    Start-Process -FilePath $smiPath -ArgumentList "-e 0" -WindowStyle Hidden -Wait
    Start-Process -FilePath $smiPath -ArgumentList "-acp 0" -WindowStyle Hidden -Wait
}

Write-Host "`n[*] Synthesizing ClearStrike Ultimate Profile XML..." -ForegroundColor Yellow
$nipFull = @"
<?xml version="1.0" encoding="utf-16"?>
<ArrayOfProfile>
  <Profile>
    <ProfileName>Base Profile</ProfileName>
    <Executables/>
    <Settings>
      <ProfileSetting><SettingNameInfo>Frame Rate Limiter V3</SettingNameInfo><SettingID>277041154</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>GSYNC - Application Mode</SettingNameInfo><SettingID>294973784</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>GSYNC - Application State</SettingNameInfo><SettingID>279476687</SettingID><SettingValue>4</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>GSYNC - Global Feature</SettingNameInfo><SettingID>278196567</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>GSYNC - Global Mode</SettingNameInfo><SettingID>278196727</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>GSYNC - Indicator Overlay</SettingNameInfo><SettingID>268604728</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Maximum Pre-Rendered Frames</SettingNameInfo><SettingID>8102046</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Preferred Refresh Rate</SettingNameInfo><SettingID>6600001</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Ultra Low Latency - CPL State</SettingNameInfo><SettingID>390467</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Ultra Low Latency - Enabled</SettingNameInfo><SettingID>277041152</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Vertical Sync</SettingNameInfo><SettingID>11041231</SettingID><SettingValue>138504007</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Vertical Sync - Smooth AFR Behavior</SettingNameInfo><SettingID>270198627</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Vertical Sync - Tear Control</SettingNameInfo><SettingID>5912412</SettingID><SettingValue>2525368439</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Vulkan/OpenGL Present Method</SettingNameInfo><SettingID>550932728</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Antialiasing - Gamma Correction</SettingNameInfo><SettingID>276652957</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Antialiasing - Mode</SettingNameInfo><SettingID>276757595</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Antialiasing - Setting</SettingNameInfo><SettingID>282555346</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Anisotropic Filter - Optimization</SettingNameInfo><SettingID>8703344</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Anisotropic Filter - Sample Optimization</SettingNameInfo><SettingID>15151633</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Anisotropic Filtering - Mode</SettingNameInfo><SettingID>282245910</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Anisotropic Filtering - Setting</SettingNameInfo><SettingID>270426537</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Texture Filtering - Negative LOD Bias</SettingNameInfo><SettingID>1686376</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Texture Filtering - Quality</SettingNameInfo><SettingID>13510289</SettingID><SettingValue>20</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Texture Filtering - Trilinear Optimization</SettingNameInfo><SettingID>3066610</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>CUDA - Force P2 State</SettingNameInfo><SettingID>1343646814</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>CUDA - Sysmem Fallback Policy</SettingNameInfo><SettingID>283962569</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Power Management - Mode</SettingNameInfo><SettingID>274197361</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Shader Cache - Cache Size</SettingNameInfo><SettingID>11306135</SettingID><SettingValue>4294967295</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Threaded Optimization</SettingNameInfo><SettingID>549528094</SettingID><SettingValue>1</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>OpenGL GDI Compatibility</SettingNameInfo><SettingID>544392611</SettingID><SettingValue>0</SettingValue><ValueType>Dword</ValueType></ProfileSetting>
      <ProfileSetting><SettingNameInfo>Preferred OpenGL GPU</SettingNameInfo><SettingID>550564838</SettingID><SettingValue>id,2.0:268410DE,00000100,GF - (400,2,161,24564) @ (0)</SettingValue><ValueType>String</ValueType></ProfileSetting>
    </Settings>
  </Profile>
</ArrayOfProfile>
"@
Set-Content -Path "$TempDir\inspector_full.nip" -Value $nipFull -Force

$inspectorPath = "$TempDir\inspector.exe"
if (Test-Path $inspectorPath) {
    Write-CSLog "Executing silent import of ClearStrike Profile XML..." "DEBUG"
    Start-Process -FilePath $inspectorPath -ArgumentList "-silentImport -silent `"$TempDir\inspector_full.nip`"" -Wait -PassThru | Out-Null
    Write-Host "[+] ClearStrike Inspector profile securely injected." -ForegroundColor Green
    Write-CSLog "Profile injection successful." "INFO"
}

# --- Restarting Services ---
Write-CSLog "Restoring NVIDIA subsystems to operational state." "DEBUG"
Start-Service -Name "NVDisplay.ContainerLocalSystem" -ErrorAction SilentlyContinue

# --- Cleanup Temp Files ---
Write-CSLog "Performing garbage collection on Temp artifacts." "DEBUG"
Remove-Item -Path "$TempDir\inspector.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$TempDir\inspector_off.nip" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$TempDir\inspector_full.nip" -Force -ErrorAction SilentlyContinue

Write-CSLog "=========================================" "STAGE2"
Write-CSLog "STAGE 2 EXECUTION SUCCESSFULLY COMPLETED" "STAGE2"
Write-CSLog "=========================================" "STAGE2"

Write-Host "`n==================================================" -ForegroundColor Green
Write-Host " STAGE 2 COMPLETED! System will reboot in 10 seconds." -ForegroundColor Green
Write-Host " Telemetry and Logs saved to: $DebugLog" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Start-Sleep -Seconds 10

Remove-Item -Path "$TempDir\ClearStrike_Stage2.ps1" -Force -ErrorAction SilentlyContinue
shutdown -r -t 00
'@
Set-Content -Path "$TempDir\ClearStrike_Stage2.ps1" -Value $Stage2Script -Force
Write-CSLog "Stage 2 Payload successfully constructed in $TempDir" "INFO"


# ==============================================================================
# STAGE 1 (Preparation & Download - Normal Mode)
# ==============================================================================
Write-Host "`n==================================================" -ForegroundColor Cyan
Write-Host " STAGE 1: DEPENDENCIES & PREPARATION" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Start-Sleep -Seconds 2

# --- Download Inspector ---
Write-Host "[*] Fetching NVIDIA Profile Inspector module..." -ForegroundColor Yellow
if (!(Test-Path "$TempDir\inspector.exe")) {
    try {
        Write-CSLog "Initiating web request for inspector.exe payload from ClearStrike repository." "DEBUG"
        Invoke-WebRequest "https://raw.githubusercontent.com/diazdroid/ClearStrike/main/inspector.exe" -OutFile "$TempDir\inspector.exe" -UseBasicParsing
        Write-Host "    [+] Module downloaded successfully." -ForegroundColor Green
        Write-CSLog "Inspector payload downloaded successfully to $TempDir" "INFO"
    } catch {
        Write-Host "    [!] Fatal Error: Download failed. Check firewall or network." -ForegroundColor Red
        Write-CSLog "Web request failed: $_" "FATAL"
        Exit
    }
} else {
    Write-Host "    [+] Module already exists in cache." -ForegroundColor Green
    Write-CSLog "Inspector payload found in cache. Download skipped." "DEBUG"
}

# --- Force Shader Cache OFF for Stage 2 ---
Write-Host "`n[*] Suspending Shader Cache parameters for Stage 2..." -ForegroundColor Yellow
$nipOff = @"
<?xml version="1.0" encoding="utf-16"?>
<ArrayOfProfile>
  <Profile>
    <ProfileName>Base Profile</ProfileName>
    <Executables/>
    <Settings>
      <ProfileSetting>
        <SettingNameInfo>Shader Cache - Cache Size</SettingNameInfo>
        <SettingID>11306135</SettingID>
        <SettingValue>0</SettingValue>
        <ValueType>Dword</ValueType>
      </ProfileSetting>
    </Settings>
  </Profile>
</ArrayOfProfile>
"@
Set-Content -Path "$TempDir\inspector_off.nip" -Value $nipOff -Force
Write-CSLog "Generated temporary Null-Cache Profile (inspector_off.nip)." "DEBUG"

Start-Process -FilePath "$TempDir\inspector.exe" -ArgumentList "-silentImport -silent `"$TempDir\inspector_off.nip`"" -Wait -PassThru | Out-Null
Write-Host "    [+] Temporary Cache limit set to 0 bytes." -ForegroundColor Green
Write-CSLog "Temporary Null-Cache Profile injected." "INFO"

# --- Stage 2 RunOnce Registration (HKLM - Machine Level) ---
Write-Host "`n[*] Registering automated OS boot hook for STAGE 2..." -ForegroundColor Yellow
$RunOnceCmdStage2 = "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Maximized -File `"$TempDir\ClearStrike_Stage2.ps1`""
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" -Name "*ClearStrikeOpt" -Value $RunOnceCmdStage2 -Force

$regCheck = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" -Name "*ClearStrikeOpt" -ErrorAction SilentlyContinue
if ($regCheck) {
    Write-Host "    [+] Boot hook armed successfully." -ForegroundColor Green
    Write-CSLog "HKLM RunOnce Boot Hook registered securely (*ClearStrikeOpt)." "INFO"
} else {
    Write-Host "    [!] Error: Boot hook failed to register in HKLM!" -ForegroundColor Red
    Write-CSLog "HKLM RunOnce Registration FAILED. Administrator rights might be corrupted." "FATAL"
}

Write-CSLog "STAGE 1 EXECUTION COMPLETE. Scheduling System Reboot." "INFO"
Write-Host "`n==================================================" -ForegroundColor Red
Write-Host " SYSTEM REBOOTING IN 5 SECONDS (STAGE 1 COMPLETE)" -ForegroundColor Red
Write-Host " Stage 2 will automatically launch after Windows starts." -ForegroundColor DarkGray
Write-Host "==================================================" -ForegroundColor Red
Start-Sleep -Seconds 5
shutdown -r -t 00