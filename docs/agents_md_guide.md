# 🤖 AGENTS.md Guide

**Help AI assistants understand your projects better.**

## What is AGENTS.md?

AGENTS.md is like a README file, but specifically for AI assistants like Cursor. It provides context about your project so AI can give better suggestions and follow your coding patterns.

Think of it as **instructions for your AI pair programmer**.

## Why Use AGENTS.md?

### Better AI Suggestions
- **Context-aware**: AI understands your project structure
- **Pattern matching**: Follows your existing code style
- **Command accuracy**: Suggests the right build/test commands
- **Framework knowledge**: Understands your tech stack

### Consistent Coding
- **Team alignment**: Everyone (including AI) follows the same patterns
- **Reduced errors**: AI avoids common project-specific mistakes
- **Faster onboarding**: New team members (and AI) get up to speed quickly

## What Goes in AGENTS.md?

### Essential Information
1. **Project context** - What does this project do?
2. **Tech stack** - Languages, frameworks, tools
3. **Common commands** - How to run, test, build
4. **Coding guidelines** - Style, patterns, best practices
5. **Project structure** - Where things go, how files are organised

### Example Structure
```markdown
# AGENTS.md

## Project Context
**Project Type**: React web app
**Tech Stack**: React, TypeScript, Node.js
**Purpose**: Customer dashboard for analytics

## Development Setup
### Key Commands
| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm test` | Run tests |

## Coding Guidelines
- Use TypeScript for all new components
- Place components in /src/components
- Write tests alongside components
```

## How Cursor Uses AGENTS.md

### Automatic Context
When you:
- **Ask questions** (Cmd+L): Cursor uses project context
- **Edit code** (Cmd+K): Follows your established patterns
- **Get suggestions**: Considers your tech stack and style

### Better Completions
- **Import suggestions**: Knows your project structure
- **Code patterns**: Matches existing components
- **Command suggestions**: Recommends correct scripts

## Creating AGENTS.md

### Option 1: Use the Setup Script
From the cursor-onboarding menu:
1. Choose option 4: "🤖 Set up AGENTS.md"
2. Answer a few questions about your project
3. Script creates a customised AGENTS.md file

### Option 2: Manual Creation
1. Create `AGENTS.md` in your project root
2. Copy the template from `/templates/AGENTS.md`
3. Customise for your specific project

### Option 3: Start Simple
```markdown
# AGENTS.md

**Project**: My web app
**Tech**: React + Node.js
**Commands**: 
- Dev server: `npm run dev`
- Tests: `npm test`

**Style**: Use TypeScript, keep components small
```

## Best Practices

### Keep It Current
- **Update regularly**: Add new commands and patterns
- **Document changes**: New features, refactoring, structure changes
- **Team responsibility**: Everyone keeps it accurate

### Be Specific
- **Concrete examples**: Show actual code patterns
- **Clear commands**: Exact scripts to run
- **Context matters**: Explain *why*, not just *what*

### Project-Specific Details
- **Gotchas**: Common mistakes or tricky areas
- **Dependencies**: Important packages or tools
- **Environment**: Special setup requirements

## Examples by Project Type

### React Web App
```markdown
## Coding Guidelines
- Use functional components with hooks
- Place styles in component folders
- Use TypeScript interfaces for props
- Test user interactions, not implementation
```

### Node.js API
```markdown
## API Guidelines  
- Use Express middleware patterns
- Place routes in /src/routes
- Use async/await for database calls
- Mock external APIs in tests
```

### Python Django
```markdown
## Django Patterns
- Use class-based views
- Place models in apps/
- Use Django ORM, avoid raw SQL
- Test with pytest-django
```

## Common Mistakes

### Too Generic
❌ "Follow best practices"
✅ "Use camelCase for variables, PascalCase for components"

### Out of Date
❌ Commands that no longer work
✅ Current, tested commands

### Too Detailed
❌ Every single detail about the project
✅ Key patterns and context AI needs

## Integration with Cursor

### Using AGENTS.md
1. **Place in project root**: Same level as package.json
2. **Open project in Cursor**: `cursor .`
3. **AI automatically reads it**: No additional setup needed
4. **Better suggestions immediately**: Context-aware completions

### Testing It Works
1. **Ask Cursor about your project**: Cmd+L, ask "How do I run this?"
2. **Request code changes**: Should follow your patterns
3. **Check completions**: More accurate suggestions

## Team Benefits

### For Developers
- **Consistent AI help**: Everyone gets the same quality assistance
- **Faster coding**: AI understands project patterns immediately
- **Better refactoring**: AI suggests improvements that fit your style

### For Teams
- **Shared knowledge**: Project patterns documented in one place
- **Onboarding tool**: New team members understand project structure
- **Quality assurance**: AI helps maintain coding standards

## Maintenance

### Regular Updates
- **Weekly review**: Check if commands/patterns changed
- **Feature additions**: Document new parts of the codebase
- **Team feedback**: Ask what AI should know better

### Version Control
- **Commit changes**: Treat like any other project file
- **Code review**: Include AGENTS.md in pull requests
- **Branching**: Update in feature branches

## Advanced Tips

### Multiple AGENTS.md Files
- **Monorepos**: One per package/service
- **Large projects**: Additional files in subdirectories
- **Microservices**: Service-specific context

### Integration with Documentation
- **Link to wiki**: Reference detailed documentation
- **API references**: Link to API docs or schemas
- **Design systems**: Reference UI guidelines

## Troubleshooting

### AI Not Using Context
- **Check file location**: Must be in project root
- **Restart Cursor**: Refresh to pick up changes
- **File format**: Must be exactly `AGENTS.md`

### Outdated Suggestions
- **Update AGENTS.md**: Ensure current information
- **Be specific**: Add more context about new patterns
- **Remove old info**: Delete obsolete guidelines

---

**💡 Remember**: AGENTS.md is a living document. The more accurate and current it is, the better your AI assistant becomes at helping with your specific project.**