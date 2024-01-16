---
title: "linux notes"
Date: "2021-08-29"
tags:
- pb
- Software
lastmod: "2024-01-16"
---

## Bash
  - [Cheatsheet](https://devhints.io/bash)

## Misc

```bash
  # Arithmetic expressions `echo "I am $[2020-1973] years old"`
  # Find files `find / -name xxx` (-iname: not case sensitive)
  # Find files with size `find /etc -size +10M`
```

## More find examples
- find files or directories: `find /usr -name gcc`
- find files : `find /usr -type f -name test1`
- find directories : `find /usr -type d -name gcc`
- find by modified date (3 days) : `find / -ctime 3`


## File permissions
  - read-r=4 | write-w=2 | execute-x=1
  - ex: 600 is rw for user and nothing for group or others
  - ex: 700 is rwx for use only
  - 9+1 bits x (type) | xxx (owner) | xxx (group) | xxx(others)
  - example -rw-rw----
  - First bit is type: - (file), d(directory), 1(symlink), d(device), p(pipe)
  - Set permissions : chmod (-R recursive) u+x (user add write permission)
  - umask : Set default file creation permissions

## Processes
  - applications : ps, top, gnome-system-monitor
  - list processes for all users : ps -aux
  - Only for current user : ps -ux
  - top (keys) : M(sort by memory), P(sort by cpu-default), R(reverse sort), k(kill as root)
  - Place process in background : run adding & at the end or Ctrl+Z
  - jobs (-l show PID) : get list of jobs put in the background
  - Bring job to foreground : fg %1
  - Resume stopped background process : bg %1

## Kernel modules
  - Location : /lib/modules/[kernel version]
  - List loaded modules : lsmod
  - Information on module : modinfo (-d) [module name]
  - Location of module (file representing it) :  modinfo -n [module name]
  - Load a module temporarily to the kernel : modprobe [module name]
  - Remove loaded kernel module : rmmod [module name]
  - Remove loaded module and linked dependable unused  : modprobe -r [module name]
 
  
## Files/Hardware
  - USB copy iso : `sudo dd bs=4M if=~/Downloads/archlinux-2016.09.03-dual.iso of=/dev/sdb && sync`
  - List disk devices and partitions : `lsblk` OR `blkid`
  - List PCI devices : `lspci`
  - List USB devices : `lsusb`
  - CPU info : `lscpu`
  - List boots of system : `journalctl --list-boots`
  - List kernel messages : `journalctl -k (-b bootID)`
  - List kernel hardware messages : `dmesg `


## Networking
  - Find your ip address : `ip addr | grep inet` 
  - Find devices connected : `sudo nmap -sP 192.168.1.0/24`
  - Get OS info and service execution : `sudo nmap -A -T4 192.168.1.3`
 

## Change extension to a bunch of files
```bash
sudo apt get install rename
# rename .org files to .md
rename 's/\.md$/\.org/' *.md
```

## Create USB flash from iso image file (bootable too)
```bash
sudo dd bs=4M if=~/Downloads/archlinux-2016.09.03-dual.iso of=/dev/sdb && sync
```

## Zip entire folder using terminal
```bash
zip -r ~/Desktop/myzipfile.zip ~/Desktop/MyFolder/
```


## Duplicity

### Create an encrypted backup
- `duplicity --progress ~/Documents file:///media/nick/backup-dir/`
                                                             
### Restore backup

- `duplicity --progress file:///media/nick/backup-dir/ /home/nick/Documents/restore/`

## Find and remove found files using -exec.
```bash
find -name "*.swp" -exec rm {} ’;’

# The same, but ask first :

find -name "*.swp" -ok rm {} ’;’
```

## Find duplicate files
Using `fdupes` to find duplicate files
	
```bash
 sudo apt-get install fdupes
# find duplicates
 fdupes -r /media/nick/Data/iTunes/
# find and delete after confirmation duplicates
 fdupes -r -d /media/nick/Data/iTunes/iTunes\ Media/Music/A*
```

## Radio on the command line
[mpg123](http://mpg123.org/)

Listen to a radio station
```bash
sudo apt-get install mpg123 
mpg123 http://radiostreaming.ert.gr/ert-deftero

# Play randomly your mp3 collection (at ~/Music)
mpg123 -z ~/Music/\*/\*/\*
```

## Deactivate and activate the build in camera
    - deactivate : `sudo modprobe -r uvcvideo`
    - activate: `sudo modprobe uvcvideo`

## Split flac, cue files
- `shnsplit` is the program used to split tracks, while `cuebreakpoints` reads the break-points from file.cue and pipe them to `shnsplit`

```bash
# Install tools
sudo apt-get install cuetools shntool flac
# Make the split
cuebreakpoints file.cue | shnsplit -o flac file.flac

# Real example
# Step 1
cuebreakpoints Album.cue | shnsplit -o flac Album.flac  -f Album.cue -t "%n. %t" Album.flac < Album.cue 

# Step 2: fill the tags (make sure the original flac is in another dir)
cuetag Album.cue *.flac
```


## Lightdm set default user

Edit this file

- `/usr/share/lightdm/lightdm.conf.d/01\_debian.conf`

Then change the command greeter-hide-users from false to true and save

- `greeter-hide-users=true`

## Wake linux from a usb keyboard

How to: [https://askubuntu.com/a/1213465](https://askubuntu.com/a/1213465)

The script I chose to use enables all the USB ports. 
  
Also map this command to a key to suspend  `systemctl suspend` 


## Spell check for Greek
### Libre Office

- `sudo apt-get install myspell-el-gr`

### Spelling greek dict for emacs

- `sudo apt-get install aspell-el` then change dictionary with `ispell-change-dictionary`


## Install Quake 3 on Linux
https://www.videogames.ai/How-to-Install-Quake3-on-Linux


## Coolest Wallpapers
- [Nordic wallpapers repo](https://github.com/linuxdotexe/nordic-wallpapers)



## Read also:
  * [ALTERNATIVES TO BLOATWARE](https://github.com/mayfrost/guides/blob/master/ALTERNATIVES.md)
  * [Python cheatsheet](https://github.com/gto76/python-cheatsheet/)
  * [Mutt-Why local email](https://stevelosh.com/blog/2012/10/the-homely-mutt/#s5-why-local-email)
