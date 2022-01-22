---
title: OpenBSD
date: 2022-01-22
icon: ✏️
lastmod: 2022-01-22
---

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