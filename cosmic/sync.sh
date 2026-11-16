#!/usr/bin/env bash
set -euo pipefail

SRC="$HOME/.config/cosmic"
DEST="$HOME/.dotfiles/cosmic/config"

TARGETS=(
    # Core & Compositor
    "com.system76.CosmicComp"
    "com.system76.CosmicIdle"
    "com.system76.CosmicNotifications"
    "com.system76.CosmicPortal"
    "com.system76.CosmicSettings"
    "com.system76.CosmicSettingsDaemon"
    "com.system76.CosmicSettings.Shortcuts"
    "com.system76.CosmicSettings.Wallpaper"
    "com.system76.CosmicSettings.WindowRules"

    # Painel, Dock e Applets Nativos
    "com.system76.CosmicAppList"
    "com.system76.CosmicAppletAudio"
    "com.system76.CosmicAppletTime"
    "com.system76.CosmicAudio"
    "com.system76.CosmicPanel"
    "com.system76.CosmicPanelButton"
    "com.system76.CosmicPanel.Dock"
    "com.system76.CosmicPanel.Panel"

    # Temas, Aparência e Wallpaper
    "com.system76.CosmicBackground"
    "com.system76.CosmicTheme.Dark"
    "com.system76.CosmicTheme.Dark.Builder"
    "com.system76.CosmicTheme.Light"
    "com.system76.CosmicTheme.Light.Builder"
    "com.system76.CosmicTheme.Mode"
    "com.system76.CosmicTk"

    # Apps Nativos
    "com.system76.CosmicFiles"
    "com.system76.CosmicTerm"

    # Seus Applets & Tweaks Externos
    "dev.cappsy.CosmicExtAppletLogoMenu"
    "dev.edfloreshz.CosmicTweaks"
    "dev.edfloreshz.CosmicTweaks.ColorScheme"
    "io.github.cosmic_utils.cosmic-ext-applet-clipboard-manager"
    "io.github.cosmic-utils.cosmic-ext-applet-sysinfo"
    "io.github.cosmic_utils.minimon-applet-panel"
    "io.github.crocodile.cosmic-ext-applet-workspace-icons"
)

case "${1:-}" in
    pull)
        mkdir -p "$DEST"
        for item in "${TARGETS[@]}"; do
            if [ -d "$SRC/$item" ]; then
                rsync -a --delete --exclude='*.tmp' --exclude='.tmp*' "$SRC/$item/" "$DEST/$item/"
            fi
        done
        echo "Configs do COSMIC copiadas para ~/.dotfiles/cosmic/config"
        ;;
    push)
        for item in "${TARGETS[@]}"; do
            if [ -d "$DEST/$item" ]; then
                mkdir -p "$SRC/$item"
                rsync -a --delete "$DEST/$item/" "$SRC/$item/"
            fi
        done
        echo "Configs do COSMIC aplicadas em ~/.config/cosmic"
        ;;
    *)
        echo "Uso: $0 {pull|push}"
        exit 1
        ;;
esac
