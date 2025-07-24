#!/bin/bash

# Get active window class (fallback to "None" if unavailable)
class=$(hyprctl activewindow -j | jq -r '.class // "None"')

# Define icons (requires Nerd Font)
case "$class" in
  "kitty")
    echo "  Terminal"
    ;;
  "firefox")
    echo "  Firefox"
    ;;
  "discord")
    echo "ﭮ  Discord"
    ;;
  "Steam")
    echo "  Steam"
    ;;
  "code" | "code-oss")
    echo "  VS Codium"
    ;;
  "chromium" | "google-chrome")
    echo "  Chrome"
    ;;
  "dolphin")
    echo "  Dolphin"
    ;;
  "vlc")
    echo "  VLC Player"  # nf-fa-file-video-o
    ;;
  "org.strawberrymusicplayer.strawberry")
    echo "🎵  Strawberry"  # nf-fa-file-video-o
    ;;
  "None")
    echo ""
    ;;
  *)
    echo "  $class"
    ;;
esac