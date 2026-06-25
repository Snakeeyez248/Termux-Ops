#!/data/data/com.termux/files/usr/bin/bash

generate_profile_conf() {

CONFIG_DIR="$HOME/.config/termux-ops"

mkdir -p "$CONFIG_DIR"

PROFILE_FILE="$CONFIG_DIR/profile.conf"

if [ -f "$PROFILE_FILE" ]
then
    return 0
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "User Profile Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

while true
do
    read -p "Enter display name: " DISPLAY_NAME

    [ -z "$DISPLAY_NAME" ] && continue

    [ ${#DISPLAY_NAME} -lt 3 ] && {
        echo
        echo "Display name must be at least 3 characters."
        echo
        continue
    }

    break
done

cat > "$PROFILE_FILE" <<EOF
DISPLAY_NAME="$DISPLAY_NAME"
EOF

echo
echo "✓ Profile created"
echo

}
