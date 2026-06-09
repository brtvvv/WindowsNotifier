param(
    [string]$Title = "WinManager Test",
    [string]$Body  = "Powiadomienie testowe"
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Send-Notification($Title, $Body) {
    $notify = New-Object System.Windows.Forms.NotifyIcon
    $notify.Icon    = [System.Drawing.SystemIcons]::Information
    $notify.Visible = $true
    $notify.ShowBalloonTip(5000, $Title, $Body, [System.Windows.Forms.ToolTipIcon]::Info)
    Start-Sleep -Milliseconds 600
    $notify.Dispose()
}

while ($true) {
    Clear-Host
    Write-Host "=== Tester powiadomien Windows ===" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Tytul : $Title"
    Write-Host "  Tresc : $Body"
    Write-Host ""
    Write-Host "  1. Wyslij teraz"
    Write-Host "  2. Wyslij za minute"
    Write-Host "  3. Wyslij za X sekund"
    Write-Host "  q. Wyjdz"
    Write-Host ""
    $choice = Read-Host "Wybierz opcje"

    switch ($choice.ToLower()) {
        "1" {
            Send-Notification $Title $Body
            Write-Host "Wyslano!" -ForegroundColor Green
            Start-Sleep -Seconds 1
        }
        "2" {
            Write-Host "Czekam 60 sekund... (Ctrl+C aby anulowac)" -ForegroundColor Yellow
            Start-Sleep -Seconds 60
            Send-Notification $Title $Body
            Write-Host "Wyslano!" -ForegroundColor Green
            Start-Sleep -Seconds 1
        }
        "3" {
            $input = Read-Host "Podaj liczbe sekund"
            if ($input -match '^\d+$') {
                Write-Host "Czekam $input sekund... (Ctrl+C aby anulowac)" -ForegroundColor Yellow
                Start-Sleep -Seconds ([int]$input)
                Send-Notification $Title $Body
                Write-Host "Wyslano!" -ForegroundColor Green
                Start-Sleep -Seconds 1
            } else {
                Write-Host "Podaj liczbe calkowita." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
        "q" {
            Write-Host "Do widzenia." -ForegroundColor Gray
            exit
        }
        default {
            Write-Host "Nieprawidlowy wybor." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
}
