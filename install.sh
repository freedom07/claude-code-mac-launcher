#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REPO_URL="https://github.com/freedom07/claude-code-mac-launcher.git"
INSTALL_DIR="$HOME/.claude-code-mac-launcher"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Claude Code Mac Launcher - Install   ${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if running via curl (no local files)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" 2>/dev/null)" && pwd 2>/dev/null)" || SCRIPT_DIR=""

if [ -z "$SCRIPT_DIR" ] || [ ! -f "$SCRIPT_DIR/config.sh" ]; then
    echo -e "${YELLOW}Downloading from GitHub...${NC}"

    # Clone or update repo
    if [ -d "$INSTALL_DIR" ]; then
        cd "$INSTALL_DIR"
        git pull --quiet
    else
        git clone --quiet "$REPO_URL" "$INSTALL_DIR"
        cd "$INSTALL_DIR"
    fi

    # Run install from cloned repo
    exec "$INSTALL_DIR/install.sh"
fi

# Load config
source "$SCRIPT_DIR/config.sh"

# 1. Check if Homebrew is installed
echo -e "${YELLOW}[1/5]${NC} Checking Homebrew..."
if ! command -v brew &> /dev/null; then
    echo -e "${RED}Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo -e "${GREEN}✓ Homebrew installed${NC}"

# 2. Check if Raycast is installed
echo -e "${YELLOW}[2/5]${NC} Checking Raycast..."
if ! [ -d "/Applications/Raycast.app" ]; then
    echo -e "${YELLOW}Raycast not found. Installing via Homebrew...${NC}"
    brew install --cask raycast
    echo -e "${GREEN}✓ Raycast installed${NC}"
    echo -e "${YELLOW}Please launch Raycast and complete initial setup, then run this script again.${NC}"
    open -a Raycast
    exit 0
fi
echo -e "${GREEN}✓ Raycast installed${NC}"

# 3. Create Raycast scripts directory
echo -e "${YELLOW}[3/5]${NC} Creating Raycast scripts directory..."
mkdir -p "$RAYCAST_SCRIPTS_DIR"
echo -e "${GREEN}✓ Created $RAYCAST_SCRIPTS_DIR${NC}"

# 4. Copy scripts and set permissions
echo -e "${YELLOW}[4/5]${NC} Installing scripts..."
cp "$SCRIPT_DIR/scripts/claude-code-new.sh" "$RAYCAST_SCRIPTS_DIR/"
cp "$SCRIPT_DIR/scripts/claude-code-continue.sh" "$RAYCAST_SCRIPTS_DIR/"
chmod +x "$RAYCAST_SCRIPTS_DIR/claude-code-new.sh"
chmod +x "$RAYCAST_SCRIPTS_DIR/claude-code-continue.sh"
echo -e "${GREEN}✓ Scripts installed${NC}"

# 5. Create work directory
echo -e "${YELLOW}[5/5]${NC} Creating work directory..."
mkdir -p "$WORK_DIR"
echo -e "${GREEN}✓ Created $WORK_DIR${NC}"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Installation Complete!               ${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo ""
echo "1. Open Raycast (⌥ + Space)"
echo "2. Type 'Extensions' and open Extensions settings"
echo "3. Click '+' at bottom left → 'Add Script Directory'"
echo "4. Select: $RAYCAST_SCRIPTS_DIR"
echo "5. Search 'Claude Code' in Raycast"
echo "6. Set hotkeys (⌘ + K → Configure Command):"
echo "   - Claude Code (New):      ⌥+⌘+Enter"
echo "   - Claude Code (Continue): ⌥+⌘+\\"
echo ""
echo -e "${YELLOW}Work directory: $WORK_DIR${NC}"
echo ""
