# KISEC Final Project - Deployment Script for Windows
Write-Host "🚀 Deploying KISEC Final Project to GitHub Pages..." -ForegroundColor Green

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: Not in a git repository. Please run 'git init' first." -ForegroundColor Red
    exit 1
}

# Add all files
Write-Host "📁 Adding files to git..." -ForegroundColor Yellow
git add .

# Commit changes
Write-Host "💾 Committing changes..." -ForegroundColor Yellow
$commitMsg = Read-Host "Enter commit message (or press Enter for default)"
if ([string]::IsNullOrWhiteSpace($commitMsg)) {
    $commitMsg = "Deploy KISEC Final Project presentation"
}
git commit -m $commitMsg

# Push to remote
Write-Host "⬆️ Pushing to remote repository..." -ForegroundColor Yellow
git push origin HEAD

Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host "🌐 Your presentation will be available at: https://aiegoo.github.io/siem" -ForegroundColor Cyan
Write-Host "⏰ Note: GitHub Pages deployment may take a few minutes to complete." -ForegroundColor Yellow

# Optional: Start local server for testing
$startServer = Read-Host "Start local server for testing? (y/n)"
if ($startServer -eq "y" -or $startServer -eq "Y") {
    Write-Host "🖥️ Starting local server at http://localhost:8080" -ForegroundColor Cyan
    npm start
}
