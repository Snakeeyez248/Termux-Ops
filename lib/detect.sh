#!/data/data/com.termux/files/usr/bin/bash

generate_device_conf() {

CONFIG_DIR="$HOME/.config/termux-ops"

mkdir -p "$CONFIG_DIR"

USER_NAME="$(whoami)"

MARKET_NAME="$(getprop ro.product.marketname 2>/dev/null)"

MODEL="$(getprop ro.product.model 2>/dev/null)"

SYSTEM_MODEL="$(getprop ro.product.system.model 2>/dev/null)"

if [ -n "$MARKET_NAME" ]
then
    DEVICE_NAME="$(printf '%s' "$MARKET_NAME" | tr -d '\r')"
elif [ -n "$MODEL" ]
then
    DEVICE_NAME="$MODEL"
else
    DEVICE_NAME="$SYSTEM_MODEL"
fi

MANUFACTURER="$(getprop ro.product.manufacturer 2>/dev/null)"

CODENAME="$(getprop ro.product.device 2>/dev/null)"

ANDROID_VERSION="$(getprop ro.build.version.release 2>/dev/null)"

ANDROID_SDK="$(getprop ro.build.version.sdk 2>/dev/null)"

ARCH="$(uname -m)"

CORES="$(grep -c '^processor' /proc/cpuinfo)"

if command -v su >/dev/null 2>&1
then
    ROOT_AVAILABLE="yes"
else
    ROOT_AVAILABLE="no"
fi

cat > "$CONFIG_DIR/device.conf" <<EOF
TERMUX_OPS_VERSION="1.0.0"

TERMUX_USER="$USER_NAME"

DEVICE_MODEL="$DEVICE_NAME"
DEVICE_MANUFACTURER="$MANUFACTURER"
DEVICE_CODENAME="$CODENAME"

ANDROID_VERSION="$ANDROID_VERSION"
ANDROID_SDK="$ANDROID_SDK"

ARCHITECTURE="$ARCH"
CPU_CORES="$CORES"

ROOT_AVAILABLE="$ROOT_AVAILABLE"

INSTALL_DATE="$(date +%F)"
INSTALL_TIME="$(date +%T)"
EOF

}
