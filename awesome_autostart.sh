#!/bin/bash
#
# Script to autostart applications to make Awesome more like a full DE.
# Credit goes to the ArchWiki: https://wiki.archlinux.org/index.php/Awesome
#

function run()
{
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

# Run Programs using `run program [arguments]`

run xfce4-power-manager
run redshift
run nm-applet # yes!
run xscreensaver
# run nextcloud
