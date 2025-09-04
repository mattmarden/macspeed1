# MacSpeed Usage Guide

This comprehensive guide covers all aspects of using MacSpeed to optimize your macOS system safely and effectively.

## Table of Contents

- [Getting Started](#getting-started)
- [Interactive Mode](#interactive-mode)
- [Command Line Usage](#command-line-usage)
- [Optimization Levels](#optimization-levels)
- [Reversion and Management](#reversion-and-management)
- [Understanding State Management](#understanding-state-management)
- [Troubleshooting](#troubleshooting)
- [Advanced Usage](#advanced-usage)

## Getting Started

### First Run

When you first run MacSpeed, it will:

1. Verify your system meets requirements (macOS 12.0+)
2. Check for admin privileges (needed for service management)
3. Verify System Integrity Protection status
4. Create the state directory at `~/.macspeed/`
5. Initialize tracking files

### Basic Usage

The simplest way to start is with the interactive mode:

```bash
macspeed
```

This launches the beautiful menu-driven interface where you can explore options safely.

## Interactive Mode

The interactive interface provides a intuitive way to manage your system optimizations:

### Main Menu

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃                                                                          ┃
┃                    MacSpeed - macOS Performance Optimizer               ┃
┃                                                                          ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

System Status: Ready for optimization

Optimization Levels:

  1. Essential        Safe performance optimizations
  2. Comprehensive    Essential + services and privacy  
  3. Maximum          Complete system optimization

System Management:

  4. Show Status      View current optimization state
  5. Revert Changes   Selective or complete restoration
  6. System Info      Hardware and performance analysis

  0. Exit
```

### Navigation

- Use number keys to select options
- Each optimization level shows detailed information before applying
- All changes require explicit confirmation
- Progress is shown with beautiful animations

## Command Line Usage

MacSpeed provides comprehensive command-line options for automation and scripting:

### Basic Commands

```bash
# Quick start with recommended optimizations
macspeed --essential

# Show current optimization status
macspeed --status

# Display system information
macspeed --info

# Show help
macspeed --help
```

### Optimization Commands

```bash
# Apply essential optimizations (safe for all users)
macspeed -1
macspeed --essential

# Apply comprehensive optimizations
macspeed -2  
macspeed --comprehensive

# Apply maximum optimizations (creates backup)
macspeed -3
macspeed --maximum
```

### Management Commands

```bash
# Check current optimization status
macspeed -s
macspeed --status

# Revert all optimizations to macOS defaults
macspeed --revert-all

# Display detailed system information
macspeed --info

# Show version information
macspeed -v
macspeed --version
```

## Optimization Levels

### Level 1: Essential (Recommended)

**Target Users**: All macOS users  
**Risk Level**: None  
**Backup**: Not required  

#### What it does:
- **Visual Effects Optimization**: Reduces animation times for faster UI
  - Disables window animations
  - Speeds up Dock animations
  - Optimizes window resize effects
- **Finder Performance**: Enhanced file management
  - Disables Finder animations
  - Shows path bar and status bar
  - Enables file extension display
- **Memory Optimization**: Architecture-specific improvements
  - Purges system memory
  - Apple Silicon: Enables Neural Engine optimizations
  - Intel: Disables Power Nap on AC power

#### Performance Impact:
- 60-70% faster animations
- Improved Finder responsiveness
- Better memory utilization
- Immediate visual improvements

#### Example:
```bash
macspeed --essential
```

### Level 2: Comprehensive

**Target Users**: Users comfortable with system modifications  
**Risk Level**: Low  
**Backup**: Not required  

#### What it does:
- All Essential optimizations, plus:
- **Service Management**: Safe background service optimization
  - Disables crash reporting services
  - Optimizes diagnostic cleanup
- **Privacy Controls**: Reduces data collection
  - Disables Siri and voice assistant
  - Configures Spotlight privacy settings
  - Reduces system telemetry
- **Network Optimization**: Improved network performance
  - TCP buffer optimizations
  - Connection handling improvements

#### Performance Impact:
- All Essential benefits
- Reduced background CPU usage
- Enhanced privacy protection
- Improved network throughput

#### Example:
```bash
macspeed --comprehensive
```

### Level 3: Maximum

**Target Users**: Power users and system administrators  
**Risk Level**: Medium  
**Backup**: Automatically created  

#### What it does:
- All Comprehensive optimizations, plus:
- **Advanced System Tweaks**: Deep system modifications
  - Screensaver and security settings
  - Document save behavior
  - Print queue management
- **Version-Specific Optimizations**:
  - macOS Sequoia: Apple Intelligence considerations
  - macOS Sonoma: Game Mode activation
  - macOS Ventura: Performance enhancements
- **Complete System Backup**: Created before changes

#### Performance Impact:
- Maximum possible performance gains
- Complete system optimization
- Professional-grade tuning
- System restart recommended

#### Example:
```bash
macspeed --maximum
```

## Reversion and Management

MacSpeed provides complete control over applied optimizations:

### Checking Current Status

```bash
macspeed --status
```

Shows detailed information about active optimizations:

```
Current Optimization Status

✓ Visual Effects: Active
✓ Finder Enhancements: Active
• Memory Optimization: Not Applied
• Service Management: Not Applied
• Privacy Controls: Not Applied
• Network Tuning: Not Applied
• Advanced Tweaks: Not Applied

2 optimization(s) currently active

Disabled Services:
  • com.apple.ReportCrash
  • com.apple.DiagnosticReportCleanup
```

### Selective Reversion

Use the interactive reversion menu for granular control:

```bash
macspeed
# Choose option 5: Revert Changes
```

Options include:
- Revert specific categories (Visual Effects, Finder, Services, etc.)
- Individual service management
- Complete system restoration

### Complete Reversion

Restore all settings to macOS defaults:

```bash
macspeed --revert-all
```

This command:
- Reverts all applied optimizations
- Re-enables disabled services
- Restores original system settings
- Maintains state tracking for future use

## Understanding State Management

MacSpeed uses sophisticated state tracking to manage optimizations:

### State Directory Structure

```
~/.macspeed/
├── state.json              # Current optimization state
├── logs/                   # Session logs
│   └── session-YYYYMMDD-HHMMSS.log
└── backups/                # System backups (Maximum level)
    └── backup-YYYYMMDD-HHMMSS/
```

### State File Format

The `state.json` file tracks all optimizations:

```json
{
  "version": "2.1.0",
  "created": "2025-01-15T14:30:00Z",
  "last_run": "2025-01-15T16:45:00Z",
  "optimizations": {
    "visual_effects": true,
    "finder_enhancements": true,
    "memory_optimization": false,
    "service_management": false,
    "privacy_controls": false,
    "network_tuning": false,
    "advanced_tweaks": false
  },
  "disabled_services": [
    "com.apple.ReportCrash"
  ],
  "backup_info": {
    "location": "/Users/username/.macspeed/backups/backup-20250115-143000",
    "timestamp": "2025-01-15T14:30:00Z"
  }
}
```

### Automatic State Detection

MacSpeed can detect optimizations even if the state file is missing:
- Analyzes system preferences
- Checks service status
- Reconstructs optimization state
- Updates tracking accordingly

## Troubleshooting

### Common Issues

#### Permission Errors

```bash
# Error: Admin privileges required
sudo macspeed --essential
```

#### Missing Dependencies

```bash
# MacSpeed will offer to install via Homebrew
# Or install manually:
brew install python3
```

#### State File Corruption

```bash
# Remove corrupted state and reinitialize
rm -rf ~/.macspeed
macspeed --status  # Recreates state with detection
```

### Diagnostic Information

Get detailed system information:

```bash
macspeed --info
```

Shows:
- Hardware specifications
- macOS version and architecture
- System performance metrics
- Current optimization status

### Log Analysis

Session logs provide detailed troubleshooting information:

```bash
# View latest session log
ls -la ~/.macspeed/logs/
tail -f ~/.macspeed/logs/session-$(date +%Y%m%d)-*.log
```

Log entries include:
- User confirmations
- System changes
- Error conditions
- State updates

## Advanced Usage

### Automation and Scripting

MacSpeed can be integrated into scripts:

```bash
#!/bin/bash
# System setup script

# Apply essential optimizations silently
macspeed --essential

# Check if successful
if macspeed --status | grep -q "optimization(s) currently active"; then
    echo "MacSpeed optimizations applied successfully"
else
    echo "MacSpeed optimization failed"
    exit 1
fi
```

### Integration with System Management

```bash
# Add to login items for new user setup
# Add to system deployment scripts
# Include in configuration management tools
```

### Custom Optimization Workflows

For advanced users who want specific combinations:

1. Apply base level: `macspeed --essential`
2. Use interactive mode for selective additions
3. Monitor system performance
4. Adjust as needed with reversion controls

### Performance Monitoring

Track the impact of optimizations:

```bash
# Before optimization
macspeed --info > before.txt

# Apply optimizations
macspeed --comprehensive  

# After optimization  
macspeed --info > after.txt

# Compare results
diff before.txt after.txt
```

### Maintenance

Regular maintenance tasks:

```bash
# Check optimization status monthly
macspeed --status

# Review logs if issues arise
ls ~/.macspeed/logs/

# Clean old logs (optional)
find ~/.macspeed/logs/ -name "*.log" -mtime +30 -delete
```

---

This guide covers the comprehensive usage of MacSpeed. For additional support, please refer to the [GitHub repository](https://github.com/mattmarden/macspeed1) or check the [troubleshooting section](https://github.com/mattmarden/macspeed1/issues).