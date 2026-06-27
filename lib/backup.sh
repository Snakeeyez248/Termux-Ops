#!/data/data/com.termux/files/usr/bin/bash

create_backup() {

BACKUP_ROOT="$HOME/.termux-ops/backups"

STAMP="$(date +"%Y-%m-%d_%H-%M-%S")"

BACKUP_DIR="$BACKUP_ROOT/$STAMP"

mkdir -p "$BACKUP_DIR"

msg_info "Creating backup"

cp -f "$HOME/.bashrc" "$BACKUP_DIR/" 2>/dev/null

cp -f "$HOME/.bash_aliases" "$BACKUP_DIR/" 2>/dev/null

cp -f "$HOME/.bash_functions" "$BACKUP_DIR/" 2>/dev/null

cp -f "$HOME/.bash_prompt" "$BACKUP_DIR/" 2>/dev/null

cp -f "$HOME/.bash_dashboard" "$BACKUP_DIR/" 2>/dev/null

cp -f "$HOME/.bash_help" "$BACKUP_DIR/" 2>/dev/null

cp -rf "$HOME/.config/termux-ops" "$BACKUP_DIR/" 2>/dev/null

cp -rf "$HOME/.termux-ops/modules" "$BACKUP_DIR/" 2>/dev/null

cp -rf "$HOME/.termux-ops/modules" "$BACKUP_DIR/" 2>/dev/null

cp -rf "$HOME/.termux-ops/lib" "$BACKUP_DIR/" 2>/dev/null

msg_ok "Backup stored in"

echo "$BACKUP_DIR"

}