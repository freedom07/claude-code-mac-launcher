#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Claude Code (Continue)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔄
# @raycast.argument1 { "type": "text", "placeholder": "프롬프트 (선택사항)", "optional": true }
# @raycast.packageName Claude Code

# Documentation:
# @raycast.description 이전 대화 이어하기
# @raycast.author claude-code-mac-launcher

WORK_DIR="$HOME/.claude-code-sandbox"

# 작업 디렉토리가 없으면 생성
mkdir -p "$WORK_DIR"

if [ -n "$1" ]; then
    osascript <<EOF
tell application "iTerm"
    activate
    create window with default profile
    tell current session of current window
        write text "cd '$WORK_DIR' && claude --dangerously-skip-permissions --continue \"$1\""
    end tell
end tell
EOF
else
    osascript <<EOF
tell application "iTerm"
    activate
    create window with default profile
    tell current session of current window
        write text "cd '$WORK_DIR' && claude --dangerously-skip-permissions --continue"
    end tell
end tell
EOF
fi
