#!/bin/bash
command -v hunspell >/dev/null 2>&1 || {
  echo >&2 "Please install hunspell. Ex: \"brew install hunspell\" etc..";
  exit 1;
}

PS3='Please enter your choice: '
options=("Print all" "Fix all" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Print all")
            hunspell -d mn_MN -l *.md && break
            ;;
        "Fix all")
            hunspell -d mn_MN *.md && break
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
