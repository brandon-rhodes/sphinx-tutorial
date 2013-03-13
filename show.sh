#!/bin/bash
# For a completely white background: -bg "#ffffff"

exec xterm -geometry 60x22 \
 -T "Emacs" -fa "Inconsolata" -fs 20 -fg black \
 -e 'exec emacs -nw slides.txt'
