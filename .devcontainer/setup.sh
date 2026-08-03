#!/usr/bin/env bash
set -e

echo "Installing AWS CLI..."
curl -fsSL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
unzip -o awscliv2.zip
sudo ./aws/install

echo "Installing PowerShell..."
sudo apt-get update
sudo apt-get install -y wget apt-transport-https software-properties-common

. /etc/os-release
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y powershell

echo "Installing AWS PowerShell modules..."
pwsh -Command "Install-Module AWS.Tools.Installer -Force -Scope AllUsers"

echo "Installing common AWS modules..."
pwsh -Command "Install-AWSToolsModule AWS.Tools.Common,AWS.Tools.S3,AWS.Tools.EC2 -CleanUp"

echo "Done!"
pwsh --version