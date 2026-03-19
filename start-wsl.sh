#!/bin/bash
# WSL2用起動スクリプト（日本語入力対応）

# fcitx5をX11モードで起動（既に起動中なら何もしない）
if ! pgrep -x fcitx5 > /dev/null; then
    WAYLAND_DISPLAY= fcitx5 -d 2>/dev/null
    echo "fcitx5を起動しました（日本語入力: 変換キー or Ctrl+Space）"
fi

# アプリ起動
cd "$(dirname "$0")/app"
npm run dev:all
