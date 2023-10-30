#!/bin/bash

USER_HOME=$(echo $PWD | cut -d'/' -f1,2,3)

# Check if script is run with sudo-rights
if [ "$EUID" -ne 0 ]; then
	echo "This script needs to be run with 'sudo' privileges. Please restart accordingly..."
	exit 1
fi

# Commands for each system
arch_commands=(
	"sudo pacman -S neovim"
)

ubuntu_commands=(
	"git clone https://github.com/neovim/neovim"
	"apt install cmake"
	"cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo"
	"cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb"
	"cd ${PWD} && rm -rf neovim"
)

# Commands to be run on every system
all_commands=(
	"echo 'Symlinking nvim configs'"
	"mkdir -p ${USER_HOME}/.config"
	"mv ${USER_HOME}/.config/nvim{,.bak}"
	"ln -s ${PWD}/configs/nvim ${USER_HOME}/.config"
)

# Function to exectute array of Commands
run_commands() {
	local commands=("${!1}")

	for command in "${commands[@]}"; do
		eval "$command"
	done
}

# Check for operating system and execute Commands
if command -v pacman &>/dev/null; then
	echo "Pacman (arch-based system) found."
	run_commands arch_commands[@]
elif command -v apt &>/dev/null; then
	echo "Apt (Ubuntu) found."
	run_commands ubuntu_commands[@]
else
	echo "No supported packagemanager found."
	exit 1
fi

run_commands all_commands[@]
