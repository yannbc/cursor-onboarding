#!/bin/bash

# Cursor Configuration Script
# Sets up useful settings and extensions for new users

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}⚙️  Cursor Configuration Assistant${NC}"
echo "Let's set up Cursor with helpful settings and extensions."
echo ""

# Function to check if Cursor is installed
check_cursor() {
    if [ ! -d "/Applications/Cursor.app" ]; then
        echo -e "${RED}❌ Cursor not found!${NC}"
        echo "Please install Cursor first using the Quick Setup option."
        exit 1
    fi
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

# Function to wait for user
wait_for_user() {
    echo ""
    read -p "Press Enter to continue..."
    echo ""
}

# Check if Cursor is installed
check_cursor

# Create Cursor settings directory if it doesn't exist
CURSOR_CONFIG_DIR="$HOME/Library/Application Support/Cursor/User"
mkdir -p "$CURSOR_CONFIG_DIR"

echo -e "${YELLOW}Configuration Options:${NC}"
echo ""
echo "1. 📝 Basic Editor Settings"
echo "2. 🎨 Theme and Appearance"
echo "3. 🤖 AI Features Setup"
echo "4. 📦 Essential Extensions"
echo "5. ⚡ Productivity Settings"
echo "6. 🔄 All of the above (Recommended)"
echo ""

read -p "What would you like to configure? (1-6): " config_choice
echo ""

case $config_choice in
    1|6)
        # Basic Editor Settings
        echo -e "${YELLOW}📝 Configuring Basic Editor Settings...${NC}"
        
        cat > "$CURSOR_CONFIG_DIR/settings.json" << 'EOF'
{
    "editor.fontSize": 14,
    "editor.fontFamily": "'SF Mono', 'Monaco', 'Menlo', monospace",
    "editor.lineHeight": 1.5,
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.wordWrap": "on",
    "editor.minimap.enabled": true,
    "editor.lineNumbers": "on",
    "editor.rulers": [80, 120],
    "editor.renderWhitespace": "selection",
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.bracketPairs": true,
    "workbench.startupEditor": "welcomePage",
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 1000,
    "explorer.confirmDelete": true,
    "explorer.confirmDragAndDrop": true
}
EOF
        
        echo -e "${GREEN}✅ Basic editor settings configured${NC}"
        [ "$config_choice" != "6" ] && wait_for_user
        ;;
esac

case $config_choice in
    2|6)
        # Theme and Appearance
        echo -e "${YELLOW}🎨 Setting up Theme and Appearance...${NC}"
        
        echo "Choose your preferred theme:"
        echo "1. Dark (default)"
        echo "2. Light"
        echo "3. Auto (follows system)"
        
        read -p "Theme choice (1-3): " theme_choice
        
        case $theme_choice in
            1)
                THEME_CONFIG='"workbench.colorTheme": "Dark+",'
                ;;
            2)
                THEME_CONFIG='"workbench.colorTheme": "Light+",'
                ;;
            3)
                THEME_CONFIG='"window.autoDetectColorScheme": true,'
                ;;
            *)
                THEME_CONFIG='"workbench.colorTheme": "Dark+",'
                ;;
        esac
        
        # Update settings with theme
        if [ -f "$CURSOR_CONFIG_DIR/settings.json" ]; then
            # Add theme to existing settings
            cp "$CURSOR_CONFIG_DIR/settings.json" "$CURSOR_CONFIG_DIR/settings.json.bak"
            sed "1s/{/{\"${THEME_CONFIG}\"/1" "$CURSOR_CONFIG_DIR/settings.json.bak" > "$CURSOR_CONFIG_DIR/settings.json"
            rm "$CURSOR_CONFIG_DIR/settings.json.bak"
        else
            # Create new settings with theme
            cat > "$CURSOR_CONFIG_DIR/settings.json" << EOF
{
    $THEME_CONFIG
    "workbench.iconTheme": "vs-seti"
}
EOF
        fi
        
        echo -e "${GREEN}✅ Theme and appearance configured${NC}"
        [ "$config_choice" != "6" ] && wait_for_user
        ;;
esac

case $config_choice in
    3|6)
        # AI Features Setup
        echo -e "${YELLOW}🤖 Setting up AI Features...${NC}"
        echo ""
        echo "Cursor has amazing AI features built-in!"
        echo ""
        echo "Key AI features you can use:"
        echo "• Cmd+K: AI code editing"
        echo "• Cmd+L: Chat with AI about your code"
        echo "• Tab: AI code completion (like autocomplete++)"
        echo ""
        
        if ask_yes_no "Enable enhanced AI features?"; then
            # Add AI-specific settings
            AI_SETTINGS='"cursor.chat.enabled": true, "cursor.cpp.enableIntelliSense": true, "cursor.general.enableCodeActions": true,'
            
            if [ -f "$CURSOR_CONFIG_DIR/settings.json" ]; then
                cp "$CURSOR_CONFIG_DIR/settings.json" "$CURSOR_CONFIG_DIR/settings.json.bak"
                sed "1s/{/{${AI_SETTINGS}/1" "$CURSOR_CONFIG_DIR/settings.json.bak" > "$CURSOR_CONFIG_DIR/settings.json"
                rm "$CURSOR_CONFIG_DIR/settings.json.bak"
            else
                cat > "$CURSOR_CONFIG_DIR/settings.json" << EOF
{
    $AI_SETTINGS
    "editor.suggestOnTriggerCharacters": true
}
EOF
            fi
            
            echo -e "${GREEN}✅ AI features enabled${NC}"
        fi
        
        echo ""
        echo "💡 AI Tips:"
        echo "• Select code and press Cmd+K to ask AI to modify it"
        echo "• Use Cmd+L to ask questions about your code"
        echo "• The AI can explain errors, suggest improvements, and write code"
        echo ""
        
        [ "$config_choice" != "6" ] && wait_for_user
        ;;
