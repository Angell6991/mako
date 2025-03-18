#   Install

Install dependencies
```sh
sudo pacman -S mako libnotify pamixer cronie
```

# config notifications battery

Enable cronie with system:
```sh
sudo systemctl enable cronie
```

start service in systemd:
```sh
sudo systemctl start cronie 
```

Check that the service is running correctly:
```sh
sudo systemctl status cronie 
```

open the cronie configuration file:
```sh
crontab -e
```

Add the following line to run the script every 2 minutes, taking into account the username:
```sh
*/2 * * * * /home/angell/.config/mako/scripts/battery.sh
```

If the "crontab -e" command doesn't work, run:
```sh
export VISUAL=nvim
```
and run again "crontab -e"

