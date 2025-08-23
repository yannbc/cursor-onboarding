#!/bin/bash

# AGENTS.md Setup Script
# Helps users create AGENTS.md files to guide AI assistants effectively

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}🤖 AGENTS.md Setup${NC}"
echo ""
echo "AGENTS.md files help AI assistants like Cursor understand your projects better."
echo "Think of it as a README for AI - it provides context and guidelines."
echo ""

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

# Function to ask for input with default
ask_with_default() {
    read -p "$1 [$2]: " input
    echo "${input:-$2}"
}

# Check if we're in a project directory
if [ ! -f "package.json" ] && [ ! -f "requirements.txt" ] && [ ! -f "Gemfile" ] && [ ! -f "go.mod" ] && [ ! -f "Cargo.toml" ]; then
    echo -e "${YELLOW}⚠️  This doesn't look like a project directory.${NC}"
    echo "AGENTS.md files work best in the root of your project."
    echo ""
    if ! ask_yes_no "Continue anyway?"; then
        echo "Navigate to your project directory first, then run this script."
        exit 0
    fi
fi

# Check if AGENTS.md already exists
if [ -f "AGENTS.md" ]; then
    echo -e "${YELLOW}AGENTS.md already exists in this directory.${NC}"
    if ! ask_yes_no "Replace it with a new one?"; then
        echo "Keeping existing AGENTS.md file."
        exit 0
    fi
    mv AGENTS.md AGENTS.md.backup
    echo "Existing file backed up to AGENTS.md.backup"
fi

echo ""
echo -e "${CYAN}Let's create your AGENTS.md file...${NC}"
echo ""

# Gather project information
PROJECT_NAME=$(basename "$(pwd)")
echo "Project name: $PROJECT_NAME"
echo ""

PROJECT_TYPE=$(ask_with_default "Project type (web app, API, mobile app, etc.)" "web app")
TECH_STACK=$(ask_with_default "Main technologies (React, Node.js, Python, etc.)" "JavaScript")
PURPOSE=$(ask_with_default "What does this project do?" "A web application")

# Detect package manager and common patterns
PACKAGE_MANAGER="npm"
DEV_COMMAND="npm run dev"
BUILD_COMMAND="npm run build"
TEST_COMMAND="npm test"
LINT_COMMAND="npm run lint"

if [ -f "package.json" ]; then
    if [ -f "yarn.lock" ]; then
        PACKAGE_MANAGER="yarn"
        DEV_COMMAND="yarn dev"
        BUILD_COMMAND="yarn build"
        TEST_COMMAND="yarn test"
        LINT_COMMAND="yarn lint"
    elif [ -f "pnpm-lock.yaml" ]; then
        PACKAGE_MANAGER="pnpm"
        DEV_COMMAND="pnpm dev"
        BUILD_COMMAND="pnpm build"
        TEST_COMMAND="pnpm test"
        LINT_COMMAND="pnpm lint"
    fi
    
    # Try to detect actual scripts from package.json
    if command -v jq >/dev/null 2>&1; then
        SCRIPTS=$(jq -r '.scripts | keys[]' package.json 2>/dev/null | head -5 | paste -sd "," -)
        if [ ! -z "$SCRIPTS" ]; then
            echo "Detected scripts: $SCRIPTS"
        fi
    fi
elif [ -f "requirements.txt" ]; then
    PACKAGE_MANAGER="pip"
    DEV_COMMAND="python manage.py runserver"
    BUILD_COMMAND="python setup.py build"
    TEST_COMMAND="python -m pytest"
    LINT_COMMAND="flake8"
elif [ -f "Gemfile" ]; then
    PACKAGE_MANAGER="bundle"
    DEV_COMMAND="bundle exec rails server"
    BUILD_COMMAND="bundle exec rake build"
    TEST_COMMAND="bundle exec rspec"
    LINT_COMMAND="bundle exec rubocop"
fi

echo ""
echo "Detected package manager: $PACKAGE_MANAGER"

# Create the AGENTS.md file
cat > AGENTS.md << EOF
# AGENTS.md

This file helps AI coding assistants (like Cursor) understand your project and work more effectively.

## Project Context

