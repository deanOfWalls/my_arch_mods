#!/bin/bash

# List directories and files, maintaining the order, color, and multi-column format
ls --color=auto --group-directories-first --sort=extension "$@"
