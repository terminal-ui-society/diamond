MENU_NAME="btrfs"
MENU_DESCRIPTION="Handle Btrfs Subvolumes the Easy Way"
MENU_VERSION="1.0"
MENU_AUTHOR="Yazan Agha-Schrader"

btrfs_menu() {
    while true; do
        dialog --title "$MENU_NAME" \
            --menu "$MENU_DESCRIPTION" 15 50 5 \
            1 "<-- Go Back" \
            2 "Btrfs Version" \
            3 "List Btrfs Subvolumes" \
            4 "Show Default Btrfs Subvolume" \
            5 "Exit diamond" \
            2>tempfile

        local choice=$(<tempfile)
        case $choice in
            1) return ;;
            2) handle_option_1 ;;
            3) handle_option_2 ;;
            4) handle_option_3 ;;
            5) cleanup; exit ;;
        esac
    done
}



handle_option_1() {
    btrfs version
}

handle_option_2() {
    btrfs subvolume list /
}

handle_option_3() {
    btrfs subvolume get-default /
}
