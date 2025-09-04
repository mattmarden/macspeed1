# MacSpeed

A comprehensive, safe, and elegant performance optimization tool for macOS with intelligent state management and granular reversion capabilities.

## Overview

MacSpeed is a professional-grade macOS optimization tool designed to enhance system performance while maintaining complete system safety. It provides three levels of optimization, from essential performance improvements to comprehensive system tuning, all with full reversibility and intelligent state tracking.

## Features

- **Safe Operation**: Never touches critical system services or compromises system integrity
- **Multiple Optimization Levels**: Choose from Essential, Comprehensive, or Maximum optimization
- **State Management**: Intelligent tracking of all changes with JSON-based persistence
- **Complete Reversion**: Full rollback capability for any optimization level
- **Beautiful Interface**: Elegant terminal UI with colors, animations, and progress indicators
- **Architecture Aware**: Optimizations tailored for Apple Silicon vs Intel processors
- **Version Specific**: Handles macOS Monterey through Sequoia with version-specific tweaks

## Installation

### Homebrew (Recommended)

```bash
brew tap mattmarden/tap
brew install macspeed
```

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/mattmarden/macspeed1/main/install.sh | bash
```

### Manual Installation

```bash
curl -L https://raw.githubusercontent.com/mattmarden/macspeed1/main/macspeed -o macspeed
chmod +x macspeed
sudo mv macspeed /usr/local/bin/
```

## Usage

### Interactive Mode

```bash
macspeed
```

Launch the beautiful interactive interface to choose your optimization level and manage system settings.

### Command Line Options

```bash
macspeed --essential        # Apply essential optimizations (recommended)
macspeed --comprehensive    # Essential + services and privacy controls
macspeed --maximum          # Complete system optimization with backup
macspeed --status          # Check current optimization status
macspeed --revert-all      # Restore all settings to macOS defaults
macspeed --info            # Display detailed system information
macspeed --help            # Show all available options
```

## Optimization Levels

### 1. Essential (Recommended for all users)
- Visual effects optimization for faster animations
- Finder performance enhancements
- Memory allocation optimization
- **Risk Level**: None - completely safe for all users

### 2. Comprehensive (Enhanced users)
- All Essential optimizations
- Background service management
- Privacy and telemetry reduction
- Network performance tuning
- **Risk Level**: Low - balances performance with system stability

### 3. Maximum (Power users)
- All Comprehensive optimizations
- Advanced system tweaks
- Version-specific optimizations
- **Risk Level**: Medium - creates automatic backup before changes

## Safety Features

MacSpeed is designed with safety as the top priority:

- **Protected Services**: Never modifies critical system services
- **System Integrity Protection**: Full SIP compliance
- **Automatic Backups**: Created before advanced optimizations
- **State Validation**: Verifies changes before updating tracking
- **Error Handling**: Graceful failure recovery with detailed logging
- **Complete Reversibility**: Every change can be undone

## System Requirements

- macOS 12.0 (Monterey) or later
- Admin privileges (for service management)
- Python 3 (usually pre-installed)

## What Gets Optimized

### Visual Effects
- Window animations and transitions
- Dock animations and effects
- UI responsiveness improvements

### Finder Enhancements
- Faster file operations
- Enhanced navigation features
- Improved search performance

### System Services
- Safe background service optimization
- Crash reporting management
- Diagnostic service tuning

### Privacy Controls
- Siri and voice assistant management
- Telemetry and data collection reduction
- Spotlight search optimization

### Network Performance
- TCP buffer optimizations
- Connection handling improvements

### Advanced Tweaks (Maximum level only)
- Version-specific optimizations
- Desktop and UI refinements
- Security and screensaver settings

## Technical Details

MacSpeed uses a sophisticated state management system to track all optimizations:

- **State File**: `~/.macspeed/state.json` - tracks all applied optimizations
- **Logging**: `~/.macspeed/logs/` - detailed session logs for troubleshooting
- **Backups**: `~/.macspeed/backups/` - preference backups for Maximum level

The tool automatically detects:
- Processor architecture (Apple Silicon vs Intel)
- macOS version for version-specific optimizations
- Current system state to avoid duplicate operations
- System Integrity Protection status

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MacSpeed is released under the MIT License. See [LICENSE](LICENSE) for details.

## Support

If you encounter issues or have questions:

1. Check the current status: `macspeed --status`
2. View system information: `macspeed --info`
3. Check logs in `~/.macspeed/logs/`
4. [Open an issue](https://github.com/mattmarden/macspeed1/issues) on GitHub

## Uninstall

To completely remove MacSpeed:

```bash
# Revert all optimizations first
macspeed --revert-all

# Remove the application
sudo rm /usr/local/bin/macspeed

# Remove state directory (optional)
rm -rf ~/.macspeed
```

---

**MacSpeed** - Professional macOS optimization made simple.