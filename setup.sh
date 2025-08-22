#!/bin/bash

# Cursor Onboarding Setup
# Simple, foolproof setup for new Cursor users

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Clear screen
clear

# Header
echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════════════════════════╗
║                 Cursor Onboarding Assistant              ║
║             Getting Non-Devs Up and Running             ║
╚══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${BLUE}Welcome! This will get you set up with Cursor.${NC}"
echo ""

# Function to check if basic setup is done
check_basic_setup() {
    command -v git >/dev/null 2>&1 && \
    [ ! -z "$(git config --global user.name)" ] && \
    [ -d "/Applications/Cursor.app" ]
}

# Function to ask yes/no questions
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

# Main menu
while true; do
    echo -e "${YELLOW}=== Cursor Setup Menu ===${NC}"
    echo ""
    echo -e "${CYAN}1)${NC} 🚀 Quick Setup (Recommended)"
    echo "   Install essentials: Git, Cursor, GitHub set up"
    echo ""
    echo -e "${CYAN}2)${NC} 📋 Step-by-Step Setup"
    echo "   Manual setup with explanations"
    echo ""
    echo -e "${CYAN}3)${NC} ⚙️  Cursor Configuration"
    echo "   Configure Cursor settings and extensions"
    echo ""
    echo -e "${CYAN}4)${NC} ✅ Check Setup Status"
    echo "   Verify your installation"
    echo ""
    echo -e "${CYAN}5)${NC} 🆘 Troubleshooting"
    echo "   Fix common issues"
    echo ""
    echo -e "${CYAN}6)${NC} 📚 Documentation"
    echo "   View guides and help"
    echo ""
    echo -e "${CYAN}7)${NC} Exit"
    echo ""
    
    read -p "Choose an option (1-7): " choice
    echo ""
    
    case $choice in
        1)
            echo -e "${BLUE}🚀 Starting Quick Setup...${NC}"
            echo ""
            
            # Check if already set up
            if check_basic_setup; then
                echo -e "${YELLOW}✓ Looks like you're already set up!${NC}"
                if ! ask_yes_no "Run setup anyway?"; then
                    continue
                fi
            fi
            
            # Run quick setup
            if [ -f "scripts/quick_setup.sh" ]; then
                bash scripts/quick_setup.sh
            else
                echo -e "${RED}Error: Quick setup script not found!${NC}"
            fi
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        2)
            echo -e "${BLUE}📋 Starting Step-by-Step Setup...${NC}"
            echo ""
            
            if [ -f "scripts/step_by_step_setup.sh" ]; then
                bash scripts/step_by_step_setup.sh
            else
                echo -e "${RED}Error: Step-by-step setup script not found!${NC}"
            fi
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        3)
            echo -e "${BLUE}⚙️  Configuring Cursor...${NC}"
            echo ""
            
            if [ -f "scripts/cursor_config.sh" ]; then
                bash scripts/cursor_config.sh
            else
                echo -e "${RED}Error: Cursor configuration script not found!${NC}"
            fi
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        4)
            echo -e "${BLUE}✅ Setup Status Check${NC}"
            echo ""
            
            # Check Git
            if command -v git >/dev/null 2>&1; then
                echo -e "${GREEN}✓ Git installed:${NC} $(git --version)"
                if [ ! -z "$(git config --global user.name)" ]; then
                    echo "  └─ Name: $(git config --global user.name)"
                    echo "  └─ Email: $(git config --global user.email)"
                else
                    echo -e "${YELLOW}  └─ Not configured${NC}"
                fi
            else
                echo -e "${RED}✗ Git not installed${NC}"
            fi
            
            # Check Cursor
            if [ -d "/Applications/Cursor.app" ]; then
                echo -e "${GREEN}✓ Cursor installed${NC}"
                if command -v cursor >/dev/null 2>&1; then
                    echo "  └─ Command line tool available"
                else
                    echo -e "${YELLOW}  └─ Command line tool not in PATH${NC}"
                fi
            else
                echo -e "${RED}✗ Cursor not installed${NC}"
            fi
            
            # Check Python
            if command -v python3 >/dev/null 2>&1; then
                echo -e "${GREEN}✓ Python:${NC} $(python3 --version)"
            else
                echo -e "${YELLOW}○ Python not installed (optional)${NC}"
            fi
            
            # Check Node
            if command -v node >/dev/null 2>&1; then
                echo -e "${GREEN}✓ Node.js:${NC} $(node --version)"
            else
                echo -e "${YELLOW}○ Node.js not installed (optional)${NC}"
            fi
            
            echo ""
            if check_basic_setup; then
                echo -e "${GREEN}✅ You're all set up! Ready to use Cursor.${NC}"
            else
                echo -e "${YELLOW}⚠️  Some setup steps needed. Try option 1 (Quick Setup).${NC}"
            fi
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        5)
            echo -e "${BLUE}🆘 Troubleshooting${NC}"
            echo ""
            
            if [ -f "docs/troubleshooting.md" ]; then
                less docs/troubleshooting.md
            else
                echo "Common issues and solutions:"
                echo ""
                echo "1. 'command not found' errors:"
                echo "   → Restart Terminal after installation"
                echo "   → Run: source ~/.zshrc"
                echo ""
                echo "2. Permission denied:"
                echo "   → Make sure you entered your password correctly"
                echo "   → Try: sudo -v to refresh permissions"
                echo ""
                echo "3. GitHub authentication fails:"
                echo "   → Use Personal Access Token, not password"
                echo "   → Make sure token has 'repo' permission"
                echo ""
                echo "4. Cursor won't open:"
                echo "   → Try downloading from https://cursor.sh"
                echo "   → Make sure it's in /Applications/"
            fi
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        6)
            echo -e "${BLUE}📚 Documentation${NC}"
            echo ""
            echo "Available guides:"
            echo ""
            echo "1) README - Getting Started"
            echo "2) Cursor Basics"
            echo "3) GitHub Setup"
            echo "4) Back to menu"
            echo ""
            read -p "Which guide? (1-4): " doc_choice
            
            case $doc_choice in
                1)
                    if [ -f "README.md" ]; then
                        less README.md
                    else
                        echo -e "${RED}README not found${NC}"
                    fi
                    ;;
                2)
                    if [ -f "docs/cursor_basics.md" ]; then
                        less docs/cursor_basics.md
                    else
                        echo -e "${RED}Cursor basics guide not found${NC}"
                    fi
                    ;;
                3)
                    if [ -f "docs/github_setup.md" ]; then
                        less docs/github_setup.md
                    else
                        echo -e "${RED}GitHub setup guide not found${NC}"
                    fi
                    ;;
                4)
                    clear
                    continue
                    ;;
            esac
            
            echo ""
            read -p "Press Enter to continue..."
            clear
            ;;
            
        7)
            echo -e "${GREEN}Thanks for using Cursor Onboarding!${NC}"
            echo ""
            echo "🎯 Quick tips:"
            echo "• Open Terminal and type 'cursor .' to open current folder"
            echo "• Use Cmd+Shift+P for the command palette"
            echo "• Try Cursor's AI features - they're amazing!"
            echo ""
            echo -e "${BLUE}Happy coding! 🚀${NC}"
            exit 0
            ;;
            
        *)
            echo -e "${RED}Invalid choice. Please enter 1-7.${NC}"
            echo ""
            read -p "Press Enter to try again..."
            clear
            ;;
    esac
done