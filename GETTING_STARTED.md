# 🚀 Getting Started - Complete Beginner Guide

**Never used GitHub or development tools? Start here!**

This guide assumes you're completely new to development and will walk you through everything step by step.

## 📋 What You Need

- **Mac computer** (this guide is for macOS only)
- **Internet connection**
- **15-20 minutes of time**
- **Your work email address**

## 🎯 Step 1: Create Your GitHub Account

### Why GitHub?
GitHub is like "Google Drive for code" - it's where developers store and share projects. You need an account to access most coding projects.

### Create Account
1. **Go to**: https://github.com/signup
2. **Username**: Choose carefully - this will be public and professional
   - ✅ Good: `john-smith`, `sarah-jones-dev`, `alex-m`  
   - ❌ Avoid: `cooldude123`, `temporary-name`
3. **Email**: Use your work email
4. **Password**: Create a strong password
5. **Verify**: Complete any verification steps (check your email)

### Choose Plan
- Select **Free plan** - it's perfect for most users
- Includes unlimited repositories and collaboration

**✅ Checkpoint**: You should be able to log into https://github.com with your new account.

## 🎯 Step 2: Get Terminal Ready

### What is Terminal?
Terminal is like a text-based way to control your computer. Don't worry - we'll give you exact commands to copy and paste!

### Open Terminal
1. **Press** `Cmd + Space` (this opens Spotlight search)
2. **Type** `Terminal` 
3. **Press** `Enter`

You'll see a window with text that looks like:
```
YourName@MacBook ~ %
```

This is normal! This is where you'll paste the setup commands.

**✅ Checkpoint**: Terminal window is open and showing a command prompt.

## 🎯 Step 3: Run the Cursor Setup

### The Magic Command
Copy this entire line and paste it into Terminal, then press Enter:

```bash
cd ~/Desktop && git clone https://github.com/yannbc/cursor-onboarding.git && cd cursor-onboarding && ./setup.sh
```

### What This Does
1. **Downloads** the setup files to your Desktop
2. **Runs** the interactive setup menu
3. **Guides** you through everything else

### What You'll See
- The setup will ask you questions
- Just follow the prompts and choose what makes sense
- It will install Git, Cursor, and set up GitHub authentication

## 🎯 Step 4: Follow the Setup Menu

When the setup runs, you'll see a menu like this:

```
╔══════════════════════════════════════════════════════════╗
║                 Cursor Onboarding Assistant              ║
║             Getting Non-Devs Up and Running             ║
╚══════════════════════════════════════════════════════════╝

=== Cursor Setup Menu ===

1) 🚀 Quick Setup (Recommended)
2) 📋 Step-by-Step Setup  
3) ⚙️  Cursor Configuration
4) ✅ Check Setup Status
5) 🆘 Troubleshooting
6) 📚 Documentation
7) Exit
```

### Recommended Path
**For first-time users**: Choose **Option 1 (Quick Setup)**

This will:
- Install all necessary tools
- Set up GitHub authentication  
- Configure Cursor IDE
- Take about 10-15 minutes total

## 🤔 What If Things Go Wrong?

### "Command not found" or similar errors
1. **Make sure you're in Terminal** (not another app)
2. **Try copying the command again** - make sure you got the whole thing
3. **Check your internet connection**

### "Repository not found" 
This means the GitHub repository URL might have changed. Contact your team lead.

### "Permission denied"
The setup might ask for your Mac password. This is normal - just enter it when prompted.

### Still stuck?
1. **Take a screenshot** of the error
2. **Ask a developer** on your team for help
3. **Try Option 5 (Troubleshooting)** in the setup menu

## 🎉 What Happens After Setup?

Once setup completes successfully, you'll have:

### ✅ **Git** - Download and manage code
- Can clone repositories from GitHub
- Track changes to files
- Collaborate with developers

### ✅ **Cursor IDE** - Your new code editor  
- AI-powered code editor
- Intelligent code completion
- Built-in chat to ask coding questions

### ✅ **GitHub Authentication** - Access to repositories
- Personal Access Token configured
- Can download private company repositories
- Ready to collaborate

### ✅ **Optimized Settings** - Beginner-friendly configuration
- Larger fonts and comfortable spacing
- Helpful shortcuts and features enabled
- Keyboard shortcuts cheat sheet on your Desktop

## 🚀 Your First Project

After setup, a developer on your team will typically:

1. **Share a repository URL** with you (looks like: `https://github.com/company/project-name`)
2. **You clone it** using Terminal:
   ```bash
   cd ~/Desktop
   git clone [THE-URL-THEY-GAVE-YOU]
   cd [PROJECT-FOLDER-NAME]  
   cursor .
   ```
3. **Cursor opens** with the project ready to work on!

## 💡 Quick Tips

### GitHub Authentication
- When cloning repositories, use your **GitHub username** and your **Personal Access Token** (NOT your GitHub password)
- The setup creates this token for you automatically

### Using Cursor
- **Cmd+K**: Select code and ask AI to modify it
- **Cmd+L**: Chat with AI about your code  
- **Cmd+Shift+P**: Find any feature (Command Palette)

### Getting Help
- **Built-in help**: Use the setup menu Option 6 (Documentation)
- **AI assistant**: Ask Cursor's AI (Cmd+L) when you're stuck
- **Team support**: Your developer colleagues are your best resource

## 📞 Support

### If Setup Fails Completely
1. **Close Terminal** 
2. **Open new Terminal window**
3. **Try the command again** - sometimes it just needs a fresh start
4. **Contact your team lead** with a screenshot if it still fails

### Common Questions
- **"Do I need to know how to code?"** - Nope! Cursor's AI will help you learn
- **"What if I break something?"** - Code files are just text - you can't break your computer
- **"How long does this take?"** - 15-20 minutes for complete setup
- **"Can I do this on Windows?"** - This guide is Mac-only, ask for Windows instructions

## 🎯 Success Checklist

By the end of setup, you should be able to:

- [ ] Log into your GitHub account
- [ ] Open Terminal and run basic commands
- [ ] Open Cursor IDE
- [ ] Clone a repository from GitHub  
- [ ] Ask Cursor's AI questions about code

**🎉 Once you can do all these things, you're ready to start collaborating with your development team!**

---

## 🆘 Emergency Restart

If everything goes wrong and you want to start over:

1. **Delete the setup folder**:
   ```bash
   rm -rf ~/Desktop/cursor-onboarding
   ```

2. **Run the setup command again**:
   ```bash
   cd ~/Desktop && git clone https://github.com/yannbc/cursor-onboarding.git && cd cursor-onboarding && ./setup.sh
   ```

3. **Choose Option 1 (Quick Setup)** and follow the prompts

**Remember: This process works for thousands of developers every day. If something's not working, there's always a solution!** 🚀