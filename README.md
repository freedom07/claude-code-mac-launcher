# Claude Code Mac Launcher

Mac에서 글로벌 단축키로 Claude Code를 실행할 수 있게 해주는 Raycast 스크립트입니다.

## Features

- **글로벌 단축키**: Mac 어디서나 단축키로 Claude Code 실행
- **새 대화 / 이어하기**: 두 가지 모드 지원
- **프롬프트 입력**: 단축키 입력 후 바로 프롬프트 전달 가능

## Requirements

- macOS
- [Raycast](https://raycast.com/) (설치 스크립트가 자동 설치)
- [iTerm2](https://iterm2.com/) (기본 터미널)
- [Claude Code](https://claude.ai/claude-code) CLI

## Installation

### Option 1: Git Clone

```bash
git clone https://github.com/freedom07/claude-code-mac-launcher.git
cd claude-code-mac-launcher
./install.sh
```

### Option 2: One-liner

```bash
curl -fsSL https://raw.githubusercontent.com/freedom07/claude-code-mac-launcher/main/install.sh | bash
```

## Setup Hotkeys

설치 후 Raycast에서 단축키를 설정해야 합니다:

1. Raycast 실행 (`Option + Space`)
2. "Extensions" 검색 → Extensions 열기
3. 좌측 하단 "+" → "Add Script Directory"
4. `~/.config/raycast/scripts` 선택
5. "Claude Code" 검색
6. 각 명령어에 단축키 설정 (`Cmd + K` → Configure Command):

| Command | Recommended Hotkey |
|---------|-------------------|
| Claude Code (New) | `Option + Cmd + Enter` |
| Claude Code (Continue) | `Option + Cmd + \` |

## Usage

### New Conversation
`Option + Cmd + Enter` → (선택) 프롬프트 입력 → Enter

### Continue Previous Conversation
`Option + Cmd + \` → (선택) 프롬프트 입력 → Enter

## Configuration

`config.sh`에서 설정을 변경할 수 있습니다:

```bash
# Claude Code 작업 디렉토리
WORK_DIR="$HOME/.claude-code-sandbox"

# 터미널 앱
TERMINAL_APP="iTerm"
```

## Uninstall

```bash
./uninstall.sh
```

## File Structure

```
claude-code-mac-launcher/
├── README.md
├── install.sh
├── uninstall.sh
├── config.sh
└── scripts/
    ├── claude-code-new.sh
    └── claude-code-continue.sh
```

## License

MIT
