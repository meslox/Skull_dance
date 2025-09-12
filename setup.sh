#!/bin/bash
if (( EUID != 0 ));then
	echo "Run as root"
else
	cp skull.py /usr/local/bin/skull
	cp SkullMusic.mp3 /usr/local/bin/SkullMusic.mp3
	chmod +x /usr/local/bin/skull
	rm setup.sh
fi
