#!/bin/bash

# Dialog wrapper to have consistent design
show_dialog() {
    local title="$1"
    local text="$2"
    shift 2
    dialog --title "$title" --msgbox "$text" 10 40
}

# Error handling
handle_error() {
    local error_msg="$1"
    dialog --title "Error" --msgbox "$error_msg" 10 40
    return 1
}

# A cleanup function
cleanup() {
    rm -f tempfile
    clear
}
