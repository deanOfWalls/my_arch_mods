upower -i /org/freedesktop/UPower/devices/headphones_dev_23_05_10_C4_13_EC | grep -E "model|percentage" | awk '{print "\033[1;36m" $1 ":\033[0m", "\033[1;33m" $2 "\033[0m"}'
