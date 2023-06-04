#!/bin/bash

# Defaults
root=$PWD
sensitive=false
dots=false

# Colors
red="\033[0;91m"
green="\033[0;92m"
reset="\033[0m"

while [[ $# -gt 0 ]]; do
    case $1 in
    -r | --root)
        root="$2"
        shift
        shift
        ;;
    -s | --sensitive)
        sensitive=true
        shift
        ;;
    -d | --dots)
        dots=true
        shift
        ;;
    -*)
        echo -e "${red}Unknown option $1${reset}"
        return 1
        ;;
    *)
        destination="$1"
        shift
        ;;
    esac
done

if [[ "$sensitive" = false && "$dots" = false ]]; then
    endpath=$(find "$root" -not -path "*/.*" -type d -iname "*$destination*" 2>&1 | grep -v "Permission denied" | head -n 1)

elif [[ "$sensitive" = false && "$dots" = true ]]; then
    endpath=$(find "$root" -type d -iname "*$destination*" 2>&1 | grep -v "Permission denied" | head -n 1)

elif [[ "$sensitive" = true && "$dots" = false ]]; then
    endpath=$(find "$root" -not -path "*/.*" -type d -name "*$destination*" 2>&1 | grep -v "Permission denied" | head -n 1)

elif [[ "$sensitive" = true && "$dots" = true ]]; then
    endpath=$(find "$root" -type d -name "*$destination*" 2>&1 | grep -v "Permission denied" | head -n 1)
fi

if [[ $endpath == "" ]]; then
    echo -e "${red}No directory match found${reset}"
else
    echo -e "${green}$endpath${reset}"
    cd "$endpath" || echo -e "${red}Failed at the cd step${reset}"
fi
