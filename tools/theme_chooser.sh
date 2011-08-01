#!/bin/sh

# Zsh Theme Chooser by fox (fox91 at anche dot no)
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

THEMES_DIR="$ZSH/themes"
FAVLIST="${HOME}/.zsh_favlist"

function noyes() {
    read -p "$1 [y/N] " a
    if [[ $a == "N" || $a == "n" || $a = "" ]]; then
        return 0
    fi
    return 1
}

function theme_preview() {
    THEME=$1
    THEME_NAME=`echo $THEME | sed s/\.zsh-theme//`
    export ZDOTDIR="$(mktemp -d tmp.zshXXXX)"

cat <<-EOF >"$ZDOTDIR/.zshrc"
    ZSH_THEME="$THEME_NAME"
    source $ZSH/oh-my-zsh.sh
EOF
    zsh
    rm -rf "$ZDOTDIR"

    echo
    noyes "Do you want to add it to your favourite list ($FAVLIST)?" || \
          echo $THEME_NAME >> $FAVLIST
    echo
}

echo
echo "[0;1;35;95m╺━[0;1;31;91m┓┏[0;1;33;93m━┓[0;1;32;92m╻[0m [0;1;36;96m╻[0m   [0;1;35;95m╺┳[0;1;31;91m╸╻[0m [0;1;33;93m╻[0;1;32;92m┏━[0;1;36;96m╸┏[0;1;34;94m┳┓[0;1;35;95m┏━[0;1;31;91m╸[0m   [0;1;32;92m┏━[0;1;36;96m╸╻[0m [0;1;34;94m╻[0;1;35;95m┏━[0;1;31;91m┓┏[0;1;33;93m━┓[0;1;32;92m┏━[0;1;36;96m┓┏[0;1;34;94m━╸[0;1;35;95m┏━[0;1;31;91m┓[0m"
echo "[0;1;31;91m┏━[0;1;33;93m┛┗[0;1;32;92m━┓[0;1;36;96m┣━[0;1;34;94m┫[0m    [0;1;31;91m┃[0m [0;1;33;93m┣[0;1;32;92m━┫[0;1;36;96m┣╸[0m [0;1;34;94m┃[0;1;35;95m┃┃[0;1;31;91m┣╸[0m    [0;1;36;96m┃[0m  [0;1;34;94m┣[0;1;35;95m━┫[0;1;31;91m┃[0m [0;1;33;93m┃┃[0m [0;1;32;92m┃[0;1;36;96m┗━[0;1;34;94m┓┣[0;1;35;95m╸[0m [0;1;31;91m┣┳[0;1;33;93m┛[0m"
echo "[0;1;33;93m┗━[0;1;32;92m╸┗[0;1;36;96m━┛[0;1;34;94m╹[0m [0;1;35;95m╹[0m    [0;1;33;93m╹[0m [0;1;32;92m╹[0m [0;1;36;96m╹[0;1;34;94m┗━[0;1;35;95m╸╹[0m [0;1;31;91m╹[0;1;33;93m┗━[0;1;32;92m╸[0m   [0;1;34;94m┗━[0;1;35;95m╸╹[0m [0;1;31;91m╹[0;1;33;93m┗━[0;1;32;92m┛┗[0;1;36;96m━┛[0;1;34;94m┗━[0;1;35;95m┛┗[0;1;31;91m━╸[0;1;33;93m╹┗[0;1;32;92m╸[0m"
echo

for i in $(ls $THEMES_DIR); do
    echo "Now showing theme $i"
    theme_preview $i
done
