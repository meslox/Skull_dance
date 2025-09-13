#!/bin/bash
progress() {
    local length=$1
    local speed=$2
    local fill=$3
    local total=100
    for ((i=0; i<=total; i++)); do
        percent=$(( i * 100 / total ))
        fill_length=$(( length * i / total ))
        filled=$(printf "%${fill_length}s" | tr ' ' "$fill")
        empty=$(printf "%$((length - fill_length))s" | tr ' ' '-')
        bar="$filled$empty"
        printf "\r[%s]%3d%%" "$bar" "$percent"
        sleep "$speed"
    done
    printf "\n"
}
if (( EUID != 0 ));then
	echo "Run as root"
else
	cp skull.py /usr/local/bin/skull
	cp SkullMusic.mp3 /etc/SkullMusic.mp3
	chmod +x /usr/local/bin/skull
	rm setup.sh
 	progress 50 0.05 "#"
fi
#enter skull after setup
