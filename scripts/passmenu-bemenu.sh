#!/usr/bin/env bash

# https://github.com/alpacathunder1/passmenu-rofi-wayland

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | bemenu --fn 'Iosevka Term NFP' -m '-1' --tb '#3548cf' --tf '#ffffff' --hb '#7f90ff' --hf '#000000' -i -l 20 "$@")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	wl-copy $(pass show "$password" | head -1) & sleep 45s && wl-copy -c
fi
