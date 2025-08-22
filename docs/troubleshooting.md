# 🛟 Troubleshooting Guide

Common issues and their solutions when setting up Cursor.

## 🚨 Quick Fixes

### "Command not found" errors
**Problem**: Terminal says `git: command not found` or `cursor: command not found`

**Solutions**:
1. **Restart Terminal** - Close Terminal completely and open a new window
2. **Reload shell configuration**: Run `source ~/.zshrc`
3. **Check PATH**: Run `echo $PATH` to see if tools are in your path

### Permission denied
**Problem**: Setup script asks for password repeatedly or fails with permission errors

**Solutions**:
1. **Enter password correctly** - macOS password prompts don't show characters
2. **Refresh sudo**: Run `sudo -v` and enter your password
3. **Use quick setup**: Run `./scripts/quick_setup.sh` which requires fewer permissions

### GitHub authentication failed
**Problem**: Can't clone repositories, gets "authentication failed" error

**Solutions**:
1. **Use Personal Access Token**, not your GitHub password
2. **Create token**: Go to https://github.com/settings/tokens
3. **Check token permissions**: Make sure 'repo' scope is selected
4. **Username**: Use your GitHub username, not email

## 📱 Setup Issues

### Cursor won't install
**Problem**: Cursor installation fails or won't open

**Solutions**:
1. **Manual download**: Go to https://cursor.sh and download directly
2. **Check Applications folder**: Look for Cursor.app in /Applications/
3. **Security settings**: Go to System Preferences > Security & Privacy and allow Cursor
4. **Restart Mac**: Sometimes helps with permission issues

### Git configuration problems
**Problem**: Git asks for name/email repeatedly

**Solutions**:
1. **Set globally**: 
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```
2. **Check current settings**:
   ```bash
   git config --global --list
   ```
3. **Reset if needed**:
   ```bash
   git config --global --unset user.name
   git config --global --unset user.email
   ```

### Command Line Tools won't install
**Problem**: Xcode Command Line Tools installation fails

**Solutions**:
1. **Manual install**: Run `xcode-select --install` in Terminal
2. **Check if already installed**: Run `git --version` 
3. **Reset installation**: 
   ```bash
   sudo xcode-select --reset
   xcode-select --install
   ```
4. **Alternative**: Install full Xcode from App Store (larger download)

## 🖥️ Cursor Issues

### Cursor command doesn't work
**Problem**: `cursor` command in Terminal doesn't work

**Solutions**:
1. **Add to PATH manually**:
   ```bash
   echo 'export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```
2. **Check if Cursor is installed**: Look in /Applications/Cursor.app
3. **Use full path**: `/Applications/Cursor.app/Contents/Resources/app/bin/cursor`

### Cursor won't open files
**Problem**: Cursor opens but can't open project folders

**Solutions**:
1. **Check file permissions**: Make sure you can read the folder
2. **Use File > Open Folder** instead of drag and drop
3. **Try a simple folder** like Desktop first
4. **Reset Cursor settings**: Delete `~/Library/Application Support/Cursor`

### Extensions won't install
**Problem**: Cursor extensions fail to install

**Solutions**:
1. **Manual install**: Use Cmd+Shift+X and search for extensions
2. **Check internet connection**: Extensions need to download
3. **Restart Cursor** after installation attempts
4. **Check Cursor updates**: Help > Check for Updates

## 🔐 GitHub Issues

### Can't create GitHub account
**Problem**: GitHub signup fails or email not verified

**Solutions**:
1. **Check email spam folder** for verification email
2. **Use different email** if current one has issues
3. **Try different browser** or incognito mode
4. **Contact GitHub support** if account creation fails

### Personal Access Token problems
**Problem**: Token doesn't work or keeps asking for password

**Solutions**:
1. **Use token as password**, not in username field
2. **Check token permissions**: Must have 'repo' scope
3. **Token expired**: Create a new token if old one expired
4. **Copy token carefully**: No extra spaces or characters

### Repository access denied
**Problem**: Can't clone private repositories

**Solutions**:
1. **Check repository permissions**: Ask repo owner for access
2. **Use correct URL**: Make sure repository URL is correct
3. **Try HTTPS instead of SSH**: Use https://github.com/... URL
4. **Verify GitHub username**: Make sure username is correct

## 💻 Terminal Issues

### Terminal won't open
**Problem**: Can't find or open Terminal

**Solutions**:
1. **Spotlight search**: Press Cmd+Space, type "Terminal"
2. **Applications folder**: Go to Applications > Utilities > Terminal
3. **Launchpad**: Look for Terminal in Launchpad
4. **Alternative**: Use iTerm2 or other terminal apps

### Commands not found
**Problem**: Basic commands like `ls` or `cd` don't work

**Solutions**:
1. **Check if you're in Terminal**: Not Cursor or other app
2. **Reset Terminal**: Close and reopen Terminal
3. **Check shell**: Run `echo $SHELL` (should be /bin/zsh)
4. **Reinstall command line tools** if commands are missing

### Shell configuration issues
**Problem**: Settings don't persist between Terminal sessions

**Solutions**:
1. **Check shell profile**: Make sure ~/.zshrc exists
2. **Source manually**: Run `source ~/.zshrc`
3. **Check file permissions**: Make sure ~/.zshrc is readable
4. **Create new profile**: `touch ~/.zshrc` then add settings

## 🔄 Recovery Procedures

### Start Over Completely
If everything is broken:

1. **Clean up**:
   ```bash
   rm -rf ~/Desktop/cursor-onboarding
   ```
2. **Download fresh**:
   ```bash
   cd ~/Desktop
   git clone [REPO-URL]
   cd cursor-onboarding
   ```
3. **Run setup**:
   ```bash
   ./setup.sh
   ```

### Reset Just Git
If Git is misconfigured:

```bash
git config --global --unset user.name
git config --global --unset user.email
git config --global --unset credential.helper
# Then run setup again
```

### Reset Just Cursor
If Cursor is messed up:

1. **Remove Cursor**: Drag /Applications/Cursor.app to Trash
2. **Remove settings**: `rm -rf ~/Library/Application\ Support/Cursor`
3. **Reinstall**: Download fresh from https://cursor.sh

## 📞 Getting More Help

### Check Status First
Run the main setup script and choose option 4 to see what's working.

### System Information
Helpful info when asking for help:
```bash
# macOS version
sw_vers

# Shell version
echo $SHELL

# Git version (if working)
git --version

# Check if Cursor exists
ls -la /Applications/Cursor.app
```

### Common Error Messages

**"xcrun: error: invalid active developer path"**
→ Run: `xcode-select --install`

**"Repository not found"**
→ Check repository URL and your access permissions

**"Authentication failed"**
→ Use Personal Access Token, not password

**"Permission denied (publickey)"**
→ Use HTTPS URL, not SSH URL

**"cursor: command not found"**
→ Restart Terminal or run: `source ~/.zshrc`

## 🆘 Last Resort

If nothing works:

1. **Ask a developer for help** - they can debug specific issues
2. **Try on a different Mac** - might be system-specific
3. **Use manual installation** - download Cursor directly, skip automation
4. **Document the issue** - help improve this guide for others

Remember: These tools work for millions of developers daily. If something's not working, there's always a solution! 🚀