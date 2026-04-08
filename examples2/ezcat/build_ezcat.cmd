@echo off
setlocal EnableExtensions
set "ROOT=%~dp0"
if "%LLVM_BIN%"=="" set "LLVM_BIN=C:\Program Files\LLVM\bin"
set "CLANG=%LLVM_BIN%\clang.exe"
if not exist "%CLANG%" (
  echo [ezcat] LLVM_BIN not found: "%CLANG%"
  echo [ezcat] Set LLVM_BIN to the directory containing clang.exe
  exit /b 1
)

rem Npcap ドライバ（C:\Program Files\Npcap 等）と開発用 SDK は別物。SDK は zip を展開したフォルダ（Include\pcap.h, Lib\x64\wpcap.lib）。
if not "%NPCAP_SDK%"=="" goto :sdk_set
if exist "%ROOT%npcap-sdk\Include\pcap.h" set "NPCAP_SDK=%ROOT%npcap-sdk" & goto :sdk_set
if exist "C:\Npcap\SDK\Include\pcap.h" set "NPCAP_SDK=C:\Npcap\SDK" & goto :sdk_set
if exist "%ProgramFiles%\Npcap\SDK\Include\pcap.h" set "NPCAP_SDK=%ProgramFiles%\Npcap\SDK" & goto :sdk_set
if exist "%ProgramW6432%\Npcap\SDK\Include\pcap.h" set "NPCAP_SDK=%ProgramW6432%\Npcap\SDK" & goto :sdk_set
set "NPCAP_SDK=C:\Npcap\SDK"

:sdk_set
if exist "%NPCAP_SDK%\Include\pcap.h" goto :sdk_ok

echo [ezcat] Npcap SDK not found: "%NPCAP_SDK%\Include\pcap.h"
echo.
if exist "%ProgramFiles%\Npcap\npcap.sys" (
  echo [ezcat] Npcap driver found: "%ProgramFiles%\Npcap"
  echo [ezcat] Building needs the separate "Npcap SDK" developer pack ^(pcap.h, wpcap.lib^).
  echo [ezcat] Download the SDK zip from npcap.com ^(Downloads - Npcap SDK^), extract to e.g. C:\Npcap\SDK
  echo [ezcat] or set NPCAP_SDK to that folder. Same tree under %ROOT%npcap-sdk is auto-detected.
) else (
  echo [ezcat] Install Npcap from npcap.com, then add the Npcap SDK zip and set NPCAP_SDK.
)
echo.
exit /b 1

:sdk_ok
set "OUT=%ROOT%out"
if not exist "%OUT%" mkdir "%OUT%"

set "NPCAP_LIB=%NPCAP_SDK%\Lib\x64"
if not exist "%NPCAP_LIB%\wpcap.lib" (
  echo [ezcat] wpcap.lib not found: "%NPCAP_LIB%\wpcap.lib"
  echo [ezcat] SDK の Lib\x64 が揃っているか確認してください。
  exit /b 1
)

echo [ezcat] clang: "%CLANG%"
echo [ezcat] Npcap SDK: "%NPCAP_SDK%"
echo [ezcat] out: "%OUT%\ezcat.exe"

rem 詳細ログ: 既定は ezcat_lowsock.h で EZCAT_DEBUG_ALL=0。有効化は -DEZCAT_DEBUG_ALL=1 を次行に追加
"%CLANG%" -target x86_64-pc-windows-msvc -O2 -g -Wall -Wextra ^
  -finput-charset=UTF-8 -fexec-charset=UTF-8 ^
  -D_CRT_SECURE_NO_WARNINGS -DWIN32_LEAN_AND_MEAN -D_WIN32_WINNT=0x0601 ^
  -I"%NPCAP_SDK%\Include" ^
  -o "%OUT%\ezcat.exe" ^
  "%ROOT%ezcat_main.c" "%ROOT%ezcat_master.c" "%ROOT%ezcat_lowsock.c" ^
  -L"%NPCAP_LIB%" -lwpcap -lPacket -liphlpapi

set "EC=%ERRORLEVEL%"
if %EC% neq 0 exit /b %EC%
echo [ezcat] OK: "%OUT%\ezcat.exe"
exit /b 0
