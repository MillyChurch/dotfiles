#!/usr/bin/env bash
set -euo pipefail

DOT_FF="$HOME/.dotfiles/firefox"
FF_BASE=""

for dir in "$HOME/.config/mozilla/firefox" "$HOME/.mozilla/firefox" "$HOME/snap/firefox/common/.mozilla/firefox" "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox"; do
  if [ -f "$dir/profiles.ini" ]; then
    FF_BASE="$dir"
    break
  fi
done

if [ -z "$FF_BASE" ]; then
  echo "Erro: profiles.ini não encontrado. Abra o Firefox uma vez antes de rodar o sync."
  exit 1
fi

PROFILE_REL=$(awk -F= '/^Default=.*\./ {print $2; exit}' "$FF_BASE/profiles.ini")
[ -z "$PROFILE_REL" ] && PROFILE_REL=$(awk -F= '/^Path=/ {print $2; exit}' "$FF_BASE/profiles.ini")
PROFILE_DIR="$FF_BASE/$PROFILE_REL"

case "${1:-}" in
  push)
    ln -sf "$DOT_FF/user.js" "$PROFILE_DIR/user.js"
    rm -rf "$PROFILE_DIR/chrome"
    ln -s "$DOT_FF/chrome" "$PROFILE_DIR/chrome"

    mkdir -p "$PROFILE_DIR/extensions"
    cp -n "$DOT_FF/extensions/"*.xpi "$PROFILE_DIR/extensions/" 2>/dev/null || true

    echo "Configurações do Firefox aplicadas em: $PROFILE_DIR"
    echo "Reinicie o Firefox para carregar o tema e as preferências."
    ;;

  pull)
    grep -E 'user_pref\("(extensions\.activeThemeID|browser\.theme\.|layout\.css\.prefers-color-scheme|browser\.uiCustomization\.state|browser\.uidensity|sidebar\.|toolkit\.legacyUserProfileCustomizations\.stylesheets)' \
      "$PROFILE_DIR/prefs.js" > "$DOT_FF/user.js"

    grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "$DOT_FF/user.js" \
      || echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$DOT_FF/user.js"

    mkdir -p "$DOT_FF/extensions"
    cp -u "$PROFILE_DIR/extensions/"*.xpi "$DOT_FF/extensions/" 2>/dev/null || true

    echo "Preferências e temas do Firefox salvos em: $DOT_FF"
    ;;

  *)
    echo "Uso: $0 {push|pull}"
    exit 1
    ;;
esac
