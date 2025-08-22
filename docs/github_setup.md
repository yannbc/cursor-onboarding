# 🔐 GitHub Setup Guide

**Complete guide to setting up GitHub authentication for Cursor.**

## 🤔 What is GitHub?

Think of GitHub as **Google Drive for code**:
- **Store projects**: Keep your code safe in the cloud
- **Version history**: See all changes over time
- **Collaboration**: Work on projects with others
- **Backup**: Never lose your work

## 📝 Creating a GitHub Account

### Step 1: Sign Up
1. Go to **https://github.com/signup**
2. **Username**: Choose carefully - this will be public
   - Good: `john-smith-dev`, `sarah-codes`, `alex-m`
   - Avoid: `cooldude123`, `temporary-name`
3. **Email**: Use your work email if this is for work
4. **Password**: Strong password (GitHub will check)

### Step 2: Verify Email
1. Check your email inbox
2. Click the verification link
3. Complete any additional verification steps

### Step 3: Choose Plan
- **Free plan** is perfect for most users
- Includes unlimited public and private repositories

## 🔑 Authentication Methods

GitHub offers two ways to authenticate:

### Method 1: Personal Access Token (Recommended)
**Pros**: 
- More secure than passwords
- Easy to set up
- Works everywhere

**Cons**: 
- Need to store the token safely

### Method 2: SSH Keys
**Pros**: 
- Very secure
- No need to enter credentials repeatedly

**Cons**: 
- More complex setup
- Need to manage keys

**For beginners, we recommend Personal Access Tokens.**

## 🎟️ Setting Up Personal Access Token

### Step 1: Create Token
1. **Log into GitHub**
2. **Click your profile picture** (top right)
3. **Settings**
4. **Scroll down** to "Developer settings" (left sidebar)
5. **Personal access tokens**
6. **Tokens (classic)**
7. **Generate new token (classic)**

### Step 2: Configure Token
1. **Note**: Give it a name like "Cursor Development - MacBook Pro"
2. **Expiration**: Choose how long it lasts
   - 30 days (more secure, need to renew)
   - 90 days (good balance)
   - No expiration (convenient but less secure)
3. **Select scopes**: Check these boxes:
   - ✅ **repo** (full control of private repositories)
   - ✅ **workflow** (if you plan to use GitHub Actions)

### Step 3: Generate and Save
1. **Click "Generate token"**
2. **Copy the token immediately** - you won't see it again!
3. **Store it safely**:
   - Password manager (best option)
   - Secure notes app
   - Write it down temporarily

**⚠️ Important**: Treat this token like a password. Don't share it or put it in code files.

## 🔧 Using Your Token

### When Cloning Repositories
When you run:
```bash
git clone https://github.com/username/repository.git
```

**Git will ask for credentials**:
- **Username**: Your GitHub username
- **Password**: Use your Personal Access Token (NOT your GitHub password)

### Example
```
Username for 'https://github.com': your-username
Password for 'https://your-username@github.com': ghp_xxxxxxxxxxxxxxxxxxxx
```

### Storing Credentials
macOS will ask if you want to save the credentials in Keychain - click **Save** so you don't have to enter them repeatedly.

## 🔐 SSH Key Setup (Advanced)

If you prefer SSH keys (more secure but complex):

### Step 1: Generate SSH Key
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```
- Press Enter to accept default file location
- Enter a passphrase (optional but recommended)

### Step 2: Add Key to SSH Agent
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### Step 3: Copy Public Key
```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

### Step 4: Add to GitHub
1. Go to **GitHub Settings**
2. **SSH and GPG keys**
3. **New SSH key**
4. **Paste the key** and give it a title
5. **Add SSH key**

### Step 5: Test Connection
```bash
ssh -T git@github.com
```
Should see: "Hi username! You've successfully authenticated..."

## 🧪 Testing Your Setup

### Test 1: Clone a Public Repository
```bash
cd ~/Desktop
git clone https://github.com/octocat/Hello-World.git
cd Hello-World
ls
```

Should download files without asking for credentials.

