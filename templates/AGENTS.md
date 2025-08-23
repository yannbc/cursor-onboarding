# AGENTS.md

This file helps AI coding assistants (like Cursor) understand your project and work more effectively.

## Project Context

**Project Type**: [Describe your project - web app, API, mobile app, etc.]
**Tech Stack**: [List main technologies - React, Node.js, Python, etc.]
**Purpose**: [Brief description of what this project does]

## Development Setup

### Getting Started
```bash
# Install dependencies
npm install

# Start development server
npm run dev
```

### Key Commands
| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm run test` | Run tests |
| `npm run lint` | Check code style |

## Coding Guidelines

### Language Preferences
- **Primary Language**: [JavaScript/TypeScript/Python/etc.]
- **Style**: [Brief style preferences]
- **Testing**: [Testing framework and approach]

### File Organisation
- **Components**: Place in `/components` folder
- **Styles**: Co-locate with components
- **Tests**: Place in `__tests__` or alongside files with `.test.js`
- **Utils**: Common utilities in `/utils`

### Code Style
- Use descriptive variable names
- Add comments for complex logic
- Follow existing patterns in the codebase
- Keep functions small and focused

## AI Assistant Guidelines

### When Making Changes
1. **Read existing code** before making changes
2. **Follow established patterns** in the codebase
3. **Test changes** before suggesting completion
4. **Update documentation** if adding new features

### Helpful Context
- **Main entry point**: [e.g., `src/index.js`, `app.py`]
- **Configuration files**: [List important config files]
- **Dependencies**: Check `package.json` before adding new packages
- **Environment**: Look for `.env.example` for required variables

### Common Tasks
- **Adding features**: Follow the existing component/module structure
- **Fixing bugs**: Check related tests and documentation
- **Refactoring**: Maintain backwards compatibility
- **Documentation**: Update README.md and inline comments

## Project Structure

```
project-root/
├── src/                 # Source code
├── components/          # Reusable components
├── pages/              # Page components
├── utils/              # Utility functions
├── tests/              # Test files
├── public/             # Static assets
└── docs/               # Documentation
```

## Testing

### Running Tests
```bash
# Run all tests
npm test

# Run specific test
npm test -- ComponentName

# Watch mode
npm test -- --watch
```

### Writing Tests
- Test user interactions, not implementation details
- Use descriptive test names
- Mock external dependencies
- Keep tests focused and isolated

## Deployment

### Environment Variables
- Copy `.env.example` to `.env.local`
- Never commit secrets or API keys
- Use different configs for dev/staging/production

### Build Process
```bash
# Build for production
npm run build

# Preview production build
npm run preview
```

## Common Issues

### Development Server Won't Start
- Check if port is already in use
- Clear node_modules and reinstall
- Check Node.js version compatibility

### Build Failures
- Run linter first: `npm run lint`
- Check for TypeScript errors
- Ensure all imports are correct

## Resources

- **Documentation**: [Link to project docs]
- **API Reference**: [Link to API docs if applicable]
- **Design System**: [Link to design guidelines if applicable]
- **Team Guidelines**: [Link to team coding standards]

---

*This AGENTS.md file helps AI assistants understand your project. Update it as your project evolves.*