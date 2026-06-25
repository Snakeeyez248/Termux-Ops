#!/data/data/com.termux/files/usr/bin/bash

set +e

msg_section() {
    echo
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "$1"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

msg_info() {
    printf "➜ %s\n" "$1"
}

msg_ok() {
    printf "✓ %s\n" "$1"
}

msg_warn() {
    printf "⚠ %s\n" "$1"
}

msg_error() {
    printf "✗ %s\n" "$1"
}

timestamp() {
    date +"%Y-%m-%d_%H-%M-%S"
}