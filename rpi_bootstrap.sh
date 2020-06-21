#!/bin/bash
#
# Run this script after putting up a new server to get all your preferred 
# software and configurations, assuming that you're kzimmermann
#
# -- Environmental considerations: --
#
# Server is assumed to be Debian-ish (at least enough to the point of using apt
# and its repositories)
#
# sources.list is assumed to have been configured to download packages from the
# appropriate repos of your preferences.
#
# -- Major changelog: --
#
# After many years in trademark debate, Firefox finally makes its way back into
# Debian Stable :)
#
# After experimenting heavily with tiling Window managers, I chose to include
# awesome in the installed software list.
#
# Turns out that plain old `xterm' is, by far, much simpler and better a 
# terminal emulator than urxvt. So much easier to configure, and somehow I 
# don't think we need to read all unicode font ever encountered on the terminal
# 
# -- License of use: --
#
# Copyright Pinguim Investidor 2020 - all rights reserved.
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program. If not, see <http://www.gnu.org/licenses/>.
#

# Sometimes we just want to update the configuration files to the latest 
# version available thanks to `git pull'. If that's the case, answer yes here:
printf "Do you want only to update the configuration files? (y/n) "
read decision

if [[ "$decision" != "y" ]]
then
    echo "I'm assuming that you already took the time to configure APT, including"
    echo "it's repositories, URLs, distribution, etc."
    printf "Shall we proceed? (y/n) "

    read gonogo

    if [ ${gonogo} != "y" ]; then
        echo "Aborted."
        exit 1
    fi
    echo "Root is needed to start downloading the packages."
    echo "You will be prompted to enter your password now, but it's for the sudo command." 
    echo "If you don't trust the program, you can always check the source code."
    echo " *** Installation begins ***"
    echo "Updating repositories..."
    #sudo apt-get update > /dev/null

    echo "======="
    echo "Installing packages..."
    echo "yes" | sudo apt-get install \
        moc \
        htop \
        g++ \
        mc \
        mutt \
        calcurse \
        irssi \
        sqlite3 \
        sudo \
        tmux \
        pmount \
        elinks \
        privoxy \
        mcabber \
        python3-pip\
        virtualenv \
        openvpn

    # now that the packages are installed, let's put some configuration files
    # where they belong.

    echo "*** Installing dotfiles ***"
    
else
    echo "*** Updating dotfiles ***"

fi

echo "Copying tmux configuration files..."
cp tmux.conf $HOME/.tmux.conf

echo "Copying bashrc..."
cp bashrc $HOME/.bashrc

echo "Copying vimrc..."
cp vimrc $HOME/.vimrc

echo "Copying elinks configuration files..."
mkdir $HOME/.elinks
cp elinks.conf $HOME/.elinks/

echo "Copying irssi configuration files..."
mkdir $HOME/.irssi
cp irssiconfig $HOME/.irssi/config

echo ""
echo " *** Installation complete. ***"
