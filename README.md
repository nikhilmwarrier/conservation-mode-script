#  Battery Conservation Mode shell script for Lenovo Ideapads and V14/V15 laptops 

## For details

See the README on [my other repo](https://github.com/nikhilmwarrier/ideapad-conservation-mode-linux-tray-icon).

## Dependencies

- [Rofi](https://github.com/davatorium/rofi)

Can also work with any fzf/dmenu-adjacent programs with simple tweaks to the script.

## Setup

### Give read/Write access to the sysfs file
This script works by reading/writing a file that's normally owned by the root user. To get read/write access to it (without having to use `sudo` every time), you need to add an entry to your system sudoers file. For details, see [this section](https://github.com/laurento/gnome-shell-extension-ideapad?tab=readme-ov-file#additional-required-settings) of the excellent README from a similar project.

TL;DR

```bash
# Don't forget to replace %sudo with %wheel if needed!
#
$ echo "%sudo ALL=(ALL) NOPASSWD: /usr/bin/tee /sys/bus/platform/drivers/ideapad_acpi/VPC????\:??/conservation_mode" | sudo tee /etc/sudoers.d/ideapad
$ echo "ideapad_laptop" | sudo tee -a /etc/modules
```

### Next steps

1. Place the script on your `$PATH`.
2. Make it executable
3. (Optional) Add it to your desktop/panel.
