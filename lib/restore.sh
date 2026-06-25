#!/data/data/com.termux/files/usr/bin/bash

restore_latest_backup() {

BACKUP_ROOT="$HOME/.termux-ops/backups"

LATEST="$(ls -td "$BACKUP_ROOT"/* 2>/dev/null | head -1)"

if [ -z "$LATEST" ]
then
    msg_error "No backup found"
    return 1
fi

msg_info "Restoring backup"

cp -f "$LATEST/.bashrc" "$HOME/" 2>/dev/null

cp -f "$LATEST/.bash_aliases" "$HOME/" 2>/dev/null

cp -f "$LATEST/.bash_functions" "$HOME/" 2>/dev/null

cp -f "$LATEST/.bash_prompt" "$HOME/" 2>/dev/null

cp -f "$LATEST/.bash_dashboard" "$HOME/" 2>/dev/null

cp -f "$LATEST/.bash_help" "$HOME/" 2>/dev/null

if [ -d "$LATEST/termux-ops" ]
then
    cp -rf \
    "$LATEST/termux-ops" \
    "$HOME/.config/"
fi

if [ -d "$LATEST/modules" ]
then
    cp -rf "$LATEST/modules" "$HOME/.termux-ops/"
fi

if [ -d "$LATEST/.termux" ]
then
    cp -rf "$LATEST/.termux" "$HOME/"
fi

msg_ok "Restore completed"

}