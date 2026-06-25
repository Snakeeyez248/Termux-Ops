#!/data/data/com.termux/files/usr/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

chmod +x $BASE_DIR/lib/common.sh
chmod +x $BASE_DIR/lib/detect.sh
chmod +x $BASE_DIR/lib/packages.sh
chmod +x $BASE_DIR/lib/backup.sh
chmod +x $BASE_DIR/lib/restore.sh
chmod +x $BASE_DIR/lib/doctor.sh
chmod +x $BASE_DIR/lib/profile.sh
chmod +x $BASE_DIR/lib/installer.sh
chmod +x $BASE_DIR/modules/help.sh
chmod +x $BASE_DIR/modules/commands.sh
chmod +x $BASE_DIR/modules/navigation.sh


source "$BASE_DIR/lib/common.sh"
source "$BASE_DIR/lib/detect.sh"
source "$BASE_DIR/lib/packages.sh"
source "$BASE_DIR/lib/backup.sh"
source "$BASE_DIR/lib/restore.sh"
source "$BASE_DIR/lib/doctor.sh"
source "$BASE_DIR/lib/profile.sh"
source "$BASE_DIR/lib/installer.sh"

case "$1" in

install)

msg_section "Termux-Ops Installation"

create_backup

generate_profile_conf

generate_device_conf

source "$HOME/.config/termux-ops/device.conf"

source "$HOME/.config/termux-ops/profile.conf"

msg_section "Device Detected"

echo "User         : $DISPLAY_NAME"
echo "Device       : $DEVICE_MODEL"
echo "Android      : $ANDROID_VERSION"
echo "Architecture : $ARCHITECTURE"
if [ "$ROOT_AVAILABLE" = "yes" ]
then
    ROOT_STATUS="Available"
else
    ROOT_STATUS="Not Available"
fi

echo "Root         : $ROOT_STATUS"

msg_section "Updating Repositories"

pkg update -y >/dev/null 2>&1
pkg upgrade -y >/dev/null 2>&1

msg_ok "Repositories Ready"

install_category \
"Core Packages" \
"${CORE_PACKAGES[@]}"

install_category \
"Development Packages" \
"${DEV_PACKAGES[@]}"

install_category \
"Network Packages" \
"${NETWORK_PACKAGES[@]}"

install_category \
"Terminal Packages" \
"${TERMINAL_PACKAGES[@]}"

install_category \
"Monitoring Packages" \
"${MONITOR_PACKAGES[@]}"

install_category \
"Archive Packages" \
"${ARCHIVE_PACKAGES[@]}"

install_category \
"Extra Packages" \
"${EXTRA_PACKAGES[@]}"

install_category \
"Legacy Packages" \
"${LEGACY_PACKAGES[@]}"

msg_section "Package Report"

echo "Already Present : $TOTAL_PRESENT"
echo "New Installed   : $TOTAL_INSTALLED"
echo "Failed          : $TOTAL_FAILED"

if [ -n "$FAILED_PACKAGES" ]
then
    echo
    echo "Unavailable Packages:"
    for PKG in $FAILED_PACKAGES
    do
        echo "  • $PKG"
    done
fi

echo

install_shell_files

install_config_files

validate_installation

msg_section "Installation Report"

msg_ok "Termux-Ops Part 1.1 Complete"

msg_section "Activating Environment"

source "$HOME/.bashrc" 2>/dev/null

msg_ok "Environment Loaded"

;;

backup)

create_backup
;;

uninstall)

restore_latest_backup
;;

doctor)

doctor_check
;;

update)

msg_info "Update feature will be implemented in Part 2"
;;

*)

echo
echo "Termux-Ops"
echo
echo "Usage:"
echo "./setup.sh install"
echo "./setup.sh backup"
echo "./setup.sh uninstall"
echo "./setup.sh doctor"
echo "./setup.sh update"
echo

;;

esac