**Project Type**: ${PROJECT_TYPE}
**Tech Stack**: ${TECH_STACK}
**Purpose**: ${PURPOSE}

## Development Setup

### Getting Started
\`\`\`bash
# Install dependencies
${PACKAGE_MANAGER} install

# Start development server
${DEV_COMMAND}
\`\`\`

### Key Commands
| Command | Purpose |
|---------|---------|
| \`${DEV_COMMAND}\` | Start development server |
| \`${BUILD_COMMAND}\` | Build for production |
| \`${TEST_COMMAND}\` | Run tests |
| \`${LINT_COMMAND}\` | Check code style |

## Coding Guidelines

### Language Preferences
- **Primary Language**: ${TECH_STACK}
- **Style**: Follow existing patterns in the codebase
- **Testing**: Write tests for new features

### File Organisation
- Keep related files together
- Use descriptive folder names
- Follow existing project structure

### Code Style
- Use descriptive variable names
- Add comments for complex logic
- Follow existing patterns in the codebase
- Keep functions small and focused

## AI Assistant Guidelines

### When Making Changes
1. **Read existing code** before making changes
2. **Follow established patterns** in the codebase
3. **Test changes** using \`${TEST_COMMAND}\`
4. **Update documentation** if adding new features

### Helpful Context
- **Main entry point**: Check package.json or project structure
- **Configuration files**: Look for config files in project root
- **Dependencies**: Check package.json before adding new packages
- **Environment**: Look for .env.example for required variables

### Common Tasks
- **Adding features**: Follow the existing component/module structure
- **Fixing bugs**: Check related tests and documentation
- **Refactoring**: Maintain backwards compatibility
- **Documentation**: Update README.md and inline comments

## Testing

### Running Tests
\`\`\`bash
# Run all tests
${TEST_COMMAND}

# Run with watch mode (if available)
${TEST_COMMAND} --watch
\`\`\`

### Writing Tests
- Test user interactions, not implementation details
- Use descriptive test names
- Mock external dependencies
- Keep tests focused and isolated

## Deployment

### Environment Variables
- Copy .env.example to .env.local (if exists)
- Never commit secrets or API keys
- Use different configs for dev/staging/production

### Build Process
\`\`\`bash
# Build for production
${BUILD_COMMAND}
\`\`\`

## Common Issues

### Development Server Won't Start
- Check if port is already in use
- Clear dependencies and reinstall
- Check version compatibility

### Build Failures
- Run linter first: \`${LINT_COMMAND}\`
- Check for syntax errors
- Ensure all imports are correct

---

*This AGENTS.md file helps AI assistants understand your project. Update it as your project evolves.*
EOF

echo -e "${GREEN}✅ AGENTS.md created successfully!${NC}"
echo ""
echo "What this file does:"
echo "• Provides context about your project to AI assistants"
echo "• Lists common commands and workflows"
echo "• Sets coding guidelines and best practices"
echo "• Helps AI understand your project structure"
echo ""
echo "💡 Tips:"
echo "• Update AGENTS.md when you add new features or change structure"
echo "• Cursor will automatically use this file for better suggestions"
echo "• Keep it current - AI assistants work better with accurate information"
echo ""

if ask_yes_no "Would you like to see how to use this with Cursor?"; then
    echo ""
    echo -e "${CYAN}Using AGENTS.md with Cursor:${NC}"
    echo ""
    echo "1. **Open this project in Cursor**:"
    echo "   cursor ."
    echo ""
    echo "2. **Ask Cursor about your project**:"
    echo "   Press Cmd+L and ask questions like:"
    echo "   • 'How do I run this project?'"
    echo "   • 'What's the testing setup?'"
    echo "   • 'How should I add a new feature?'"
    echo ""
    echo "3. **Better code suggestions**:"
    echo "   Cursor will use AGENTS.md context for:"
    echo "   • More accurate autocompletion"
    echo "   • Following your project's patterns"
    echo "   • Suggesting appropriate commands"
    echo ""
    echo "4. **Keep it updated**:"
    echo "   • Add new commands as you create them"
    echo "   • Update guidelines when patterns change"
    echo "   • Include project-specific gotchas"
fi

echo ""
echo -e "${BLUE}AGENTS.md is ready! Your AI assistants will thank you. 🤖${NC}"