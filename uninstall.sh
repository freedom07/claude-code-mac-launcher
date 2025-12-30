#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Claude Code Mac Launcher - Uninstall ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load config
source "$SCRIPT_DIR/config.sh"

# 1. Remove scripts from Raycast directory
echo -e "${YELLOW}[1/2]${NC} Removing scripts..."
if [ -f "$RAYCAST_SCRIPTS_DIR/claude-code-new.sh" ]; then
    rm "$RAYCAST_SCRIPTS_DIR/claude-code-new.sh"
    echo -e "${GREEN}✓ Removed claude-code-new.sh${NC}"
fi

if [ -f "$RAYCAST_SCRIPTS_DIR/claude-code-continue.sh" ]; then
    rm "$RAYCAST_SCRIPTS_DIR/claude-code-continue.sh"
    echo -e "${GREEN}✓ Removed claude-code-continue.sh${NC}"
fi

# 2. Ask about work directory
echo ""
echo -e "${YELLOW}[2/2]${NC} Work directory: $WORK_DIR"
read -p "Do you want to remove the work directory? (y/N): " remove_work_dir

if [[ "$remove_work_dir" =~ ^[Yy]$ ]]; then
    if [ -d "$WORK_DIR" ]; then
        rm -rf "$WORK_DIR"
        echo -e "${GREEN}✓ Removed work directory${NC}"
    fi
else
    echo -e "${YELLOW}Work directory kept${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Uninstallation Complete!             ${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}Note: Raycast hotkeys need to be removed manually if configured.${NC}"
echo ""
