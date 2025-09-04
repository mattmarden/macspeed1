# Changelog

All notable changes to MacSpeed will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - 2025-01-15

### Added
- Complete reversion system with granular control
- Individual optimization category management
- Service-by-service control for re-enabling disabled services
- State validation and verification system
- Enhanced system information display with hardware details
- Architecture-specific optimizations for Apple Silicon vs Intel
- Version-specific optimizations for macOS Sequoia and Sonoma
- Comprehensive error handling with graceful failures
- Session logging system for troubleshooting
- Command-line interface with full argument support

### Enhanced
- Beautiful terminal interface with Unicode symbols and animations
- Professional color scheme with accessibility considerations
- Intelligent state detection from previous runs
- JSON-based state management with timestamp tracking
- Complete backup system for Maximum optimization level
- Protected service arrays preventing critical damage
- Advanced progress indicators with spinner animations

### Fixed
- State persistence across multiple sessions
- System Integrity Protection compliance
- Dependency checking and auto-installation via Homebrew
- Memory optimization for both Apple Silicon and Intel processors

## [2.0.0] - 2025-01-10

### Added
- Initial professional release
- Three-tier optimization system (Essential, Comprehensive, Maximum)
- State management with JSON persistence
- Visual effects optimization
- Finder performance enhancements
- Memory and cache optimization
- Background service management
- Privacy and telemetry controls
- Network performance tuning
- Advanced system tweaks
- Interactive terminal interface
- System verification and safety checks

### Security
- System Integrity Protection compliance
- Critical service protection
- Safe service management with validation
- Comprehensive backup creation

## [1.0.0] - 2025-01-05

### Added
- Basic macOS optimization functionality
- Simple terminal interface
- Essential performance improvements
- Basic safety checks

---

## Release Notes

### Version 2.1.0 Highlights

This release introduces comprehensive reversion capabilities and enhanced system management:

- **Smart Reversion**: Complete rollback system allowing users to revert specific optimization categories or all changes
- **Enhanced Safety**: Advanced protection for critical system services with comprehensive validation
- **Improved Interface**: Beautiful terminal UI with progress animations and professional styling  
- **State Intelligence**: Automatic detection of current optimizations even from previous tool runs
- **Architecture Awareness**: Different optimizations for Apple Silicon vs Intel processors
- **Version Specific**: Special handling for macOS Sequoia Apple Intelligence and Sonoma Game Mode

### Version 2.0.0 Highlights

The first professional release featuring:

- **Multi-Level Optimization**: Three carefully designed tiers from safe to advanced
- **State Management**: JSON-based tracking of all system modifications
- **Safety First**: Comprehensive protection of critical system components
- **Beautiful Interface**: Elegant terminal experience with colors and animations
- **Complete Reversibility**: Full rollback capability for all optimizations

### Compatibility

- **Supported**: macOS 12.0 (Monterey) and later
- **Tested**: macOS Sonoma 14.x, macOS Sequoia 15.x
- **Architecture**: Universal support for Apple Silicon (M1/M2/M3) and Intel processors
- **Dependencies**: Python 3 (pre-installed on modern macOS), Homebrew (for missing tools)

### Installation Methods

- **Homebrew**: `brew install mattmarden/tap/macspeed`
- **One-line**: `curl -fsSL https://raw.githubusercontent.com/mattmarden/macspeed1/main/install.sh | bash`
- **Manual**: Download and install to `/usr/local/bin/`