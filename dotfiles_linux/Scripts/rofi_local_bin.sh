#!/bin/bash

ROFI_SCRIPTS_PATH="$HOME/Scripts/rofi_list_scripts"


selected=$(ls $ROFI_SCRIPTS_PATH|rofi -dmenu -p "Run: ")

if [ -n "$selected" ]; then
    "$ROFI_SCRIPTS_PATH/$selected"  # Run the selected script
fi
