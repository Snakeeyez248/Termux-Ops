#!/data/data/com.termux/files/usr/bin/bash

ops() {
cd "$HOME/.termux-ops"
}

opsdev() {

if [ -d "$HOME/Termux-Ops" ]
then
    cd "$HOME/Termux-Ops"
else
    echo
    echo "Development repository not found."
    echo
fi

}

conf() {
cd "$HOME/.config/termux-ops"
}

logs() {
cd "$HOME/.termux-ops/logs"
}

proj() {
mkdir -p "$HOME/Projects"
cd "$HOME/Projects"
}

