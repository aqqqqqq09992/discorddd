Clear-Host
Write-Host "========================================" -ForegroundColor Green
Write-Host "         DISCORD BOT STARTUP" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check Node.js
Write-Host "Checking Node.js installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Node.js from:" -ForegroundColor Yellow
    Write-Host "https://nodejs.org/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "After installation, restart your computer" -ForegroundColor Yellow
    Write-Host "and run this file again." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Installing dependencies..." -ForegroundColor Yellow
npm install

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to install dependencies!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Deploying commands..." -ForegroundColor Yellow
node deploy-commands.js

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to deploy commands!" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "         BOT IS STARTING..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

node index.js

Read-Host "Press Enter to exit"
