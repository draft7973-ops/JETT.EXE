$ErrorActionPreference = "SilentlyContinue"

[Console]::Title = "DARYU RUNE"

function Show-Header {

```
Clear-Host

Write-Host ""
Write-Host "██████╗  █████╗ ██████╗ ██╗   ██╗██╗   ██╗" -ForegroundColor Magenta
Write-Host "██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██║   ██║" -ForegroundColor Magenta
Write-Host "██║  ██║███████║██████╔╝ ╚████╔╝ ██║   ██║" -ForegroundColor White
Write-Host "██║  ██║██╔══██║██╔══██╗  ╚██╔╝  ██║   ██║" -ForegroundColor White
Write-Host "██████╔╝██║  ██║██║  ██║   ██║   ╚██████╔╝" -ForegroundColor Magenta
Write-Host "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ " -ForegroundColor Magenta

Write-Host ""
Write-Host " ─────────────────────────────────────────────" -ForegroundColor DarkGray
Write-Host ""
```

}

function Show-Loading {

```
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
```

}

function Write-Console {

```
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
```

}

Show-Loading

while ($true)
{
Show-Header

```
Write-Console "1. PLAY"  "INFO"
Write-Console "2. CLEAR" "INFO"
Write-Console "3. EXIT"  "INFO"

Write-Host ""

Write-Console "SELECT : " "INPUT"

$choice = $Host.UI.ReadLine()

switch ($choice)
{
    "1" {
        Write-Host ""
        Write-Console "PLAY SELECTED" "SUCCESS"
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
```

}
