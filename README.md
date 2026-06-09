notify.ps1 — a simple Windows notification tester that runs from the terminal. Useful for debugging applications that use the Windows notification system (e.g. WPF/WinForms) without launching the main program.

Features:

Send a notification immediately
Send a notification after a 1-minute delay
Send a notification after a custom number of seconds
Runs in a loop — returns to the menu after each action, q to quit
Requirements: Windows 10/11, PowerShell 5+

Usage:

powershell -ExecutionPolicy Bypass -File notify.ps1
With a custom title and message:

powershell -ExecutionPolicy Bypass -File notify.ps1 -Title "Title" -Body "Message"
