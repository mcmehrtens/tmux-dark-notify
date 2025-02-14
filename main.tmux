#!/usr/bin/env bash
# Entry point for this plugin. This is loaded possibly multiple times on tmux start or session restore. Outsource handling of multiple running instances to the runner. This script just starts the runner in the background.

set -o errexit
set -o pipefail

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_SETTER="${CURRENT_DIR}/scripts/tmux-theme-mode.sh"
RUNNER="${CURRENT_DIR}/scripts/tmux-dark-notify-runner.sh"

$THEME_SETTER -n "$(dark-notify -e)"
$RUNNER &
