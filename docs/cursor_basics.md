# 🎯 Cursor Basics

**A beginner's guide to using Cursor IDE effectively.**

## 🚀 Getting Started

### Opening Cursor
- **From Applications**: Double-click Cursor in your Applications folder
- **From Terminal**: Type `cursor` and press Enter
- **Open a project**: Type `cursor .` in Terminal (opens current folder)
- **Open specific folder**: Type `cursor /path/to/folder`

### First Time Setup
1. **Welcome screen**: Cursor will show a welcome screen with tips
2. **Theme selection**: Choose Dark, Light, or Auto (follows system)
3. **Extensions**: Cursor may suggest helpful extensions

## 🎨 Interface Overview

### Main Areas
```
┌─────────────────────────────────────────────────────────┐
│ File  Edit  View  Go  Run  Terminal  Help              │ Menu Bar
├─────┬───────────────────────────────────────────────────┤
│ 📁  │  📄 filename.js    📄 style.css    📄 readme.md  │ File Tabs  
│ 📂  ├───────────────────────────────────────────────────┤
│ 📄  │                                                   │
│     │           Main Editor Area                        │ Editor
│     │                                                   │
│     ├───────────────────────────────────────────────────┤
│     │ Terminal                                          │ Terminal
└─────┴───────────────────────────────────────────────────┘
```

### Key Panels
- **📁 Explorer** (Left): Browse files and folders
- **🔍 Search** (Cmd+Shift+F): Find text across all files
- **🐛 Debug** (Cmd+Shift+D): Debug your code
- **📦 Extensions** (Cmd+Shift+X): Install additional features

## ⌨️ Essential Keyboard Shortcuts

### Must-Know Shortcuts
| Shortcut | What it does |
|----------|--------------|
| `Cmd+P` | Quick Open - find any file |
| `Cmd+Shift+P` | Command Palette - find any feature |
| `Cmd+S` | Save current file |
| `Cmd+W` | Close current tab |
| `Cmd+Shift+N` | New Cursor window |
| `Ctrl+`` | Toggle Terminal panel |

### AI Features (Cursor's Superpowers!)
| Shortcut | What it does |
|----------|--------------|
| `Cmd+K` | AI Edit - Select code and ask AI to modify it |
| `Cmd+L` | AI Chat - Ask AI questions about your code |
| `Tab` | Accept AI suggestion |
| `Esc` | Dismiss AI suggestion |

### Editing
| Shortcut | What it does |
|----------|--------------|
| `Cmd+D` | Select next occurrence of current word |
| `Cmd+Shift+L` | Select all occurrences |
| `Cmd+/` | Toggle comment |
| `Cmd+Z` | Undo |
| `Cmd+Shift+Z` | Redo |

## 🤖 Using Cursor's AI Features

### AI Chat (Cmd+L)
**What it is**: A chatbot that understands your code

**How to use**:
1. Press `Cmd+L` to open chat
2. Ask questions like:
   - "What does this function do?"
   - "How can I make this code faster?"
   - "Explain this error message"
   - "How do I add a button to this page?"

**Pro tip**: The AI can see your entire project, so it gives contextual help!

### AI Edit (Cmd+K)
**What it is**: Select code and ask AI to modify it

**How to use**:
1. Select some code (click and drag)
2. Press `Cmd+K`
3. Type what you want, like:
   - "Add error handling"
   - "Make this more efficient"
   - "Add comments explaining this"
   - "Convert this to use modern JavaScript"

**Pro tip**: Be specific about what you want changed!

### AI Code Completion
**What it is**: AI suggests code as you type

**How to use**:
1. Just start typing code
2. Gray text appears with suggestions
3. Press `Tab` to accept, `Esc` to dismiss
4. Keep typing to get more suggestions

**Pro tip**: The more context you provide, the better the suggestions!

## 📁 Working with Files and Projects

### Opening Projects
**Best practice**: Open the root folder of your project
1. File → Open Folder
2. Select the main project directory
3. Cursor shows all files in the Explorer panel

### File Explorer
- **📁 Folders**: Click to expand/collapse
- **📄 Files**: Click to open
- **Right-click**: Context menu with options
- **Drag and drop**: Move files around

### Managing Tabs
- **Multiple files**: Open in separate tabs
- **Close tabs**: Click the X or use Cmd+W  
- **Switch tabs**: Click tab or use Cmd+1, Cmd+2, etc.
- **Split view**: Right-click tab → "Split Right"

## 🔍 Finding Things

### Quick Open (Cmd+P)
**Use when**: You know the filename
- Type part of filename
- Use arrow keys to navigate
- Press Enter to open

### Search Across Files (Cmd+Shift+F)
**Use when**: Looking for specific text
- Type what you're looking for
- See results from all files
- Click results to jump to location

### Go to Line (Cmd+G)
**Use when**: You know the line number
- Type line number
- Press Enter to jump there

## 🔧 Terminal Integration

### Opening Terminal
- **Keyboard**: Press `Ctrl+``
- **Menu**: Terminal → New Terminal
- **Command Palette**: Cmd+Shift+P → "Terminal: Create New"

