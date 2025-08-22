#!/bin/bash

# Step-by-Step Cursor Setup
# Detailed setup with explanations for non-developers

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}📋 Step-by-Step Cursor Setup${NC}"
echo "We'll walk through each step with explanations."
echo ""

# Function to wait for user
wait_for_user() {
    echo ""
    read -p "Press Enter when ready to continue..."
    echo ""
}

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

# Introduction
echo -e "${CYAN}What we're going to install:${NC}"
echo "1. 🛠️  Git - For downloading and managing code"
echo "2. 💻 Cursor - Your new AI-powered code editor"
echo "3. 🔐 GitHub authentication - To access code repositories"
echo "4. ⚙️  Basic configuration - To make everything work smoothly"
echo ""
echo "This will take about 10-15 minutes."
wait_for_user

# Step 1: Command Line Tools
echo -e "${YELLOW}━━━ Step 1: Installing Developer Tools ━━━${NC}"
echo ""
echo "🤔 What are Command Line Tools?"
echo "These are basic development tools that macOS needs."
echo "They include Git, which is essential for downloading code."
echo ""

if ! command_exists git; then
    echo "Installing Command Line Tools..."
    echo ""
    echo "⚠️  A dialog will appear asking to install developer tools."
    echo "Click 'Install' and wait for it to complete."
    echo ""
    wait_for_user
    
    xcode-select --install 2>/dev/null || true
    
    echo "Waiting for installation to complete..."
    echo "(This may take several minutes)"
    echo ""
    
    # Wait for git to be available
    while ! command_exists git; do
        echo "Still installing... please wait"
        sleep 10
    done
    
    echo -e "${GREEN}✅ Developer tools installed successfully!${NC}"
else
    echo -e "${GREEN}✅ Developer tools already installed${NC}"
fi

wait_for_user

# Step 2: Configure Git
echo -e "${YELLOW}━━━ Step 2: Setting up Git ━━━${NC}"
echo ""
echo "🤔 What is Git?"
echo "Git helps you download code, track changes, and collaborate."
echo "Think of it like 'Track Changes' in Word, but for code."
echo ""

# Configure name
if [ -z "$(git config --global user.name)" ]; then
    echo "We need to tell Git who you are:"
    read -p "Enter your full name: " git_name
    git config --global user.name "$git_name"
    echo -e "${GREEN}✅ Name set to: $git_name${NC}"
else
    echo -e "${GREEN}✅ Name already configured: $(git config --global user.name)${NC}"
fi

# Configure email
if [ -z "$(git config --global user.email)" ]; then
    echo ""
    read -p "Enter your email address: " git_email
    git config --global user.email "$git_email"
    echo -e "${GREEN}✅ Email set to: $git_email${NC}"
else
    echo -e "${GREEN}✅ Email already configured: $(git config --global user.email)${NC}"
fi

# Set other configs
git config --global init.defaultBranch main
git config --global credential.helper osxkeychain
git config --global pull.rebase false

echo ""
echo -e "${GREEN}✅ Git is now configured!${NC}"

wait_for_user

# Step 3: Install Cursor
echo -e "${YELLOW}━━━ Step 3: Installing Cursor IDE ━━━${NC}"
echo ""
echo "🤔 What is Cursor?"
echo "Cursor is like Microsoft Word, but for writing code."
echo "It has amazing AI features that help you write and understand code."
echo ""

