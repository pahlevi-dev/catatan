
@echo off
setlocal
title Website Assets - Folder Generator

echo.
echo ==========================================
echo    WEBSITE ASSETS - FOLDER GENERATOR
echo ==========================================
echo.

set "ROOT=website-assets"

if exist "%ROOT%" (
    echo [INFO] Folder "%ROOT%" sudah ada.
    echo Script akan menambahkan folder dan file
    echo yang belum tersedia tanpa menghapus file lama.
    echo.
) else (
    mkdir "%ROOT%"
)

REM ===== IMAGES =====
for %%D in (
    "images\logo"
    "images\banners"
    "images\backgrounds"
    "images\products"
    "images\avatars"
    "images\icons"
    "images\blog"
) do call :MakeDir "%%~D"

REM ===== ICONS =====
for %%D in (
    "icons\svg"
    "icons\png"
    "icons\webp"
) do call :MakeDir "%%~D"

REM ===== FONTS =====
for %%D in (
    "fonts\woff2"
    "fonts\woff"
    "fonts\ttf"
) do call :MakeDir "%%~D"

REM ===== CSS =====
for %%D in (
    "css\base"
    "css\components"
    "css\themes"
    "css\utilities"
) do call :MakeDir "%%~D"

REM ===== JAVASCRIPT =====
for %%D in (
    "js\utils"
    "js\components"
    "js\vendors"
) do call :MakeDir "%%~D"

REM ===== MEDIA =====
for %%D in (
    "media\audio"
    "media\video"
) do call :MakeDir "%%~D"

REM ===== DOCUMENTS =====
for %%D in (
    "documents\pdf"
    "documents\downloads"
) do call :MakeDir "%%~D"

REM ===== KEEP EMPTY FOLDERS IN GIT =====
for %%D in (
    "images\logo"
    "images\banners"
    "images\backgrounds"
    "images\products"
    "images\avatars"
    "images\icons"
    "images\blog"
    "icons\svg"
    "icons\png"
    "icons\webp"
    "fonts\woff2"
    "fonts\woff"
    "fonts\ttf"
    "css\base"
    "css\components"
    "css\themes"
    "css\utilities"
    "js\utils"
    "js\components"
    "js\vendors"
    "media\audio"
    "media\video"
    "documents\pdf"
    "documents\downloads"
) do call :MakeKeep "%%~D"

REM ===== README =====
if not exist "%ROOT%\README.md" (
    > "%ROOT%\README.md" (
        echo # Website Assets
        echo.
        echo Repository untuk asset website pribadi.
        echo.
        echo ## Folder
        echo - images: gambar, logo, banner, dan foto
        echo - icons: ikon SVG, PNG, dan WebP
        echo - fonts: file font web
        echo - css: stylesheet
        echo - js: JavaScript
        echo - media: audio dan video
        echo - documents: dokumen publik
        echo.
        echo ## CDN jsDelivr
        echo Ganti USERNAME dengan username GitHub Anda.
        echo.
        echo https://cdn.jsdelivr.net/gh/USERNAME/website-assets@v1.0.0/
        echo.
        echo Gunakan tag rilis seperti v1.0.0 untuk produksi.
    )
)

REM ===== GITIGNORE =====
if not exist "%ROOT%\.gitignore" (
    > "%ROOT%\.gitignore" (
        echo .DS_Store
        echo Thumbs.db
        echo desktop.ini
        echo *.psd
        echo *.ai
        echo *.blend
    )
)

REM ===== LICENSE PLACEHOLDER =====
if not exist "%ROOT%\LICENSE" (
    > "%ROOT%\LICENSE" (
        echo Copyright (c) YEAR YOUR NAME
        echo All rights reserved.
        echo.
        echo Specify the license terms before distributing
        echo these assets to other people.
    )
)

echo.
echo ==========================================
echo [SELESAI] Struktur asset berhasil dibuat!
echo Lokasi: %CD%\%ROOT%
echo ==========================================
echo.
explorer "%CD%\%ROOT%"
pause
exit /b

:MakeDir
if not exist "%ROOT%\%~1" (
    mkdir "%ROOT%\%~1"
    echo [BUAT] %~1
)
exit /b

:MakeKeep
if not exist "%ROOT%\%~1\.gitkeep" (
    type nul > "%ROOT%\%~1\.gitkeep"
)
exit /b