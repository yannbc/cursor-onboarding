#!/bin/bash

# Quick Setup for Cursor - Essential Tools Only
# Minimal, reliable setup focused on what non-devs actually need

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Quick Cursor Setup${NC}"
echo "Installing the essentials..."
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

# Step 1: Install Command Line Tools (includes Git)
echo -e "${YELLOW}Step 1: Installing Command Line Tools...${NC}"
if ! command_exists git; then
    echo "Installing Xcode Command Line Tools (includes Git)..."
    echo "⚠️  This may take a few minutes and will open a dialog."
    xcode-select --install 2>/dev/null || true
    echo ""
    echo "Please complete the installation dialog, then press Enter to continue..."
    read -p ""
    
    # Wait for git to be available
    echo "Waiting for Git installation..."
    while ! command_exists git; do
        echo "Still waiting for Git... (press Ctrl+C if stuck)"
        sleep 5
    done
else
    echo -e "${GREEN}✓ Git already installed${NC}"
fi

# Step 2: Configure Git
echo ""
echo -e "${YELLOW}Step 2: Configuring Git...${NC}"
if [ -z "$(git config --global user.name)" ]; then
    read -p "Enter your full name: " git_name
    git config --global user.name "$git_name"
else
    echo -e "${GREEN}✓ Git name already set: $(git config --global user.name)${NC}"
fi

if [ -z "$(git config --global user.email)" ]; then
    read -p "Enter your email address: " git_email
    git config --global user.email "$git_email"
else
    echo -e "${GREEN}✓ Git email already set: $(git config --global user.email)${NC}"
fi

# Set sensible Git defaults
git config --global init.defaultBranch main
git config --global credential.helper osxkeychain
git config --global pull.rebase false

echo -e "${GREEN}✓ Git configured${NC}"

# Step 3: Install or verify Cursor
echo ""
echo -e "${YELLOW}Step 3: Installing Cursor...${NC}"
if [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✓ Cursor already installed${NC}"
else
    echo "Downloading and installing Cursor..."
    
    # Download Cursor
    curl -L "https://downloader.cursor.sh/darwin_x64/cursor.dmg" -o "/tmp/cursor.dmg"
    
    # Mount and install
    hdiutil attach "/tmp/cursor.dmg" -quiet
    cp -R "/Volumes/Cursor/Cursor.app" "/Applications/"
    hdiutil detach "/Volumes/Cursor" -quiet
    
    # Clean up
    rm "/tmp/cursor.dmg"
    
    echo -e "${GREEN}✓ Cursor installed${NC}"
fi

# Step 4: Add Cursor to PATH
echo ""
echo -e "${YELLOW}Step 4: Setting up Cursor command...${NC}"

# Check if cursor command exists
if ! command_exists cursor; then
    # Add cursor to PATH in shell profiles
    CURSOR_PATH_EXPORT='export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"'
    
    # Add to .zshrc (default shell on macOS)
    if [ ! -f ~/.zshrc ] || ! grep -q "Cursor.app" ~/.zshrc; then
        echo "" >> ~/.zshrc
        echo "# Cursor command line tool" >> ~/.zshrc
        echo "$CURSOR_PATH_EXPORT" >> ~/.zshrc
    fi
    
    # Add to .bash_profile (fallback)
    if [ ! -f ~/.bash_profile ] || ! grep -q "Cursor.app" ~/.bash_profile; then
        echo "" >> ~/.bash_profile
        echo "# Cursor command line tool" >> ~/.bash_profile
        echo "$CURSOR_PATH_EXPORT" >> ~/.bash_profile
    fi
    
    # Apply to current session
    export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"
    
    echo -e "${GREEN}✓ Cursor command added to PATH${NC}"
    echo "  (Restart Terminal or run 'source ~/.zshrc' to use 'cursor' command)"
else
    echo -e "${GREEN}✓ Cursor command already available${NC}"
fi

# Step 5: GitHub Setup
echo ""
echo -e "${YELLOW}Step 5: GitHub Setup...${NC}"

# Check if user has GitHub account
echo "Do you have a GitHub account?"
if ! ask_yes_no "GitHub account exists?"; then
    echo ""
    echo "🌐 Creating GitHub Account:"
    echo "1. Go to: https://github.com/signup"
    echo "2. Create your account"
    echo "3. Verify your email"
    echo ""
    if ask_yes_no "Open GitHub signup page now?"; then
        open "https://github.com/signup"
    fi
    echo ""
    echo "Come back here after creating your account..."
    read -p "Press Enter when your GitHub account is ready..."
fi

# GitHub authentication setup
echo ""
echo "🔐 Setting up GitHub authentication..."
echo ""
echo "For security, we'll set up a Personal Access Token."
echo ""
echo "Steps to create a token:"
echo "1. Go to: https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Name it: 'Cursor Development'"
echo "4. Select scope: 'repo' (check the repo checkbox)"
echo "5. Click 'Generate token'"
echo "6. Copy the token (you won't see it again!)"
echo ""

if ask_yes_no "Open GitHub tokens page now?"; then
    open "https://github.com/settings/tokens"
fi

echo ""
echo "⚠️  Important: Save your token somewhere safe!"
echo "You'll need it whenever you clone or push to repositories."
echo ""
read -p "Press Enter when you have your token ready..."

# Test GitHub access
echo ""
echo "🧪 Testing GitHub access..."
echo "Let's test by cloning a sample repository."
echo ""

if ask_yes_no "Test GitHub access with a sample repository?"; then
    echo "Trying to clone a test repository..."
    
    # Create test directory
    mkdir -p ~/Desktop/cursor-test
    cd ~/Desktop/cursor-test
    
    # Try to clone a simple public repo
    if git clone https://github.com/octocat/Hello-World.git test-repo 2>/dev/null; then
        echo -e "${GREEN}✓ GitHub access working!${NC}"
        rm -rf test-repo
    else
        echo -e "${YELLOW}⚠️  GitHub test failed - you may need to set up authentication${NC}"
        echo "When you clone your first repository, use your GitHub username and token (not password)."
    fi
    
    # Clean up
    cd - >/dev/null
    rmdir ~/Desktop/cursor-test 2>/dev/null || true
fi

# Final verification and next steps
echo ""
echo -e "${GREEN}✅ Quick Setup Complete!${NC}"
echo ""
echo "✅ What's installed:"
echo "   • Git (version: $(git --version | cut -d' ' -f3))"
echo "   • Cursor IDE"
echo "   • GitHub authentication ready"
echo ""
echo "🚀 Next steps:"
echo "1. Restart Terminal (or run: source ~/.zshrc)"
echo "2. Test Cursor: type 'cursor --help'"
echo "3. Clone your first repository"
echo "4. Open it with: cursor ."
echo ""
echo "💡 Tips:"
echo "• Use 'cursor .' to open current folder in Cursor"
echo "• Use Cmd+Shift+P for Cursor's command palette"
echo "• Try Cursor's AI features - they're quite good!"
echo ""
echo "🆘 Need help? Run the main setup script and choose option 5 (Troubleshooting)"
echo ""
echo -e "${BLUE}Happy coding with Cursor! 🎯${NC}"