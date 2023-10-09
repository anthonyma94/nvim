#!/bin/bash

if ! command -v nvim; then
	sudo apt install -y gcc g++
	mkdir tmp
	cd tmp
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	tar -xvzf nvim-linux64.tar.gz
	sudo mv nvim-linux64 /opt/nvim
	sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
	cd ../
	rm -rf tmp

	sudo apt install -y xclip # needed to make clipboard work
else
	echo "nvim installed. Skipping..."
fi
