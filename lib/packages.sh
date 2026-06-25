#!/data/data/com.termux/files/usr/bin/bash

CORE_PACKAGES=(
bash
coreutils
curl
wget
git
nano
jq
openssl
)

DEV_PACKAGES=(
python
php
clang
ruby
)

NETWORK_PACKAGES=(
dnsutils
nmap
openssh
)

TERMINAL_PACKAGES=(
tree
eza
bat
ripgrep
fzf
tmux
)

MONITOR_PACKAGES=(
htop
btop
)

ARCHIVE_PACKAGES=(
zip
unzip
7zip
rsync
)

EXTRA_PACKAGES=(
w3m
)

LEGACY_PACKAGES=(
python2
)

TOTAL_PRESENT=0
TOTAL_INSTALLED=0
TOTAL_FAILED=0

FAILED_PACKAGES=""

install_package() {

PKG="$1"

if dpkg -s "$PKG" >/dev/null 2>&1
then
    TOTAL_PRESENT=$((TOTAL_PRESENT+1))
    return 0
fi

if pkg install -y "$PKG" >/dev/null 2>&1
then
    TOTAL_INSTALLED=$((TOTAL_INSTALLED+1))
    return 0
fi

TOTAL_FAILED=$((TOTAL_FAILED+1))

FAILED_PACKAGES="$FAILED_PACKAGES $PKG"

return 1

}

install_category() {

CATEGORY="$1"
shift

COUNT_TOTAL=$#
COUNT_PRESENT=0
COUNT_INSTALLED=0
COUNT_FAILED=0

msg_section "$CATEGORY"

for PKG in "$@"
do

BEFORE_PRESENT="$TOTAL_PRESENT"
BEFORE_INSTALLED="$TOTAL_INSTALLED"
BEFORE_FAILED="$TOTAL_FAILED"

install_package "$PKG"

if [ "$TOTAL_PRESENT" -gt "$BEFORE_PRESENT" ]
then
    COUNT_PRESENT=$((COUNT_PRESENT+1))
fi

if [ "$TOTAL_INSTALLED" -gt "$BEFORE_INSTALLED" ]
then
    COUNT_INSTALLED=$((COUNT_INSTALLED+1))
fi

if [ "$TOTAL_FAILED" -gt "$BEFORE_FAILED" ]
then
    COUNT_FAILED=$((COUNT_FAILED+1))
fi

done

echo "Present   : $COUNT_PRESENT"
echo "Installed : $COUNT_INSTALLED"
echo "Failed    : $COUNT_FAILED"
echo "Total     : $COUNT_TOTAL"

}