# Contributing to MacSpeed

Thank you for your interest in contributing to MacSpeed! This guide will help you get started with contributing to this macOS performance optimization tool.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contributing Guidelines](#contributing-guidelines)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Release Process](#release-process)

## Code of Conduct

By participating in this project, you agree to abide by our code of conduct:

- Be respectful and inclusive in all interactions
- Focus on constructive feedback and solutions
- Help maintain a safe and welcoming environment
- Report any unacceptable behavior to the maintainers

## Getting Started

### Prerequisites

- macOS 12.0 (Monterey) or later
- Xcode Command Line Tools
- Homebrew (recommended)
- Git

### Areas for Contribution

We welcome contributions in several areas:

1. **Core Functionality**
   - New optimization techniques
   - Performance improvements
   - Safety enhancements

2. **Platform Support**
   - Support for new macOS versions
   - Architecture-specific optimizations
   - Compatibility improvements

3. **User Experience**
   - Interface improvements
   - Documentation enhancements
   - Error handling

4. **Testing**
   - Test coverage expansion
   - Edge case handling
   - Performance testing

## Development Setup

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/your-username/macspeed1.git
cd macspeed1
```

### 2. Development Environment

```bash
# Make the script executable
chmod +x macspeed

# Test the current version
./macspeed --help
```

### 3. Understanding the Codebase

The MacSpeed script is organized into several key sections:

```bash
# Core configuration and constants
CORE CONFIGURATION

# Utility functions for UI and logging  
UTILITY FUNCTIONS

# JSON-based state management
STATE MANAGEMENT SYSTEM

# System verification and safety checks
SYSTEM VERIFICATION & SAFETY

# Individual optimization implementations
OPTIMIZATION IMPLEMENTATIONS

# Three-tier optimization levels
OPTIMIZATION LEVELS

# Complete reversion capabilities
REVERSION SYSTEM

# Interactive and CLI interfaces
USER INTERFACE

# Main execution flow
MAIN EXECUTION
```

## Contributing Guidelines

### Code Style

1. **Shell Scripting Standards**
   - Use `#!/usr/bin/env zsh` shebang
   - Enable strict error handling: `set -euo pipefail`
   - Use readonly variables for constants
   - Quote all variable expansions

2. **Function Naming**
   - Use descriptive names with underscores
   - Group related functions together
   - Add comments for complex logic

3. **Safety First**
   - Always validate inputs
   - Check system state before changes
   - Provide clear error messages
   - Never modify protected services

### Documentation

1. **Code Comments**
   - Document complex algorithms
   - Explain safety considerations
   - Note macOS version specifics

2. **User Documentation**
   - Update README.md for new features
   - Add usage examples
   - Document new command-line options

### Safety Requirements

**Critical**: All contributions must maintain MacSpeed's safety-first approach:

1. **Protected Services**: Never modify services in the `PROTECTED_SERVICES` array
2. **System Integrity**: Respect SIP (System Integrity Protection)
3. **Reversibility**: All optimizations must be completely reversible
4. **State Tracking**: Update state management for new optimizations
5. **Error Handling**: Graceful failure with informative messages

### Adding New Optimizations

When adding new optimization features:

1. **Research Phase**
   - Verify the optimization is safe
   - Test on multiple macOS versions
   - Document performance impact

2. **Implementation**
   ```bash
   optimize_new_feature() {
       print_section "New Feature Optimization"
       
       if [[ "$(get_state_field "new_feature")" == "true" ]]; then
           print_status "info" "New feature already optimized"
           return 0
       fi
       
       # Implementation with error checking
       # Update state on success
       update_state_field "new_feature" "true"
       print_status "success" "New feature optimized"
   }
   ```

3. **Reversion Function**
   ```bash
   revert_new_feature() {
       # Complete reversion logic
       update_state_field "new_feature" "false"
   }
   ```

4. **Integration**
   - Add to appropriate optimization level
   - Update state management
   - Add reversion capability
   - Update documentation

## Testing

### Manual Testing

Test all changes on multiple configurations:

1. **System Variations**
   - Apple Silicon (M1/M2/M3) and Intel
   - Different macOS versions (Monterey, Ventura, Sonoma, Sequoia)
   - Various system configurations

2. **Functionality Testing**
   ```bash
   # Test installation
   ./install.sh
   
   # Test each optimization level
   macspeed --essential
   macspeed --status
   macspeed --revert-all
   
   # Test interactive mode
   macspeed
   
   # Test command-line options
   macspeed --help
   macspeed --info
   ```

3. **Edge Cases**
   - Systems with existing optimizations
   - Interrupted operations
   - Permission issues
   - Missing dependencies

### Testing Checklist

- [ ] Script executes without errors
- [ ] All optimization levels work correctly
- [ ] Reversion functionality works
- [ ] State management is accurate
- [ ] Interactive interface is responsive
- [ ] Command-line options function properly
- [ ] Error messages are helpful
- [ ] Performance improvements are measurable

## Submitting Changes

### Before Submitting

1. **Test Thoroughly**
   - Test on your system
   - Verify all functionality
   - Check for unintended side effects

2. **Update Documentation**
   - Update relevant documentation
   - Add usage examples
   - Update CHANGELOG.md

3. **Code Quality**
   - Run shellcheck if available
   - Verify code follows style guidelines
   - Ensure proper error handling

### Pull Request Process

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/new-optimization
   ```

2. **Make Changes**
   - Implement your changes
   - Test thoroughly
   - Update documentation

3. **Commit Changes**
   ```bash
   git add .
   git commit -m "Add new optimization feature

   - Implements safe [feature] optimization
   - Adds reversion capability
   - Updates state management
   - Includes comprehensive testing"
   ```

4. **Push and Create PR**
   ```bash
   git push origin feature/new-optimization
   ```

   Then create a Pull Request on GitHub with:
   - Clear description of changes
   - Testing performed
   - Screenshots if applicable
   - Breaking changes noted

### Pull Request Template

Your PR should include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on Apple Silicon
- [ ] Tested on Intel
- [ ] Tested on multiple macOS versions
- [ ] All optimization levels tested
- [ ] Reversion functionality verified

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings introduced
```

## Release Process

### Version Numbering

MacSpeed follows [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes or major new features
- **MINOR**: New features that are backwards compatible
- **PATCH**: Bug fixes and small improvements

### Release Checklist

1. **Testing**
   - Comprehensive testing on supported systems
   - Performance verification
   - Safety validation

2. **Documentation**
   - Update CHANGELOG.md
   - Update version in script
   - Update README.md if needed

3. **GitHub Release**
   - Create release tag
   - Generate release notes
   - Update Homebrew formula

## Getting Help

### Resources

- **Documentation**: Check docs/ directory
- **Issues**: Search existing GitHub issues
- **Discussions**: Use GitHub Discussions for questions

### Contact

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion

### Debugging

For development debugging:

```bash
# Enable verbose logging
export DEBUG=1
./macspeed --essential

# Check logs
tail -f ~/.macspeed/logs/session-*.log

# State inspection
cat ~/.macspeed/state.json | python3 -m json.tool
```

## Thank You

Your contributions help make MacSpeed better for everyone. Whether you're fixing bugs, adding features, improving documentation, or helping with testing, every contribution is valuable and appreciated.

---

For questions about contributing, please open an issue or start a discussion on GitHub.