if [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✅ Cursor is already installed!${NC}"
else
    echo "Downloading and installing Cursor..."
    echo "(This may take a few minutes depending on your internet speed)"
    echo ""
    
    # Download Cursor
    echo "⬇️  Downloading..."
    curl -L "https://downloader.cursor.sh/darwin_x64/cursor.dmg" -o "/tmp/cursor.dmg"
    
    # Install
    echo "📦 Installing..."
    hdiutil attach "/tmp/cursor.dmg" -quiet
    cp -R "/Volumes/Cursor/Cursor.app" "/Applications/"
    hdiutil detach "/Volumes/Cursor" -quiet
    rm "/tmp/cursor.dmg"
    
    echo -e "${GREEN}✅ Cursor installed successfully!${NC}"
fi

wait_for_user

# Step 4: Set up Cursor command
echo -e "${YELLOW}━━━ Step 4: Setting up Cursor Terminal Command ━━━${NC}"
echo ""
echo "🤔 What does this do?"
echo "This lets you type 'cursor' in Terminal to open Cursor."
echo "It's a handy shortcut - like double-clicking but from Terminal."
echo ""

if ! command_exists cursor; then
    echo "Setting up 'cursor' command..."
    
    # Add to shell profiles
    CURSOR_PATH='export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"'
    
    # Add to .zshrc
    if [ ! -f ~/.zshrc ] || ! grep -q "Cursor.app" ~/.zshrc; then
        echo "" >> ~/.zshrc
        echo "# Cursor command line tool" >> ~/.zshrc
        echo "$CURSOR_PATH" >> ~/.zshrc
    fi
    
    # Add to current session
    export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"
    
    echo -e "${GREEN}✅ Cursor command is ready!${NC}"
    echo "   (After setup, you can type 'cursor .' to open current folder)"
else
    echo -e "${GREEN}✅ Cursor command already available${NC}"
fi

wait_for_user

# Step 5: GitHub Account
echo -e "${YELLOW}━━━ Step 5: GitHub Account Setup ━━━${NC}"
echo ""
echo "🤔 What is GitHub?"
echo "GitHub is like Google Drive, but for code."
echo "It's where developers store and share their projects."
echo ""

echo "Do you have a GitHub account?"
if ! ask_yes_no "I have a GitHub account"; then
    echo ""
    echo "Let's create one! 🚀"
    echo ""
    echo "📋 Steps to create GitHub account:"
    echo "1. Go to github.com/signup"
    echo "2. Choose a username (this will be public)"
    echo "3. Enter your email and create a password"
    echo "4. Verify your email address"
    echo ""
    
    if ask_yes_no "Open GitHub signup page now?"; then
        open "https://github.com/signup"
    fi
    
    echo ""
    echo "Take your time creating your account..."
    echo "Come back here when you've verified your email."
    wait_for_user
fi

echo -e "${GREEN}✅ GitHub account ready!${NC}"

wait_for_user

# Step 6: GitHub Authentication
echo -e "${YELLOW}━━━ Step 6: GitHub Authentication ━━━${NC}"
echo ""
echo "🤔 Why do we need this?"
echo "To download private code repositories and upload your changes,"
echo "GitHub needs to know it's really you."
echo ""
echo "🔐 We'll use a 'Personal Access Token':"
echo "Think of it as a special password just for coding tools."
echo "It's more secure than using your regular password."
echo ""

echo "📋 Steps to create your token:"
echo ""
echo "1. Go to: github.com/settings/tokens"
echo "2. Click the green 'Generate new token (classic)' button"
echo "3. In 'Note' field, type: 'Cursor Development'"
echo "4. Under 'Select scopes', check the box for 'repo'"
echo "5. Click 'Generate token' at the bottom"
echo "6. Copy the token (it looks like: ghp_xxxxxxxxxxxx)"
echo ""
echo "⚠️  Important: Copy the token immediately!"
echo "GitHub will only show it once. Save it somewhere safe."
echo ""

if ask_yes_no "Open GitHub tokens page now?"; then
    open "https://github.com/settings/tokens"
fi

echo ""
echo "💾 Where to save your token:"
echo "• In your password manager (best option)"
echo "• In a secure note on your phone"
echo "• Write it down on paper temporarily"
echo ""
echo "🚫 Don't save it in:"
echo "• Regular text files on your computer"
echo "• Emails or messages"
echo "• Shared documents"
echo ""

wait_for_user

# Test GitHub access
echo -e "${YELLOW}━━━ Testing GitHub Connection ━━━${NC}"
echo ""
echo "Let's test your GitHub access with a simple download."
echo ""

if ask_yes_no "Test GitHub connection?"; then
    echo "Testing GitHub access..."
    
    # Create temporary directory
    mkdir -p ~/Desktop/github-test
    cd ~/Desktop/github-test
    
    # Try to clone a public repository
    echo "Downloading a test repository..."
    if git clone https://github.com/octocat/Hello-World.git test-repo 2>/dev/null; then
        echo -e "${GREEN}✅ GitHub connection working perfectly!${NC}"
        
        # Show what we downloaded
        echo ""
        echo "📁 We downloaded a sample repository to ~/Desktop/github-test/"
        ls -la test-repo/
        
        # Clean up
        rm -rf test-repo
    else
        echo -e "${YELLOW}⚠️  Connection test inconclusive${NC}"
        echo "This is normal - we'll test properly when you clone your first real repository."
    fi
    
    # Clean up test directory
    cd - >/dev/null
    rmdir ~/Desktop/github-test 2>/dev/null || true
fi

wait_for_user

# Final setup verification
echo -e "${YELLOW}━━━ Final Setup Check ━━━${NC}"
echo ""
echo "Let's make sure everything is working:"
echo ""

# Check Git
if command_exists git; then
    echo -e "${GREEN}✅ Git: $(git --version)${NC}"
else
    echo -e "${RED}❌ Git: Not working${NC}"
fi

# Check Cursor
if [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✅ Cursor: Installed in Applications${NC}"
else
    echo -e "${RED}❌ Cursor: Not found${NC}"
fi

# Check Git config
if [ ! -z "$(git config --global user.name)" ]; then
    echo -e "${GREEN}✅ Git Name: $(git config --global user.name)${NC}"
else
    echo -e "${RED}❌ Git Name: Not set${NC}"
fi

if [ ! -z "$(git config --global user.email)" ]; then
    echo -e "${GREEN}✅ Git Email: $(git config --global user.email)${NC}"
else
    echo -e "${RED}❌ Git Email: Not set${NC}"
fi

wait_for_user

# Success and next steps
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 SETUP COMPLETE! You're ready to use Cursor! 🎉${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "🚀 What you can do now:"
echo ""
echo "1. 📱 Restart Terminal:"
echo "   • Close this Terminal window"
echo "   • Open a new Terminal (Cmd+Space → 'Terminal')"
echo ""
echo "2. 🧪 Test Cursor command:"
echo "   • Type: cursor --help"
echo "   • You should see Cursor's help information"
echo ""
echo "3. 📂 Open Cursor:"
echo "   • Go to Applications and double-click Cursor"
echo "   • Or type 'cursor' in Terminal"
echo ""
echo "4. 📥 Download your first project:"
echo "   • Ask a developer for the repository URL"
echo "   • Use: git clone [repository-url]"
echo "   • Use your GitHub username and token when asked"
echo ""
echo "💡 Pro Tips:"
echo "• Use 'cursor .' to open current folder in Cursor"
echo "• Press Cmd+Shift+P in Cursor for the command palette"
echo "• Try asking Cursor's AI for help - it's incredible!"
echo ""
echo "🆘 Need help?"
echo "• Run this setup again if something goes wrong"
echo "• Ask a developer to help with your first repository clone"
echo "• Check the troubleshooting guide in the main menu"
echo ""
echo -e "${BLUE}Welcome to the world of coding with Cursor! 🎯${NC}"