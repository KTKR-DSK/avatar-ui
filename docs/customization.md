# アバター画像・名前のカスタマイズガイド

## 概要

avatar-uiのアバター画像とアバター名を差し替える方法。

---

## 1. アバター画像の差し替え

### 対象ファイル

| ファイル | 用途 |
|----------|------|
| `app/src/renderer/assets/idle.png` | 待機状態 |
| `app/src/renderer/assets/talk.png` | 発話状態（リップシンク用） |

### 画像仕様

| 項目 | 推奨値 |
|------|--------|
| フォーマット | PNG |
| 解像度 | 1024×1024 px（正方形推奨） |
| 表示サイズ | 140×140 px（CSSで縮小表示） |

**注意:** 画像は正方形で用意。長方形の場合は`object-fit: cover`により中央部分が切り出される。

### 差し替え手順

```bash
# 既存ファイルをバックアップ
cp app/src/renderer/assets/idle.png app/src/renderer/assets/idle.png.bak
cp app/src/renderer/assets/talk.png app/src/renderer/assets/talk.png.bak

# 新しい画像を配置（同名で上書き）
cp /path/to/your-idle.png app/src/renderer/assets/idle.png
cp /path/to/your-talk.png app/src/renderer/assets/talk.png
```

---

## 2. アバター名の変更

### 設定ファイル

`settings.json5` の `ui.nameTags` セクションを編集:

```json5
"nameTags": {
  "user": "USER",           // ユーザー表示名
  "avatar": "SPECTRA",      // アバター表示名（UIラベル）
  "avatarFullName": "Spectra Communicator",  // 起動バナー用フルネーム
}
```

### 使用箇所

| 設定キー | 表示箇所 |
|----------|----------|
| `avatar` | アバター画像下のラベル、チャットログ |
| `avatarFullName` | 起動時バナー「SYSTEM {avatarFullName} Online」 |

---

## 3. 関連するUI設定（任意）

`settings.json5` で調整可能:

| 設定キー | 説明 | デフォルト |
|----------|------|------------|
| `ui.avatarOverlayOpacity` | テーマ色オーバーレイ濃度 | 1.0 |
| `ui.avatarBrightness` | 画像の明るさ | 1.5 |
| `ui.mouthInterval` | リップシンク間隔(ms) | 120 |

---

## 検証方法

1. アプリを起動: `./start-wsl.sh` または `npm run dev:all`
2. アバター画像が新しいものに変わっていることを確認
3. アバター名ラベルが変更されていることを確認
4. メッセージ送信時にリップシンク（idle↔talk切り替え）が動作することを確認
