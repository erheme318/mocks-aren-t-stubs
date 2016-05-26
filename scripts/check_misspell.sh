#!/bin/bash
command -v hunspell >/dev/null 2>&1 || {
  echo >&2 "Please install hunspell.";
  exit 1;
}

usage() {
    cat <<USAGE
Usage: $(basename $0) [ ]

Options:
    -d  | --dictionary-dir  load dictionary from this directory
    -h  | --help            shows all options of the command
USAGE
}

PS3='Please enter your choice: '
options=("Print all" "Fix all" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Print all")
            hunspell -d dict/mn_MN -l *.md && break
            ;;
        "Fix all")
            hunspell -d dict/mn_MN *.md && break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
