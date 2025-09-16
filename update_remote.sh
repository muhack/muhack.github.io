#!/bin/bash

# Script to update local git remote after repository renaming
# Usage: ./update_remote.sh NEW_REPOSITORY_NAME

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 NEW_REPOSITORY_NAME"
    echo "Example: $0 muhack-website"
    exit 1
fi

NEW_REPO_NAME="$1"
OLD_REMOTE=$(git remote get-url origin)
NEW_REMOTE="https://github.com/muhack/${NEW_REPO_NAME}"

echo "Current remote URL: $OLD_REMOTE"
echo "New remote URL: $NEW_REMOTE"
echo ""

read -p "Do you want to update the remote URL? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Updating remote URL..."
    git remote set-url origin "$NEW_REMOTE"
    echo "✅ Remote URL updated successfully!"
    echo ""
    echo "Verifying:"
    git remote -v
    echo ""
    echo "You can now continue using git commands normally."
    echo "The repository has been renamed from 'muhack.github.io' to '${NEW_REPO_NAME}'"
else
    echo "Remote URL not changed."
fi