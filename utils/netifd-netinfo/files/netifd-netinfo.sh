#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
# Copyright: (C) 2021, Leonardo Mörlein <me@irrelefant.net>

. /usr/share/libubox/jshn.sh


help() {
	echo "$0 [OPTIONS] [PATTERN] [PATTERN] [...]"
	echo
	echo "  -h               print help"
	echo "  -i               show interfaces (default)"
	echo "  -d               show devices instead"
	echo "  -l               list only"
	echo
	echo "  [PATTERN]        only show elements matching PATTERN (optional)"
	echo "  -e               use regex for PATTERN matching"
	echo
}

load_row() {
	# load all variables with names "$@" from json attributes
	for var in "$@"; do
		if [ "$var" = "__key" ]; then
			continue
		fi

		if json_is_a "$var" boolean; then
			json_get_var b "$var"
			if [ "$b" -eq 0 ]; then
				eval "$var=\" \""
			else
				eval "$var=x"
			fi
		else
			json_get_var "$var" "$var"
		fi
	done
}

print_row() {
	local args=""
	for var in "$@"; do
		args="$args \"\$$var\""
	done

	eval "printf \"\$FMT\" $args"
}

print_header() {
	upper () {
		 tr 'abcdefghijklmnopqrstuvxyz' 'ABCDEFGHIJKLMNOPQRSTUVXYZ'
	}

	# shellcheck disable=SC2059
	printf "$FMT" "$@" | upper

	local nchars
	# shellcheck disable=SC2059
	nchars="$(printf "$FMT" "$@" | wc -c)"
	printf "%${nchars}s\n" |tr " " "="
}

print_table() {
	local keys
	json_get_keys keys

	for __key in $keys; do
		json_select "$__key"
		load_row "$@"

		local match_value
		match_value="$(eval printf "%s" "\$$match_key")"

		if [ -z "$ARGS" ]; then
			print_row "$@"
		else
			for arg in $ARGS; do
				if [ "$USE_REGEX" -eq 0 ]; then
					arg="^$arg\$"
				fi
				if echo "$match_value" | grep "$arg" > /dev/null; then
					print_row "$@"
				fi
			done
		fi

		json_select ".."
	done
}

USE_REGEX=0
LIST_ONLY=0
ACTION=interfaces
while getopts dehil opt
do
	case "$opt" in
		i) ACTION=interfaces;;
		h) ACTION=help;;
		d) ACTION=devices;;
		l) LIST_ONLY=1;;
		e) USE_REGEX=1;;
		*) help; echo "ERROR: Invalid option '$1'!"; exit 1;;
	esac
	shift;
done

ARGS="$*"

case "$ACTION" in
	help)
		help
		;;
	interfaces)
		json_init
		json_load "$(ubus call network.interface dump)"
		json_select interface

		match_key=interface

		if [ "$LIST_ONLY" -eq 1 ]; then
			FMT="%s\n"
			print_table interface
		else
			FMT="%17s %17s %6s %10s %10s %8s %8s  %-17s\n"
			print_header interface l3_device up available autostart dynamic pending proto
			print_table interface l3_device up available autostart dynamic pending proto
		fi
		;;
	devices)
		json_init
		json_load "$(ubus call network.device status)"

		match_key=__key
		if [ "$LIST_ONLY" -eq 1 ]; then
			FMT="%s\n"
			print_table __key
		else
			FMT="%17s %6s %10s %10s %10s  %-17s\n"
			print_header device up carrier present external type
			print_table __key up carrier present external type
		fi

		;;
esac
