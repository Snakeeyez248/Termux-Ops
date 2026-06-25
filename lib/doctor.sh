#!/data/data/com.termux/files/usr/bin/bash

doctor_check() {

echo
echo "Termux-Ops Doctor"
echo

FILES=(
"$HOME/.config/termux-ops/device.conf"
"$HOME/.bashrc"
"$HOME/.termux/colors.properties"
"$HOME/.termux/termux.properties"
)

for FILE in "${FILES[@]}"
do

if [ -e "$FILE" ]
then
    echo "[ OK ] $FILE"
else
    echo "[FAIL] $FILE"
fi

done

}