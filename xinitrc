#!/bin/bash
# MPD daemon start (if no other user instance exists)
[ ! -s ~/.mpd/mpd.pid ] && mpd &
sh ~/Scripts/wallpaper.sh &
#xrdb -load ~/.Xresources
#sh ~/Scripts/dwm-status.sh &
dunst -config ~/.dunstrc &
pulseaudio --start &
conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
#exec gnome-session