### Why Use Terminal?
- **Git commands**: Clone, commit, push code
- **Install packages**: Add new features to projects
- **Run scripts**: Execute build commands
- **Navigate**: Move around your file system

### Common Terminal Commands
```bash
# Navigation
cd folder-name     # Enter folder
cd ..              # Go back one folder
ls                 # List files
pwd                # Show current location

# Git (code management)
git status         # Check what's changed
git add .          # Stage all changes
git commit -m "message"  # Save changes
git push           # Upload to GitHub

# Cursor
cursor .           # Open current folder in Cursor
cursor filename    # Open specific file
```

## ⚙️ Customizing Cursor

### Settings
1. **Open**: Cmd+, (comma)
2. **Search**: Type what you want to change
3. **Common settings**:
   - `font size`: Make text bigger/smaller
   - `theme`: Change colors
   - `word wrap`: Wrap long lines
   - `auto save`: Save automatically

### Extensions
1. **Open**: Cmd+Shift+X
2. **Search**: Type extension name
3. **Popular for beginners**:
   - Prettier (formats code)
   - Live Server (preview web pages)
   - GitLens (better git integration)

## 💡 Tips for Non-Developers

### Don't Be Afraid to Experiment
- **Can't break anything**: Code files are just text
- **Undo exists**: Cmd+Z fixes most mistakes
- **Save often**: Cmd+S becomes muscle memory

### Use the AI When Stuck
- **Select code** → Cmd+K → "explain this"
- **Error message** → Cmd+L → paste error → ask for help
- **Want to add feature** → Cmd+L → describe what you want

### Learn Gradually
1. **Week 1**: Get comfortable opening files, basic editing
2. **Week 2**: Try the AI features (Cmd+K, Cmd+L)
3. **Week 3**: Learn git basics in terminal
4. **Week 4**: Explore extensions and customization

### Common Beginner Mistakes (And How to Avoid Them)
- **Opening single files**: Open the whole project folder instead
- **Not using AI**: It's there to help - use it liberally!  
- **Forgetting to save**: Use Cmd+S frequently
- **Closing important tabs**: Pin important files (right-click tab)

## 🎯 Workflow Example

**Typical session**:
1. **Open project**: `cursor .` in Terminal or File → Open Folder
2. **Explore**: Click through files in Explorer to understand structure
3. **Make changes**: Edit files, use AI for help
4. **Test**: Use Terminal to run project or preview changes
5. **Save work**: Cmd+S on modified files
6. **Commit**: Use git commands in Terminal (if using version control)

## 🆘 When Things Go Wrong

### Common Issues
- **Can't find file**: Use Cmd+P to search
- **Code looks wrong**: Check if you're in the right project folder
- **AI not helping**: Try rephrasing your question
- **Terminal commands fail**: Make sure you're in the right directory

### Getting Help
1. **AI Chat**: Cmd+L → describe your problem
2. **Command Palette**: Cmd+Shift+P → search for solutions
3. **Developer on your team**: They can help with specific project issues
4. **Online**: Search for "Cursor IDE" + your question

## 🚀 Next Steps

### Once You're Comfortable
- **Learn git**: Version control for tracking changes
- **Try extensions**: Add features specific to your work
- **Customize**: Make Cursor work the way you like
- **Explore**: Try different views, panels, and features

### Advanced Features to Explore Later
- **Multi-cursor editing**: Edit multiple places at once
- **Snippets**: Shortcuts for common code patterns
- **Debugging**: Step through code execution
- **Live sharing**: Collaborate in real-time

---

**Remember**: Cursor is designed to be helpful and intuitive. The AI features make it incredibly beginner-friendly. Don't hesitate to ask the AI questions - it's like having a coding expert sitting next to you! 🤖✨