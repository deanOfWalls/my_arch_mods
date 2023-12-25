#!/bin/bash

PIDFILE="/tmp/autoclicker.pid"

if [ -f "$PIDFILE" ]; then
    kill -9 $(cat "$PIDFILE")
    rm "$PIDFILE"
else
    while true; do
        /home/dean/Dev/autoclicker.sh
    done &
    echo $! > "$PIDFILE"
fi

