#!/bin/bash

# KISEC Final Project - Deployment Script
echo "🚀 Deploying KISEC Final Project to GitHub Pages..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository. Please run 'git init' first."
    exit 1
fi

# Add all files
echo "📁 Adding files to git..."
git add .

# Commit changes
echo "💾 Committing changes..."
read -p "Enter commit message (or press Enter for default): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Deploy KISEC Final Project presentation"
fi
git commit -m "$commit_msg"

# Push to remote
echo "⬆️ Pushing to remote repository..."
git push origin HEAD

echo "✅ Deployment complete!"
echo "🌐 Your presentation will be available at: https://aiegoo.github.io/siem"
echo "⏰ Note: GitHub Pages deployment may take a few minutes to complete."

# Optional: Start local server for testing
read -p "Start local server for testing? (y/n): " start_server
if [ "$start_server" = "y" ] || [ "$start_server" = "Y" ]; then
    echo "🖥️ Starting local server at http://localhost:8080"
    npm start
fi
