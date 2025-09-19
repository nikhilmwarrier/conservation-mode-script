#!/bin/bash
# Update sudoers.d/ideapad as explained here: https://github.com/laurento/gnome-shell-extension-ideapad


# Using fzf
# mode="$(echo -e "0. Disable\n1. Enable" | fzf | cut -d. -f1)"

# Using kdialog
# mode="$(kdialog --title "Battery conservation" --radiolist "Conservation mode:" 0 "Disabled" off  1  "Enabled" off 0)"

status="$(cat '/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode')"

# Using Rofi
mode="$(echo -e "0. Allow charging to 100%\n1. Stop charging at ~60%" | rofi -dmenu -p "Conservation mode ($status)" | cut -d. -f1)"

echo "$mode" | sudo tee '/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'  >/dev/null

