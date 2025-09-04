#!/usr/bin/env bash
#
# MacSpeed Installation Script
# Copyright (c) 2025 Matt Marden
# Licensed under the MIT License
#
# One-line installer for MacSpeed - macOS Performance Optimizer
# Usage: curl -fsSL https://raw.githubusercontent.com/mattmarden/macspeed1/main/install.sh | bash
#

set -euo pipefail

# Configuration
readonly REPO_URL="https://raw.githubusercontent.com/mattmarden/macspeed1/main"
readonly SCRIPT_NAME="macspeed"
readonly INSTALL_DIR="/usr/local/bin"
readonly TEMP_DIR="/tmp/macspeed-install"

# Colors for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly BLUE='\033[0;34m'
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly RESET='\033[0m'

# Utility functions
print_status() {
    local status="$1"
    local message="$2"
    
    case "$status" in
        "success") printf "  ${GREEN}${BOLD}✓${RESET} %s\n" "$message" ;;
        "error")   printf "  ${RED}${BOLD}✗${RESET} %s\n" "$message" ;;
        "warning") printf "  ${YELLOW}${BOLD}⚠${RESET} %s\n" "$message" ;;
        "info")    printf "  ${BLUE}${BOLD}•${RESET} %s\n" "$message" ;;
    esac
}

print_header() {
    printf "\n${BLUE}${BOLD}"
    printf "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n"
    printf "┃                                                                          ┃\n"
    printf "┃                     MacSpeed Installation Script                         ┃\n"
    printf "┃                                                                          ┃\n"
    printf "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"
    printf "${RESET}\n"
}

error_exit() {
    print_status "error" "$1"
    exit 1
}

verify_system() {
    print_status "info" "Verifying system requirements..."
    
    # Check if running on macOS
    if [[ "$(uname)" != "Darwin" ]]; then
        error_exit "MacSpeed is only supported on macOS"
    fi
    
    # Check macOS version
    local os_version
    os_version="$(sw_vers -productVersion)"
    local major_version="${os_version%%.*}"
    
    if [[ "$major_version" -lt 12 ]]; then
        error_exit "macOS 12.0+ required (found: $os_version)"
    fi
    
    print_status "success" "macOS $os_version detected"
    
    # Check for required tools
    local missing_tools=()
    
    command -v curl >/dev/null || missing_tools+=("curl")
    command -v python3 >/dev/null || missing_tools+=("python3")
    
    if [[ ${#missing_tools[@]} -gt 0 ]]; then
        error_exit "Required tools missing: ${missing_tools[*]}"
    fi
    
    print_status "success" "All dependencies verified"
}

check_permissions() {
    print_status "info" "Checking installation permissions..."
    
    if [[ ! -w "$INSTALL_DIR" ]] && ! sudo -n true 2>/dev/null; then
        print_status "warning" "Installation requires admin privileges"
        printf "\n${YELLOW}MacSpeed will be installed to ${BOLD}$INSTALL_DIR${RESET}${YELLOW} which requires admin access.${RESET}\n"
        printf "${YELLOW}You may be prompted for your password.${RESET}\n\n"
        
        if ! sudo -v; then
            error_exit "Admin privileges required for installation"
        fi
    fi
    
    print_status "success" "Installation permissions verified"
}

download_script() {
    print_status "info" "Downloading MacSpeed..."
    
    # Create temporary directory
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR"
    
    # Download the script
    if ! curl -fsSL "$REPO_URL/$SCRIPT_NAME" -o "$SCRIPT_NAME"; then
        error_exit "Failed to download MacSpeed script"
    fi
    
    # Verify download
    if [[ ! -f "$SCRIPT_NAME" ]] || [[ ! -s "$SCRIPT_NAME" ]]; then
        error_exit "Downloaded script is empty or missing"
    fi
    
    # Verify it's a shell script
    if ! head -1 "$SCRIPT_NAME" | grep -q "^#!/"; then
        error_exit "Downloaded file is not a valid shell script"
    fi
    
    print_status "success" "MacSpeed downloaded successfully"
}

install_script() {
    print_status "info" "Installing MacSpeed..."
    
    # Make script executable
    chmod +x "$SCRIPT_NAME"
    
    # Install to system directory
    if [[ -w "$INSTALL_DIR" ]]; then
        cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    else
        sudo cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    fi
    
    # Verify installation
    if [[ ! -x "$INSTALL_DIR/$SCRIPT_NAME" ]]; then
        error_exit "Installation failed - script not executable"
    fi
    
    print_status "success" "MacSpeed installed to $INSTALL_DIR/$SCRIPT_NAME"
}

cleanup() {
    print_status "info" "Cleaning up temporary files..."
    
    if [[ -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
        print_status "success" "Cleanup completed"
    fi
}

show_completion() {
    printf "\n${GREEN}${BOLD}"
    printf "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n"
    printf "┃                                                                          ┃\n"
    printf "┃                         Installation Complete!                          ┃\n"
    printf "┃                                                                          ┃\n"
    printf "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"
    printf "${RESET}\n"
    
    printf "${BLUE}${BOLD}Quick Start:${RESET}\n\n"
    printf "  ${GREEN}macspeed${RESET}                    # Interactive mode with menu\n"
    printf "  ${GREEN}macspeed --essential${RESET}        # Quick safe optimization\n"
    printf "  ${GREEN}macspeed --status${RESET}           # Check current state\n"
    printf "  ${GREEN}macspeed --help${RESET}             # Show all options\n\n"
    
    printf "${BLUE}${BOLD}Optimization Levels:${RESET}\n\n"
    printf "  ${GREEN}Essential${RESET}        Safe performance optimizations (recommended)\n"
    printf "  ${BLUE}Comprehensive${RESET}    Essential + services and privacy controls\n"
    printf "  ${YELLOW}Maximum${RESET}          Complete system optimization with backup\n\n"
    
    printf "${DIM}For more information: https://github.com/mattmarden/macspeed1${RESET}\n\n"
}

# Main installation process
main() {
    print_header
    
    # System verification
    verify_system
    
    # Permission check
    check_permissions
    
    # Download
    download_script
    
    # Install
    install_script
    
    # Cleanup
    cleanup
    
    # Show completion
    show_completion
}

# Trap cleanup on exit
trap cleanup EXIT

# Run installation
main "$@"