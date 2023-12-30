#!/bin/bash

# Run Syu with Rns and paccache
sudo pacman -Syu && sudo pacman -Rns $(pacman -Qtdq) && sudo paccache -r
