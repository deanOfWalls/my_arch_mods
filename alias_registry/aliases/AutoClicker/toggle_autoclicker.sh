#!/bin/bash

PIDFILE="/tmp/autoclicker.pid"

# Toggle the autoclicker
if [ -f "$PIDFILE" ]; then
    kill -9 $(cat "$PIDFILE")
    rm "$PIDFILE"
else
    while true; do
        /home/dean/aliases/AutoClicker/autoclicker.sh
    done &
    echo $! > "$PIDFILE"
fi




