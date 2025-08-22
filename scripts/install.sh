#!/bin/bash

# One-Line Cursor Onboarding Installer
# This can be run directly from the web without downloading first

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Clear screen and show header
clear
echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════════════════════════╗
║           🚀 Cursor Onboarding - One Line Setup         ║
╚══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${BLUE}Welcome! This script will get you ready to use Cursor in minutes.${NC}"
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to ask yes/no
ask_yes_no() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${RED}This script is for macOS only.${NC}"
    echo "If you're on a different system, please ask for help."
    exit 1
fi

echo "🎯 What this will do:"
echo "• Install Git (if needed)"
echo "• Download and install Cursor IDE"
echo "• Set up GitHub authentication"
echo "• Configure Cursor with helpful settings"
echo ""
echo "⏱️  This takes about 5-10 minutes."
echo ""

if ! ask_yes_no "Continue with setup?"; then
    echo "Setup cancelled. Run this script again when you're ready!"
    exit 0
fi

echo ""
echo -e "${YELLOW}🚀 Starting Cursor Setup...${NC}"
echo ""

# Step 1: Install Git via Command Line Tools
echo -e "${YELLOW}Step 1: Installing Git...${NC}"
if ! command_exists git; then
    echo "Installing command line tools (includes Git)..."
    echo "A dialog will appear - click 'Install' and wait for it to complete."
    echo ""
    
    xcode-select --install 2>/dev/null || true
    
    echo "⏳ Waiting for installation to complete..."
    echo "(This may take several minutes - please be patient)"
    echo ""
    
    # Wait for git to be available
    while ! command_exists git; do
        echo "Still installing... (press Ctrl+C if this seems stuck)"
        sleep 15
    done
    
    echo -e "${GREEN}✅ Git installed successfully!${NC}"
else
    echo -e "${GREEN}✅ Git already installed${NC}"
fi

# Step 2: Configure Git
echo ""
echo -e "${YELLOW}Step 2: Configuring Git...${NC}"
if [ -z "$(git config --global user.name)" ]; then
    read -p "Enter your full name: " git_name
    git config --global user.name "$git_name"
fi

if [ -z "$(git config --global user.email)" ]; then
    read -p "Enter your email: " git_email
    git config --global user.email "$git_email"
fi

git config --global init.defaultBranch main
git config --global credential.helper osxkeychain
git config --global pull.rebase false

echo -e "${GREEN}✅ Git configured for $(git config --global user.name)${NC}"

# Step 3: Download onboarding repository
echo ""
echo -e "${YELLOW}Step 3: Downloading setup files...${NC}"

cd ~/Desktop

# Check if directory already exists
if [ -d "cursor-onboarding" ]; then
    echo "Removing existing setup files..."
    rm -rf cursor-onboarding
fi

# Official cursor-onboarding repository
REPO_URL="https://github.com/yannbc/cursor-onboarding.git"
echo "⬇️  Downloading from repository..."
echo "(If this fails, you may need to provide the correct repository URL)"

if git clone "$REPO_URL" 2>/dev/null; then
    echo -e "${GREEN}✅ Setup files downloaded${NC}"
else
    echo -e "${YELLOW}⚠️  Repository download failed${NC}"
    echo ""
    echo "This might happen if:"
    echo "1. The repository URL needs to be updated"
    echo "2. You need access permissions"
    echo "3. Internet connection issues"
    echo ""
    echo "📧 Contact your team lead with this error message."
    echo ""
    echo "Alternative: Download manually from the repository and run ./setup.sh"
    exit 1
fi

# Step 4: Run the full setup
echo ""
echo -e "${YELLOW}Step 4: Running full setup...${NC}"
cd cursor-onboarding
chmod +x setup.sh scripts/*.sh

echo ""
echo "🎉 Ready to complete setup!"
echo ""
echo "Options:"
echo "1. 🚀 Quick Setup (recommended) - Automated installation"
echo "2. 📋 Step-by-Step - With detailed explanations"
echo "3. 🎯 Just the basics - Skip optional features"
echo ""

read -p "Choose option (1-3): " setup_choice
echo ""

case $setup_choice in
    1)
        echo "Running quick setup..."
        bash scripts/quick_setup.sh
        ;;
    2)
        echo "Starting step-by-step setup..."
        bash scripts/step_by_step_setup.sh
        ;;
    3)
        echo "Installing essentials only..."
        # Run just the essential parts
        ./setup.sh
        ;;
    *)
        echo "Invalid choice. Running quick setup..."
        bash scripts/quick_setup.sh
        ;;
esac

# Final success message
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 One-Line Setup Complete! 🎉${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "✅ What's ready:"
echo "• Git and command line tools"
echo "• Cursor IDE (if installation completed)"
echo "• Basic configuration"
echo "• Setup files in ~/Desktop/cursor-onboarding/"
echo ""
echo "🚀 Next steps:"
echo "1. Restart Terminal (close this window, open a new one)"
echo "2. Test Cursor: type 'cursor --help'"
echo "3. If you need more configuration, run:"
echo "   cd ~/Desktop/cursor-onboarding && ./setup.sh"
echo ""
echo "🎯 Quick tips:"
echo "• Use 'cursor .' to open current folder in Cursor"
echo "• Press Cmd+Shift+P in Cursor for the command palette"
echo "• Try Cursor's AI features - they're amazing!"
echo ""
echo -e "${BLUE}Welcome to coding with Cursor! 🎉${NC}"
echo ""
echo "💬 Need help? The full setup menu has troubleshooting options."