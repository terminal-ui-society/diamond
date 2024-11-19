#!/bin/bash

# Metadata for the Menu
MENU_NAME="Template"
MENU_DESCRIPTION="Description of the Menu"
MENU_VERSION="1.0"
MENU_AUTHOR="Your Name"

template_menu() {
    while true; do
        dialog --title "$MENU_NAME" \
               --menu "$MENU_DESCRIPTION" 15 50 4 \
               1 "Back" \
               2 "Option 1" \
               3 "Option 2" \
               4 "Exit" \
               2>tempfile

        local choice=$(<tempfile)
        case $choice in
            1) return ;;
            2) handle_option_1 ;;
            3) handle_option_2 ;;
            4) cleanup; exit ;;
        esac
    done
}

# helper function
handle_option_1() {
    # TODO implement
}
