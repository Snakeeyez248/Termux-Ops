#!/data/data/com.termux/files/usr/bin/bash

install_shell_files() {

msg_section "Installing Shell Environment"

cp -f \
"$BASE_DIR/assets/bash/.bashrc" \
"$HOME/"

cp -f \
"$BASE_DIR/assets/bash/.bash_aliases" \
"$HOME/"

cp -f \
"$BASE_DIR/assets/bash/.bash_functions" \
"$HOME/"

cp -f \
"$BASE_DIR/assets/bash/.bash_prompt" \
"$HOME/"

cp -f \
"$BASE_DIR/assets/bash/.bash_dashboard" \
"$HOME/"

cp -f \
"$BASE_DIR/assets/bash/.bash_help" \
"$HOME/"

mkdir -p \
"$HOME/.termux-ops/modules" \
"$HOME/.termux-ops/backups" \
"$HOME/.termux-ops/logs" \
"$HOME/.termux-ops/state" \
"$HOME/.termux-ops/modules" \
"$HOME/.termux-ops/lib" \
"$HOME/.termux-ops/backups" \
"$HOME/.termux-ops/logs" \
"$HOME/.termux-ops/state"

copy_if_needed() {

SRC="$1"
DST="$2"

if [ "$(realpath "$SRC")" != "$(realpath "$DST")" ]
then
    cp -f "$SRC" "$DST"
fi

}

cp -f \
"$BASE_DIR/modules/commands.sh" \
"$HOME/.termux-ops/modules/commands.sh"

cp -f \
"$BASE_DIR/modules/navigation.sh" \
"$HOME/.termux-ops/modules/navigation.sh"

cp -f \
"$BASE_DIR/modules/help.sh" \
"$HOME/.termux-ops/modules/help.sh"

cp -f \
"$BASE_DIR/lib/common.sh" \
"$HOME/.termux-ops/lib/common.sh"

cp -f \
"$BASE_DIR/lib/detect.sh" \
"$HOME/.termux-ops/lib/detect.sh"

cp -f \
"$BASE_DIR/lib/backup.sh" \
"$HOME/.termux-ops/lib/backup.sh"

cp -f \
"$BASE_DIR/lib/restore.sh" \
"$HOME/.termux-ops/lib/restore.sh"

cp -f \
"$BASE_DIR/lib/doctor.sh" \
"$HOME/.termux-ops/lib/doctor.sh"

cp -f \
"$BASE_DIR/lib/profile.sh" \
"$HOME/.termux-ops/lib/profile.sh"

cp -f \
"$BASE_DIR/lib/installer.sh" \
"$HOME/.termux-ops/lib/installer.sh"

msg_ok "Shell files installed"

}

install_config_files() {

msg_section "Installing Configuration"

mkdir -p "$HOME/.config/termux-ops"

cp -f \
"$BASE_DIR/assets/config/features.conf" \
"$HOME/.config/termux-ops/"

cp -f \
"$BASE_DIR/assets/config/state.conf" \
"$HOME/.config/termux-ops/"

msg_ok "Configuration installed"

}

validate_installation() {

msg_section "Validation"

FILES=(
"$HOME/.bashrc"
"$HOME/.bash_aliases"
"$HOME/.bash_functions"
"$HOME/.bash_prompt"
"$HOME/.bash_dashboard"
"$HOME/.bash_help"
"$HOME/.config/termux-ops/features.conf"
"$HOME/.config/termux-ops/state.conf"
"$HOME/.termux-ops/lib/common.sh"
"$HOME/.termux-ops/lib/detect.sh"
"$HOME/.termux-ops/lib/backup.sh"
"$HOME/.termux-ops/lib/restore.sh"
"$HOME/.termux-ops/lib/doctor.sh"
"$HOME/.termux-ops/lib/profile.sh"
"$HOME/.termux-ops/lib/installer.sh"
"$HOME/.termux-ops/modules/commands.sh"
"$HOME/.termux-ops/modules/navigation.sh"
"$HOME/.termux-ops/modules/help.sh"
)

DIRS=(
"$HOME/.termux-ops"
"$HOME/.termux-ops/modules"
"$HOME/.termux-ops/backups"
"$HOME/.termux-ops/logs"
"$HOME/.termux-ops/state"
"$HOME/.termux-ops/lib"
)

for DIR in "${DIRS[@]}"
do

if [ ! -d "$DIR" ]
then
    FAILED=1
    msg_error "$DIR"
fi

done

FAILED=0

for FILE in "${FILES[@]}"
do

if [ ! -e "$FILE" ]
then
    FAILED=1
    msg_error "$FILE"
fi

done

if [ "$FAILED" -eq 0 ]
then
    msg_ok "Installation validated"
fi

}
