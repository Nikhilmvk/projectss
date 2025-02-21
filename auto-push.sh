#!/bin/bash

# Navigate to the Terraform project directory
cd ~/Terraform/

# Check if there are any changes
if [[ $(git status --porcelain) ]]; then
    echo "Changes detected. Committing and pushing to GitHub..."

    # Add all changes
    git add .

    # Commit with a timestamp
    git commit -m "Automated commit: $(date)"

    # Push to GitHub
    git push origin main

    echo "Changes pushed successfully!"
else
    echo "No changes detected."
fi
