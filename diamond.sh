#!/bin/bash

# Define paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIAS_DIR="${SCRIPT_DIR}/dias"
LIB_DIR="${SCRIPT_DIR}/lib"

# Load common functions
source "${LIB_DIR}/common.sh"
source "${LIB_DIR}/utils.sh"

# Load all available menus dynamically
load_available_menus() {
    local menu_items=()
    local counter=1

    # Iterate through all .sh files in the dias directory
    for menu_file in "${DIAS_DIR}"/*.sh; do
        if [[ -f "$menu_file" ]]; then
            source "$menu_file"
            # Extract menu name from file name
            local menu_name=$(basename "$menu_file" .sh)
            menu_items+=("$counter" "$menu_name")
            ((counter++))
        fi
    done

    # Show menu with dynamically loaded options
    dialog --title "Mein Menu" \
           --menu "Select an option:" 15 50 $((counter-1)) \
           "${menu_items[@]}" \
           2>tempfile

    # process the choice
    local choice=$(<tempfile)
    if [[ -n "$choice" ]]; then
        # Array-Index starts at 0, therefore -1
        local selected_menu=${menu_items[$(( (choice-1) * 2 + 1 ))]}
        # contruct function-name and call
        ${selected_menu}_menu
    fi
}


# main loop
main() {
    while true; do
        load_available_menus
        # check if user has canceled (ESC/Cancel)
        if [[ $? -ne 0 ]]; then
            cleanup
            exit 0
        fi
    done
}

# cleanup if exit
trap cleanup EXIT

# start the program
main
