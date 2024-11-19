# Diamond - Interactive TL;DR for CLI Commands

Diamond is an interactive dialog-based menu system that serves as a user-friendly interface for common command-line operations. Think of it as an interactive "TL;DR" for your favorite CLI commands!

## Features

- Modular menu system
- Easy-to-use interface
- Highly customizable
- Extensible plugin architecture
- Quick access to common commands
- Interactive command documentation

## Getting Started

### Prerequisites

- bash
- dialog

### Installation

```bash
git clone https://github.com/terminal-ui-society/diamond.git
cd diamond
chmod +x diamond.sh
./diamond.sh
```

## Available Menus

- **btrfs**: Common btrfs filesystem operations
- **zypper**: Package management for openSUSE
- *More coming soon!*

## Contributing

We love your input! We want to make contributing to Diamond as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Creating new menus (see below)

### Adding a New Menu

1. Create a new .sh file in the `dias` directory
2. Use our template structure (see `template.sh`)
3. Submit a pull request

Example menu structure:
```bash
#!/bin/bash

menu_name() {
    while true; do
        dialog --title "Your Menu" \
               --menu "Description" 15 50 3 \
               1 "Option 1" \
               2 "Option 2" \
               3 "Back" \
               2>tempfile

        case $(<tempfile) in
            1) handle_option_1 ;;
            2) handle_option_2 ;;
            3) return ;;
        esac
    done
}
```

## Project Goals

- Provide an intuitive interface for complex CLI commands
- Share command knowledge
- Make CLI tools more accessible to newcomers
- Making CLI tools more visually pleasing
- Build a comprehensive library of interactive command documentation

## Roadmap

- [ ] Add more default menus
- [ ] Implement menu categories
- [ ] Add search functionality
- [ ] Create a menu marketplace
- [ ] Add multilingual support

## How Can I Help?

- Create new menus for your favorite tools
- Improve existing menus
- Report bugs
- Suggest features
- Share the project
- Star the repository if you find it useful!

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- All our amazing contributors
- The dialog command-line tool
- The open-source community

---

Remember: No contribution is too small! Even if you just found a typo or have a suggestion, we'd love to hear from you! 

## Contact

- Create an issue
- Start a discussion
- Send a pull request

Well and now, what are you waiting for? Let's make CLI tools more accessible!
