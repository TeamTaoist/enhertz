#!/bin/bash
# This script automates the release process by bumping the version, creating a git tag, and pushing to the remote.

set -e # Exit immediately if a command exits with a non-zero status.

# 1. Check for required argument
if [ -z "$1" ]; then
  echo "Error: No version type specified."
  echo "Usage: $0 <patch|minor|major>"
  exit 1
fi

# 2. Check if the working directory is clean
git diff-index --quiet HEAD -- || {
  echo "Error: Git working directory is not clean. Please commit or stash your changes."
  exit 1
}

# 3. Bump version in package.json and package-lock.json
# We use --no-git-tag-version because we want to update tauri.conf.json before creating the commit and tag.
echo "Bumping version with npm..."
npm version "$1" --no-git-tag-version

# 4. Get the new version from package.json
NEW_VERSION=$(node -p "require('./package.json').version")
echo "New version: $NEW_VERSION"

# 5. Update version in src-tauri/tauri.conf.json
echo "Updating tauri.conf.json..."
# Use a temporary file for sed to ensure cross-platform compatibility (macOS vs Linux)
sed -i.bak "s/\"version\": \"[0-9.]*\"/\"version\": \"$NEW_VERSION\"/" src-tauri/tauri.conf.json
rm src-tauri/tauri.conf.json.bak

# 6. Commit the version bump
echo "Committing version bump..."
git add package.json package-lock.json src-tauri/tauri.conf.json
git commit -m "chore(release): v$NEW_VERSION"

# 7. Create the git tag
echo "Creating git tag..."
git tag "v$NEW_VERSION"

# 8. Push the commit and tag
echo "Pushing to remote..."
git push origin && git push origin --tags

echo "Release v$NEW_VERSION successfully tagged and pushed."
