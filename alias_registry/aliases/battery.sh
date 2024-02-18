upower --dump | awk '
  BEGIN { device = "" }
  {
    if ($1 == "Device:") {
      device = $2
    } else if ($1 == "model:" && device != "") {
      model[device] = $2
    } else if ($1 == "percentage:" && device != "" && device != "/org/freedesktop/UPower/devices/DisplayDevice") {
      printf "\033[1;36mmodel:\033[0m %s\n\033[1;33mpercentage:\033[0m %s\n\n", model[device], $2
    }
  }'
