#!/bin/bash
#######################################################################
#
#  Project......: library-iphone.sh
#  Creator......: matteyeux
#  Description..: Script to install libimobiledevice on Linux and macOS
#  Type.........: Public
#
######################################################################
# Language :   bash

function depends(){
	sudo apt-get install -y git
	sudo apt-get install -y build-essential
	sudo apt-get install -y make
	sudo apt-get install -y autoconf
	sudo apt-get install -y automake
	sudo apt-get install -y libtool
	sudo apt-get install -y openssl
	sudo apt-get install -y tar
	sudo apt-get install -y perl
	sudo apt-get install -y binutils
	sudo apt-get install -y gcc
	sudo apt-get install -y libstdc++6-dev
	sudo apt-get install -y libc6-dev
	sudo apt-get install -y libssl-dev
	sudo apt-get install -y libusb-1.0
	sudo apt-get install -y gcc
	sudo apt-get install -y g++
	sudo apt-get install -y libcurl4-gnutls-dev
	sudo apt-get install -y fuse
	sudo apt-get install -y libxml2-dev

	sudo apt-get install -y libgcc1
	sudo apt-get install -y libreadline-dev 
	sudo apt-get install -y libglib2.0-dev
	sudo apt-get install -y libzip-dev
	sudo apt-get install -y libfuse-dev

	sudo apt-get install -y cython
	sudo apt-get install -y python-2.7
	sudo apt-get install -y python2.7-numpy
	sudo apt-get install -y libncurses4 
	sudo apt-get install -y libncurses5 
	sudo apt-get install -y ncurses-base
}

function brew_install(){
	# Install Hombrew.
        if [[ ! -e $(which brew) ]]; then
                echo "Brew is not installed..."
                echo "installing brew..."
                sleep 1
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        else
                echo "Brew already installed"
        fi
	# Ask for the administrator password upfront.
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until the script has finished.
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	# Make sure we’re using the latest Homebrew.
	brew update

	# Upgrade any already-installed formulae.
	brew upgrade

	# Install GNU core utilities (those that come with OS X are outdated).
	# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
	brew install coreutils
	sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

	# Install some other useful utilities like `sponge`.
	brew install moreutils
	# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	brew install findutils
	# Install GNU `sed`, overwriting the built-in `sed`.
	brew install gnu-sed --with-default-names

	# Install Development Packages;
	brew install libxml2
	brew install libzip
	brew install libplist
	brew install openssl
	brew install clutter
	brew install cogl
	brew install usbmuxd


	# Install Software;
	brew install automake
	brew install autoconf
	brew install libtool
	brew install pkg-config
	brew install gcc
	brew install libusb
	brew install ifuse
	brew install glib

	# Install extras;
	brew install xz
	brew install git
	# Remove outdated versions from the cellar.
	brew cleanup
}

function autobuild(){
	if [[ $(uname) == 'Darwin' ]]; then
		brew link openssl --force
	fi
	successlibs=()
	failedlibs=()
	libs=( "libplist" "libusbmuxd" "libimobiledevice" "usbmuxd" "libirecovery" \
		"ideviceinstaller" "libideviceactivation" "idevicerestore" "ifuse" )

	spinner() {
	    local pid=$1
	    local delay=0.75
	    local spinstr='|/-\'
	    echo "$pid" > "/tmp/.spinner.pid"
	    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
	        local temp=${spinstr#?}
	        printf " [%c]  " "$spinstr"
	        local spinstr=$temp${spinstr%"$temp"}
	        sleep $delay
	        printf "\b\b\b\b\b\b"
	    done
	    printf "    \b\b\b\b"
	}

	buildlibs() {
		for i in "${libs[@]}"
		do
			echo -e "\033[1;32mFetching $i..."
			git clone https://github.com/libimobiledevice/${i}.git
			cd $i
			echo -e "\033[1;32mConfiguring $i..."
			./autogen.sh
			./configure
			echo -e "\033[1;32mBuilding $i..."
			make && sudo make install
			echo -e "\033[1;32mInstalling $i..."
			cd ..
		done
	}

	buildlibs
	sudo ldconfig
}

if [[ $(uname) == 'Linux' ]]; then
	depends
elif [[ $(uname) == 'Darwin' ]]; then
	brew_install
fi
# If you're running this script on Cygwin or MinGW it will only run autobuild
autobuild
