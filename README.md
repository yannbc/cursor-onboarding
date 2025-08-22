# Cursor Onboarding

**Simple, foolproof setup to get non-developers up and running with Cursor IDE.**

## 🚀 Quick Start

### 👋 **Never used GitHub or development tools before?**
**Start here**: [GETTING_STARTED.md](GETTING_STARTED.md) - Complete beginner guide

### 💻 **Ready to set up Cursor?**
Copy and paste this into Terminal:

```bash
cd ~/Desktop && git clone https://github.com/yannbc/cursor-onboarding.git && cd cursor-onboarding && ./setup.sh
```

## 🎯 What This Does

Gets non-technical team members ready to use Cursor in **3 simple steps**:

1. **🛠️ Install essentials** - Git, Cursor, basic tools
2. **🔐 Setup GitHub** - Authentication to access code repositories  
3. **⚙️ Configure Cursor** - Optimized settings and helpful features

**Time required:** 10-15 minutes  
**Prerequisites:** Mac computer, internet connection

## 📋 What Gets Installed

### Essential Tools
- **Git** - Download and manage code
- **Cursor IDE** - AI-powered code editor
- **Command Line Tools** - Basic development utilities

### Configuration
- GitHub authentication setup
- Optimized editor settings
- Essential extensions
- Keyboard shortcuts cheat sheet
- AI features enabled

## 🎮 How to Use

### Option 1: Interactive Menu (Recommended)
1. Download this repository
2. Open Terminal
3. Navigate to the folder
4. Run: `./setup.sh`
5. Follow the friendly menu

### Option 2: Quick Setup
Run the quick setup directly:
```bash
./scripts/quick_setup.sh
```

### Option 3: Step-by-Step
For detailed explanations:
```bash
./scripts/step_by_step_setup.sh
```

## 📁 What's Inside

```
cursor-onboarding/
├── setup.sh                       # Main menu script
├── scripts/
│   ├── quick_setup.sh             # Fast, automatic setup
│   ├── step_by_step_setup.sh      # Detailed setup with explanations
│   └── cursor_config.sh           # Cursor-specific configuration
├── docs/
│   ├── troubleshooting.md         # Common issues and fixes
│   ├── cursor_basics.md           # How to use Cursor
│   └── github_setup.md            # GitHub help
└── templates/
    └── settings.json              # Recommended Cursor settings
```

## ⚡ Features for Non-Developers

### 🤖 AI-Powered Help
- **Cmd+K**: Select code and ask AI to modify it
- **Cmd+L**: Chat with AI about your code
- **Tab**: Accept AI code suggestions

### 🎨 Beginner-Friendly Setup
- Larger fonts and comfortable spacing
- Clear syntax highlighting
- Helpful error messages
- Auto-save enabled

### 📋 Shortcuts Cheat Sheet
Automatically creates `~/Desktop/Cursor_Shortcuts.txt` with all important keyboard shortcuts.

## 🛟 Getting Help

### Built-in Troubleshooting
Run the main script and choose option 5 for common fixes.

### Documentation
- **Cursor Basics**: How to use the editor
- **GitHub Setup**: Detailed authentication help
- **Troubleshooting**: Solutions to common problems

### Common Issues
- **"command not found"** → Restart Terminal
- **"permission denied"** → Check your password
- **"GitHub authentication failed"** → Use Personal Access Token, not password

## 🎯 After Setup

### First Steps
1. **Open Cursor**: Type `cursor` in Terminal or find it in Applications
2. **Open a project**: Use File > Open Folder
3. **Try the AI**: Press Cmd+L and ask a question
4. **Practice shortcuts**: Check the cheat sheet on your Desktop

### What You Can Do
- Clone and open code repositories
- Edit files with AI assistance
- Ask the AI to explain code
- Use intelligent code completion
- Collaborate with developers

## 🔧 For Team Leaders

### Deployment
1. Fork or download this repository
2. Customize for your team's specific needs
3. Share the repository URL with new team members
4. They run one command and they're ready to go

### Customization
- Edit `scripts/cursor_config.sh` for team-specific settings
- Update `templates/settings.json` with your preferred configuration
- Add company-specific extensions or themes
- Include team documentation in the `docs/` folder

## 🚨 Troubleshooting Quick Fixes

### Setup Issues
```bash
# If setup fails, start over:
cd ~/Desktop/cursor-onboarding
./setup.sh

# Choose option 4 to check what's working
# Choose option 5 for troubleshooting help
```

### Cursor Command Not Working
```bash
# Add to your shell profile:
echo 'export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### GitHub Authentication
1. Go to https://github.com/settings/tokens
2. Generate new token (classic)
3. Select 'repo' scope
4. Use token as password when cloning

## 📝 Notes

- **macOS only**: Currently designed for Mac users
- **No sudo required**: Installs everything in user space when possible
- **Safe**: Only installs official tools from trusted sources
- **Reversible**: All changes are in user directories

## 🤝 Contributing

This project is designed to be simple and foolproof. When adding features:

1. Keep the user experience simple
2. Provide clear, non-technical explanations
3. Test with actual non-developers
4. Include error handling and recovery steps

## 📄 License

MIT License - Feel free to adapt for your organization's needs.

---

**🎉 Ready to get your team coding with Cursor? Run the setup and you'll be ready in minutes!**