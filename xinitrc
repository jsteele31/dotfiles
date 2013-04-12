sh ~/.scripts/wallpapers.sh &
dunst -config ~/.dunstrc &

xsetroot -cursor_name left_ptr

#pulseaudio --start &
start-pulseaudio-x11 &
# MPD daemon start (if no other user instance exists)
[ ! -s ~/.mpd/mpd.pid ] && mpd

# start alsa for info
#modprobe snd_mixer_oss

compton -cGb &

~/bin/dzconky &

#run subtle
exec wingo --log-level 3 > ~/wingo.log 2>&1
#exec wingo
#exec subtle
#exec notion
