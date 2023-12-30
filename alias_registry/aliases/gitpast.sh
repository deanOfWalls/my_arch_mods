#!/bin/bash

# Allows for quick retroactive commits for GitHub

gitpast() {
    local date_str=$1
    local time_str="$2"
    local commit_msg="$3"

    if [ $# -ne 3 ]; then
        echo "Usage: gitpast YYYY-mm-dd hh:mm 'Commit Message Here'"
        return 1
    fi

    local datetime_str="${date_str} ${time_str}"
    git commit --date="$datetime_str" -m "$commit_msg"
}

gitpast "$@"
