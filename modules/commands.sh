#!/data/data/com.termux/files/usr/bin/bash

opsinfo() {

source "$HOME/.config/termux-ops/device.conf"
source "$HOME/.config/termux-ops/profile.conf"

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Termux-Ops Information"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

echo "User         : $DISPLAY_NAME"
echo "Device       : $DEVICE_MODEL"
echo "Manufacturer : $DEVICE_MANUFACTURER"
echo "Codename     : $DEVICE_CODENAME"

echo "Android      : $ANDROID_VERSION"
echo "SDK          : $ANDROID_SDK"

echo "Architecture : $ARCHITECTURE"
echo "CPU Cores    : $CPU_CORES"

if [ "$ROOT_AVAILABLE" = "yes" ]
then
    echo "Root         : Available"
else
    echo "Root         : Not Available"
fi

echo

}
opsdoctor() {

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Termux-Ops Doctor"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

printf "%-25s" "Internet"

if ping -c 1 8.8.8.8 >/dev/null 2>&1
then
    echo "✓ OK"
else
    echo "✗ FAIL"
fi

printf "%-25s" "Storage Permission"

if [ -d "$HOME/storage" ]
then
    echo "✓ OK"
else
    echo "✗ Missing"
fi

printf "%-25s" "Root"

if command -v su >/dev/null 2>&1
then
    echo "✓ Available"
else
    echo "✗ Not Found"
fi

printf "%-25s" "Git"

command -v git >/dev/null && echo "✓ Installed" || echo "✗ Missing"

printf "%-25s" "Python"

command -v python >/dev/null && echo "✓ Installed" || echo "✗ Missing"

echo
}

opsbackup() {
create_backup
}

opsrestore() {
restore_latest_backup
}


opsdashboard() {
show_dashboard
}

opsupdate() {

echo
echo "Future GitHub updater"
echo
}