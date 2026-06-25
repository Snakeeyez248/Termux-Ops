#!/data/data/com.termux/files/usr/bin/bash

FEATURES="$HOME/.config/termux-ops/features.conf"

[ -f "$FEATURES" ] || return

source "$FEATURES"

[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

[ -f "$HOME/.bash_functions" ] && source "$HOME/.bash_functions"

[ -f "$HOME/.termux-ops/modules/commands.sh" ] && source "$HOME/.termux-ops/modules/commands.sh"

[ -f "$HOME/.termux-ops/modules/navigation.sh" ] && source "$HOME/.termux-ops/modules/navigation.sh"

[ -f "$HOME/.termux-ops/modules/help.sh" ] && source "$HOME/.termux-ops/modules/help.sh"

[ -f "$HOME/.bash_help" ] && source "$HOME/.bash_help"

[ -f "$HOME/.bash_dashboard" ] && source "$HOME/.bash_dashboard"

[ -f "$HOME/.bash_prompt" ] && source "$HOME/.bash_prompt"

if [ "$DASHBOARD_ENABLED" = "yes" ] && [ -z "$TERMUX_OPS_RELOAD" ]
then
    show_dashboard
fi

if [ "$PROMPT_ENABLED" = "yes" ]
then
    set_prompt
fi