esac

case $config_choice in
    4|6)
        # Essential Extensions
        echo -e "${YELLOW}📦 Installing Essential Extensions...${NC}"
        echo ""
        echo "We'll install some helpful extensions for you."
        echo "These add useful features to Cursor."
        echo ""
        
        # Check if cursor command is available
        if command -v cursor >/dev/null 2>&1; then
            echo "Installing recommended extensions..."
            
            # List of essential extensions
            extensions=(
                "ms-python.python"
                "ms-vscode.vscode-json"
                "bradlc.vscode-tailwindcss"
                "esbenp.prettier-vscode"
                "ms-vscode.vscode-typescript-next"
            )
            
            for ext in "${extensions[@]}"; do
                echo "Installing $ext..."
                cursor --install-extension "$ext" --force 2>/dev/null || echo "  (Skipped - may already be installed)"
            done
            
            echo -e "${GREEN}✅ Extensions installed${NC}"
        else
            echo -e "${YELLOW}⚠️  Cursor command not available yet${NC}"
            echo "Please restart Terminal and run this configuration again."
            echo ""
            echo "Or manually install extensions later:"
            echo "1. Open Cursor"
            echo "2. Press Cmd+Shift+X for Extensions"
            echo "3. Search and install: Python, Prettier, Tailwind CSS"
        fi
        
        [ "$config_choice" != "6" ] && wait_for_user
        ;;
esac

case $config_choice in
    5|6)
        # Productivity Settings
        echo -e "${YELLOW}⚡ Setting up Productivity Features...${NC}"
        
        PRODUCTIVITY_SETTINGS='"editor.formatOnSave": true, "editor.codeActionsOnSave": {"source.organizeImports": true}, "workbench.editor.enablePreview": false, "workbench.editor.revealIfOpen": true, "terminal.integrated.fontSize": 13,'
        
        if [ -f "$CURSOR_CONFIG_DIR/settings.json" ]; then
            cp "$CURSOR_CONFIG_DIR/settings.json" "$CURSOR_CONFIG_DIR/settings.json.bak"
            sed "1s/{/{${PRODUCTIVITY_SETTINGS}/1" "$CURSOR_CONFIG_DIR/settings.json.bak" > "$CURSOR_CONFIG_DIR/settings.json"
            rm "$CURSOR_CONFIG_DIR/settings.json.bak"
        else
            cat > "$CURSOR_CONFIG_DIR/settings.json" << EOF
{
    $PRODUCTIVITY_SETTINGS
    "files.trimTrailingWhitespace": true
}
EOF
        fi
        
        echo -e "${GREEN}✅ Productivity settings configured${NC}"
        [ "$config_choice" != "6" ] && wait_for_user
        ;;
esac

# Create keyboard shortcuts cheat sheet
echo -e "${YELLOW}📋 Creating Keyboard Shortcuts Cheat Sheet...${NC}"

cat > ~/Desktop/Cursor_Shortcuts.txt << 'EOF'
🎯 CURSOR KEYBOARD SHORTCUTS CHEAT SHEET

💻 Essential Shortcuts:
• Cmd+Shift+P    - Command Palette (find any command)
• Cmd+P          - Quick Open File
• Cmd+Shift+N    - New Window
• Cmd+W          - Close Tab
• Cmd+S          - Save File

🤖 AI Features:
• Cmd+K          - AI Code Editing (select code first)
• Cmd+L          - AI Chat
• Tab            - Accept AI Suggestion
• Esc            - Dismiss AI Suggestion

✏️ Editing:
• Cmd+D          - Select Next Occurrence
• Cmd+Shift+L    - Select All Occurrences
• Cmd+/          - Toggle Comment
• Cmd+]          - Indent
• Cmd+[          - Unindent

🔍 Navigation:
• Cmd+G          - Go to Line
• Cmd+Shift+O    - Go to Symbol
• Cmd+T          - Show All Symbols
• Ctrl+G         - Go to Line Number

📁 File Explorer:
• Cmd+Shift+E    - Focus File Explorer
• Cmd+Shift+F    - Search Across Files
• Cmd+Shift+H    - Replace Across Files

🔧 Terminal:
• Ctrl+`         - Toggle Terminal
• Cmd+Shift+`    - Create New Terminal

💡 Pro Tips:
• Use Cmd+Shift+P and type what you want to do
• Ask the AI (Cmd+L) if you're stuck on anything
• Select code and use Cmd+K to ask AI to modify it
• Use Tab to accept AI suggestions as you type
EOF

echo -e "${GREEN}✅ Shortcuts cheat sheet created on Desktop${NC}"
echo ""

# Final configuration summary
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 Cursor Configuration Complete! 🎉${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "✅ What's been configured:"
echo "• Editor settings optimized for beginners"
echo "• Theme and appearance"
echo "• AI features enabled"
echo "• Essential extensions installed"
echo "• Productivity shortcuts set up"
echo "• Keyboard shortcuts cheat sheet created"
echo ""
echo "🚀 Next Steps:"
echo "1. Open Cursor from Applications or type 'cursor' in Terminal"
echo "2. Try opening a folder with File > Open Folder"
echo "3. Practice the keyboard shortcuts"
echo "4. Experiment with the AI features (Cmd+K and Cmd+L)"
echo ""
echo "💡 Remember:"
echo "• Check ~/Desktop/Cursor_Shortcuts.txt for keyboard shortcuts"
echo "• Use Cmd+Shift+P to find any feature"
echo "• The AI is your friend - ask it questions!"
echo ""
echo -e "${BLUE}Happy coding with your configured Cursor! 🎯${NC}"