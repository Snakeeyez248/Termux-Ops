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
echo "Android      : $ANDROID_VERSION"
echo "Architecture : $ARCHITECTURE"

if [ "$ROOT_AVAILABLE" = "yes" ]
then
    echo "Root         : Available"
else
    echo "Root         : Not Available"
fi

echo

}

reloadops() {
export TERMUX_OPS_RELOAD=1
source ~/.bashrc
unset TERMUX_OPS_RELOAD
echo "✓ Environment Reloaded"
}

mkcd() {
mkdir -p "$1"
cd "$1"
}

extract() {

if [ -f "$1" ]
then

case "$1" in

*.zip) unzip "$1" ;;

*.tar.gz) tar -xzf "$1" ;;

*.tar.xz) tar -xJf "$1" ;;

*.7z) 7z x "$1" ;;

*) echo "Unsupported archive" ;;

esac

fi

}
