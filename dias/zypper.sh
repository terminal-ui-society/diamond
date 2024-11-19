# diamond menu metadata
MENU_NAME="zypper"
MENU_DESCRIPTION="A Powerful Command Line Package Manager"
MENU_VERSION="1.0"
MENU_AUTHOR="Yazan Agha-Schrader"

zypper_menu() {
    while true; do
        dialog --title "$MENU_NAME" \
            --menu "$MENU_DESCRIPTION" 15 50 5 \
            1 "<-- Go Back " \
            2 "Refresh your Repos" \
            3 "Install a Package" \
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



handle_option_1() {
    sudo zypper refresh
}

handle_option_2() {
    sudo zypper install \
    $(dialog --inputbox "Name of Package to Install:" 8 40 2>&1 >/dev/tty)
}
