---
title: BSD systems notes
date: 2022-01-22
icon: ✏️
lastmod: 2022-01-22
---

These are notes I've kept after trying to evaluate some BSD systems. I did not stick to them, but you never know!

# OpenBSD
OpenBSD is a dream of me (I don't know why yet) but it is hard to get to dualboot. The first post solves it via UEFI boot and the second with a pre-created partition

* [ackstorm.de - UEFI Dual Boot with Fedora and OpenBSD on ThinkPad X230](https://ackstorm.de/posts/uefi-openbsd-fedora-dual-boot.html)
* [OpenBSD Dual Boot with Linux (Single Partition) - Terminal Root](https://en.terminalroot.com.br/openbsd-dual-boot-with-linux-single-partition/)
* [Setup OpenBSD at thinkpad x240 - Jacek Kowalczyk @ IT World](https://jacekkowalczyk82.github.io/update/manuals/bsd/2020/10/21/setup-openbsd-at-thinkpad-x240.html)
* [OpenBSD on a Laptop](https://www.c0ffee.net/blog/openbsd-on-a-laptop/)
* [James tutorial with some tips I wish I knew before](https://dataswamp.org/~james/openbsd.html)

```
# After installation commands in order

dhclient em0 # LAN connect
fw_update # update firmware
syspatch
pkg_add -Uu # update packages
sysmerge -d
pkg_add vim tmux lynx dmenu firefox audacious cmus emacs hugo tor-browser transmission

# for xfce
pkg_add xfce xfce-extras xfce-power-manager upower xfce4-xkbd

rcctl enable apmd
rcctl set apmd flags -A # use apm to show battery state
rcctl start apmd
rcctl enable messagebus
rcctl start messagebus

vi ~/.xsession
startxfce4 --with-ck-launch # or enter whichever desktop command eg. cwm

# for xenodm display manager
rcctl enable xenodm
rcctl start xenodm

usermod -G staff nick

# doas config
vi /etc/doas.conf
permit persist nick
permit nopass nick as root cmd mount
permit nopass nick as root cmd umount
permit nopass nick as root cmd ntfs-3g
permit nopass nick as root cmd reboot
permit nopass nick as root cmd shutdown


# commands
zzz #suspend

# mount usb flash drive
sysctl hw.disknames
disklabel sd2
mount /dev/sd2i /mnt/usb
```

# FreeBSD

* Dual booting with Ubuntu, using this guide: https://distrowatch.com/weekly-mobile.php?issue=20181001#qa
* Resized Ubuntu partition using GParted iso image (also resized its parent partition because it was a logical partition)
* The goal was to have unassigned space as a primary partition (not as logical)
* FreeBSD cannot be installed on logical partitions, so I chose manually setup partition and created a new primary on the unassigned space
* Rebooted into Ubuntu to update the grub (add an entry for FreeBSD) using the distrowatch tutorial. I did it more easily using Grub Customizer GUI app
* Now I got FreeBSD as a second OS. I finally made it!


## Commands to setup the system after installation

Used youtube freeBSD installation videos: 

* [FreeBSD Fridays: FreeBSD InstallFest Part 1 - YouTube](https://www.youtube.com/watch?v=K8cBa8y3RNQ&list=PLugwS7L7NMXwC51yLI7br7rOLZw4UxuVj&index=2&app=desktop)

* [DistroWatch article about dual-booting installation](https://distrowatch.com/weekly-mobile.php?issue=20181001#qa)

* While installing: Make sure to add normal user to the group `wheel`

* First of all remove the beep sound
    >
    `sysctl kern.vt.enable_bell=0`
    `echo "kern.vt.enable_bell=0" >> /etc/sysctl.conf`

* Shutting down: `shutdown -p now`

## Rest of commands
```
freebsd-update fetch install
pkg update
pkg upgrade
pkg install sudo
visudo (uncomment line #%wheel...)
pkg install xorg dbus
sysrc dbus_enable="YES"
sysrc moused_enable="YES"
service dbus start
service moused start
dbus-uuidgen > /etc/machine-id (I don't know why)
```

## Install Desktop (xfce)
```
pkg install xfce
sysrc hald_enable="YES"
vi .xinitrc (for each user you want startx to open xfce)
    add the line "exec xfce4-session"
startx
```

## Install Intel GPU Drivers
```
pkg install drm-kmod
vi /etc/rc.conf
  add the line -->  kld_list="/boot/modules/i915kms.ko"
sudo pw groupmod video -m nick
```

## Other things to read
* https://freebsdfoundation.org/freebsd-project/resources/installing-a-desktop-environment-on-freebsd/
* https://linoxide.com/distros/things-installing-freebsd-11/
* [FreeBSD on a Laptop](https://www.c0ffee.net/blog/freebsd-on-a-laptop/)
