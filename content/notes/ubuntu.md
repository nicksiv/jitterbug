---
title: "Ubuntu"
date: "2021-08-29"
icon: "✏️"
lastmod: "2021-08-29"
---


Notes for my current base system Ubuntu version 20.04.1 LTS

## Configurations

### Hotkeys
- Hotkey for home folder `Meta+E`
- emacs `Ctrl+Alt+M`
- emote `Ctrl+Alt+E`
- cmus pause button on F8 `cmus-remote --pause`
- cmus next track on Ctrl+F8 `cmus-remote --next`
- Use Alt+Shift for keyboard layout change: 
```bash
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle', 'grp_led:scroll', 'lv3:switch']"

```

### Grub
-  Set grub timeout to 3 seconds
```bash
sudo vim /etc/default/grub
sudo update-grub
```
Or  Install `grub-customizer` to fix grub timeout

### Battery optimization 
```bash
sudo apt install tlp 
sudo apt install acpi-call-dkms tp-smapi-dkms
sudo tlp start
```

###  Remove desktop icons
`sudo apt install gnome-shell-extension-prefs`

### Scale custom photos on desktop backgrounds
`sudo apt install gnome-tweaks`

## Installations

### Python
- Setup python and python-pip:
```bash
sudo apt-get install python3-pip -y
sudo pip3 install --upgrade pip
```


###  Lollypop media player
-  For media keys to work install this extension in gnome
   -  https://extensions.gnome.org/extension/1379/mpris-indicator-button/
-  Before that: 
   -  add the gnome shell integration browser extension
   -  and run `sudo apt-get install chrome-gnome-shell`


### M$ Teams
Working at home made us using lots or proprietary software like this. 💩

The standard downloaded file installation from their website fails on Linux, and it's better done like this:
Install in UbuntuOS

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo apt update
sudo apt install teams
```

### Todo.txt installation

```bash
sudo apt-get install todo-txt

# copy the default configuration file from /etc/todo-txt to a new created directory into your home folder (.todo-txt)
sudo cp /etc/todo-txt/config ~/.todo-txt/ 

# change the owner of the config file to your username:
sudo chown myname ~/.todo-txt/config
sudo chmod +x /usr/share/bash-completion/completions/todo-txt
```

Tell todo-txt where your files will reside. Edit the config file:

`nano ~/.todo-txt/config` 

Make the following changes
```
# change this line
export TODO\_DIR=~/todo\_files

# add this line
export TODOTXT\_SORT\_COMMAND='env LC\_COLLATE=C sort -k 2,2 -k 1,1n'
```

The final step is to make some changes to the ~/.bashrc file to make things easier. Add following lines
```
export TODOTXT\_DEFAULT\_ACTION=ls
alias t="todo-txt -t"
```

You can now use the t alias to list your tasks by priority



 
