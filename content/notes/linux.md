---
title: "Linux"
date: "2021-08-29"
icon: "✏️"
lastmod: "2021-08-29"
---

## Bash
  - [cheatsheet](https://devhints.io/bash)

## Misc
  - Command substitution  `vi $(find /home | grep bash)`
  - Arithmetic expressions `echo "I am $[2020-1973] years old"`
  - Find files `find / -name xxx (-iname: not case sensitive)`
  - Find files with size `find /etc -size +10M`

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
## More find examples
- find files or directories: $ `find /usr -name gcc`
- find files : $ `find /usr -type f -name test1`
- find directories : $ `find /usr -type d -name gcc`
- find by modified date (3 days) : `find / -ctime 3`


## Duplicity

### Create an encrypted backup
`duplicity --progress ~/Documents file:///media/nick/backup-dir/`
                                                             
### Restore backup

`duplicity --progress file:///media/nick/backup-dir/ /home/nick/Documents/restore/`

## Find and remove found files using -exec.
```bash
$ find -name "*.swp" -exec rm {} ’;’
```
The same, but ask first :
```bash
$ find -name "*.swp" -ok rm {} ’;’
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
```

Play randomly your mp3 collection (at ~/Music)

```bash
mpg123 -z ~/Music/\*/\*/\*
```

## Cmus
[Cmus project page](https://cmus.github.io/)

![cmus](/images/cmus.png)

1. **Load up your library**: Pressing '5' will go to the Directory browser. Locate your music directory and press 'a'. 
2. **Go to library view** pressing '1'. You can navigate by artist/album on the left-hand side and see the tracks on the right. Press the TAB key to switch between them and ENTER to start playing the selected track. You can also use the Sorted library view by pressing '2'.
3. **Toggle Shuffle and continuous play**: While listening to your first track, press 'C' (uppercase) once to toggle continuous play. I think this should be on by default. If you don't toggle this on, the music will stop after the end of the current track. If you want to shuffle tracks press 's' (lowercase).
4. **Searching**: If you want to find a specific artist, album or track just type '/', the name you're looking for and ENTER (eg. /Hey joe). The cursor will be on the first result. Press 'n' to look for the next result and 'N' for the previous.


## Copy m3u playlist files in a folder
Run this script where the m3u playlist is stored

```bash
sed "s/#.*//g" < starFM.m3u | sed "/^$/d" | while read line; do (( COUNTER++ )); filename="{line##*/}"; cp "${line}" "/home/nick/export/starFM/$COUNTER - $filename"; done
```

## Deactivate and activate the build in camera
    - deactivate : `sudo modprobe -r uvcvideo`
    - activate: `sudo modprobe uvcvideo`

## Split flac, cue files
`shnsplit` is the program used to split tracks, while `cuebreakpoints` reads the break-points from file.cue and pipe them to `shnsplit`

```bash
# Install tools
sudo apt-get install cuetools shntool flac
# Make the split
cuebreakpoints file.cue | shnsplit -o flac file.flac
```
Real example

```bash
# Step 1

cuebreakpoints Album.cue | shnsplit -o flac Album.flac  -f Album.cue -t "%n. %t" Album.flac < Album.cue 

# Step 2
# fill the tags (make sure the original flac is in another dir)
cuetag Album.cue *.flac
```

## Block internet access for a user

```bash
# Temporary block access
# for user test5
sudo iptables -A OUTPUT -p all -m owner --uid-owner test5 -j DROP

# for group test5group
sudo iptables -A OUTPUT -p all -m owner --gid-owner test5group -j DROP
```

### Make it persistent

The iptables firewall is the built-in firewall for protecting a Linux machine from online threats. But the settings are not save upon a re-boot. This is easily alleviated by installing the iptables-persistent package for Ubuntu. Once this is installed, you will be greeted with a screen that will ask you if you wish to save your iptables rules. Answer yes to both questions and the application will save your rules safely in case of a re-boot of the desktop or server the firewall is on.

Type this command to install this application.

`sudo apt-get install iptables-persistent`

## Lightdm set default user

Edit this file

`/usr/share/lightdm/lightdm.conf.d/01\_debian.conf`

Then change the command greeter-hide-users from false to true and save

`greeter-hide-users=true`

## Wake linux from a usb keyboard

How to: [https://askubuntu.com/a/1213465](https://askubuntu.com/a/1213465)

The script I chose to use enables all the USB ports. 
  
Also map this command to a key to suspend  `systemctl suspend` 


## Spell check for Greek
### Libre Office

`sudo apt-get install myspell-el-gr`

### Spelling greek dict for emacs

`sudo apt-get install aspell-el` then change dictionary with `ispell-change-dictionary`


## Play among us on Linux
https://www.addictivetips.com/ubuntu-linux-tips/play-among-us-linux/

## Install Quake 3 on Linux
https://www.videogames.ai/How-to-Install-Quake3-on-Linux