### Test 2: Clone a Private Repository
```bash
git clone https://github.com/your-username/your-private-repo.git
```

Will ask for username and token (if using HTTPS) or work automatically (if using SSH).

## 🚨 Troubleshooting

### "Authentication failed"
**Problem**: Can't clone repositories

**Solutions**:
1. **Use token, not password**: Make sure you're using Personal Access Token
2. **Check username**: Use GitHub username, not email
3. **Check token permissions**: Make sure 'repo' scope is selected
4. **Try HTTPS URL**: Use `https://github.com/...` not `git@github.com:...`

### "Repository not found"
**Problem**: Git says repository doesn't exist

**Solutions**:
1. **Check URL**: Make sure repository URL is correct
2. **Check access**: Make sure you have permission to access the repository
3. **Public vs Private**: Private repos require authentication

### "Permission denied"
**Problem**: Can access some repos but not others

**Solutions**:
1. **Check repository permissions**: Ask the repo owner for access
2. **Organization membership**: You might need to be added to an organization
3. **Token scope**: Make sure token has correct permissions

### Token Expired
**Problem**: Authentication suddenly stops working

**Solutions**:
1. **Generate new token**: Go through token creation process again
2. **Update stored credentials**: Delete old credentials from Keychain
3. **Use longer expiration**: Set longer expiration time for new token

## 📱 Managing Multiple Accounts

### Work and Personal GitHub
If you have both work and personal GitHub accounts:

### Option 1: Different Tokens
- Create separate Personal Access Tokens for each account
- Use different tokens when cloning different repositories

### Option 2: SSH with Different Keys
```bash
# Generate separate keys
ssh-keygen -t ed25519 -C "work@company.com" -f ~/.ssh/id_work
ssh-keygen -t ed25519 -C "personal@email.com" -f ~/.ssh/id_personal

# Configure SSH (create ~/.ssh/config)
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_work

Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_personal
```

Then clone using:
```bash
# Work repos
git clone git@github-work:company/repo.git

# Personal repos  
git clone git@github-personal:yourname/repo.git
```

## 💡 Best Practices

### Token Management
- **Use descriptive names**: "MacBook Pro - Cursor Development"
- **Set reasonable expiration**: 30-90 days
- **Rotate regularly**: Create new tokens periodically
- **Revoke unused tokens**: Clean up old tokens

### Security Tips
- **Never commit tokens**: Don't put tokens in code files
- **Use minimal permissions**: Only grant necessary scopes
- **Monitor token usage**: GitHub shows when tokens are used
- **Revoke if compromised**: Delete token immediately if exposed

### Workflow Tips
- **Save credentials**: Let macOS Keychain save them
- **Use HTTPS for simplicity**: Easier than SSH for beginners
- **Test with public repos first**: Make sure everything works
- **Keep token handy**: You'll need it for initial clones

## 🎯 Quick Reference

### Common Git Commands with Authentication
```bash
# Clone repository (will ask for credentials first time)
git clone https://github.com/username/repo.git

# Check if credentials are saved
git config --global credential.helper

# Remove saved credentials (if needed)
git config --global --unset credential.helper

# Clone with specific credentials (one-time)
git clone https://username:token@github.com/username/repo.git
```

### Useful URLs
- **Create account**: https://github.com/signup
- **Personal Access Tokens**: https://github.com/settings/tokens
- **SSH Keys**: https://github.com/settings/keys
- **Your repositories**: https://github.com/your-username?tab=repositories

## 🆘 Getting Help

### If Setup Fails
1. **Try the troubleshooting section** above
2. **Ask a developer** on your team for help
3. **Use the Cursor onboarding script** - it has guided setup
4. **Check GitHub's documentation**: https://docs.github.com/en/authentication

### Common Support Questions
- **"I can't remember my token"**: Create a new one
- **"Git keeps asking for password"**: Use token, not password
- **"Some repos work, others don't"**: Check repository permissions
- **"I have multiple GitHub accounts"**: See "Managing Multiple Accounts" section

---

**🎉 Once GitHub is set up correctly, you can easily download and contribute to any code project your team shares with you!**