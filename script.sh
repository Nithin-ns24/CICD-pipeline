#!/bin/bash

# Ask for repository URL
read -p "Enter the GitHub repository URL: " repo_url

# Clone the repository
git clone "$repo_url"
repo_name=$(basename "$repo_url" .git)
cd "$repo_name" || exit

# Create .github/workflows directory
mkdir -p .github/workflows

# Sample GitHub Actions YAML file content
actions_yaml_content='
name: CI

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    - name: Print Directory Listing
      run: ls -R
'

# Write sample GitHub Actions YAML file
echo "$actions_yaml_content" > .github/workflows/main.yaml

# Add, commit, and push changes
git add .github/workflows/main.yaml
git commit -m "Add GitHub Actions YAML file"
git push origin main

echo "Changes pushed successfully to the repository."
