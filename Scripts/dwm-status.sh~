#!/bin/sh
# colours=("\x01" "\x02" "\x03" "\x05" "\x06" "\x07" "\x08" "\x09" "\x0A" "\x0B" "\x0C" "\x0D")

#!/bin/zsh
#while true; do
#	xsetroot -name "$(date +"%a %d.%m/%H:%M:%S") $(df -h|grep root|awk '{print $4}')"
#	sleep 1
#done &
time_format="%I:%M %p"
date_format="%m/%d"

internet_checker()  # {{{
{
        if host google.com &> /dev/null ; then
        echo "ON" ; else
        echo "OFF"
        fi
} # }}}

gmail_website_checker() { # {{{
        if host mail.google.com &> /dev/null ; then
        echo "ON"; else 
        echo "OFF"
        fi
} # }}}

gmail_notify() # {{{
{
        if [[ $(internet_checker) == ON ]]  ; then
                $username = "jakejamessteele"
		$password = "A00687989"
                curl -s https://"$username":"$password"@mail.google.com/mail/feed/atom &> ${HOME}/.mailcache
                fullcount=$(awk -F '</?fullcount>' 'NF>1{print $2}' ${HOME}/.mailcache)
                if [[ "$fullcount" == '0' ]] ; then
                        echo -e " \x07 no new emails\x01"
                elif [[ "$fullcount" == '1' ]] ; then
                        echo -e " \x07 1 new email\x01"
                else echo -e "  \x05${fullcount}\x01 \x03new emails\x04"
                fi
        fi
} # }}}

date_get() # {{{
{
        time_command=$(date +"$time_format")
	date_command=$(date +"$date_format")
        echo -e "[\x0A${time_command}\x04|\x0B${date_command}\x04]"
        #\x07Å\x08${date_command}\x01]
} # }}}

mpd_check() # {{{
{
         if mpc &> /dev/null && [[ $(mpc | wc -l) != 1 ]]; then
         echo "ON" ; else
         echo "OFF"
         fi
} # }}}

check_mpd_pause() { # {{{
        if [[ $(mpc | awk 'NR==2 {print $1}') == "[paused]" ]] ; then
        echo " \x0A[Pause]"
        fi
}      # }}}

mpd_details() { # {{{{
        if [[ $(mpd_check) == ON ]] ; then
        echo -e "\x0B [MPD] \x04$(mpc -f %title% | head -1)\x03\x03$(check_mpd_pause)\x04 \x08$(mpc | awk 'NR==2 {print $3}')\x04"
        fi
} # }}}

wifi_status() {
	echo -e "[\x0A$(netcfg current)\x04]"
}

batt_check() {

	batt=$(LC_ALL=C acpi -b)

	case $batt in
	*Discharging*)
		batt="${batt#* * * }"
		batt="${batt%%, *} "
		;;
	*)
		batt=""
		;;
	esac

	echo -e "\x0B$batt"
#	echo -e "[\x0B $(awk 'sub(/,/,"") {print $3, $4}' <(acpi -b))\x04]"
}

vol_stat() {
       echo -e "\x0A$(awk '/dB/ { gsub(/[\[\]]/,""); print $5}' <(amixer get Master))\x04"
}

div() {
	echo -e "\x04:|:"
}

title()
{
	echo -e "\x04[MPD: \x0A$(mpd_check)\x04]:="
}

#weather_check() {
#        echo -e "[\x08$(weather -i KMDW | head -3 | tail -1 | awk '{ print $2 " " $3 }')\x03]" 
#}

# main
#xsetroot -name "$(mpd_details) $(date_get)"
while true
do
   if acpi -a | grep off-line > /dev/null; then
       xsetroot -name "$(title) $(mpd_details) $(div) [BAT]:= $(batt_check) $(div) [VOL]:= $(vol_stat) $(div) [WiFi]:= $(wifi_status) $(div) [DATE]:= $(date_get)"
   else
       xsetroot -name "$(title) $(mpd_details) $(div) [WiFi]:= $(wifi_status) $(div) [BAT]:= $(batt_check) $(div) [VOL]:= $(vol_stat) $(div) [DATE]:= $(date_get)"
   fi
   sleep 2s   
done &
