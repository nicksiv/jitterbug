---
title: "Setting up Cmus* for music"
date: "2018-04-28"
tags: [linux]
---

 

When I started working daily on Linux, I needed a quick way to fire up my music and get on with my work. My laptop is relatively old and based on an AMD chipset that has trouble hibernating. So, everyday I need to boot up my system and wait for applications to launch.

**Cmus\*** is a terminal music player with curses GUI and many keyboard shortcuts. It is so fast to load and use that after I started using it, I found myself reluctant of waiting for a full GUI application to load my music.

Cmus has all the features a classic music player has, it is fast and not resource hungry. So if all you need is listening to your music while working (even from a vast library of tracks) it is one of the best solutions around.

Fortunately, using Cmus is very easy and you don't have to edit config files to set it up. First of all you can install it for Ubuntu (and other distributions) from the main repository:

 

sudo apt-get install cmus

Next you go to a new terminal screen and type **cmus**

![cmus](/images/cmus.png)

## Quick tutorial

1\. Load up your library: Pressing '5' will go to the Directory browser. Locate your music directory and press 'a'. Your tracks will be added to Cmus really fast (watch the library total time counter increasing at the status bar).

2\. Browse your music: Pressing '1' will go to the Library view. You can navigate by artist/album on the left-hand side and see the tracks on the right. Press the TAB key to switch between them and ENTER to start playing the selected track. You can also use the Sorted library view by pressing '2'.

3\. Toggle Shuffle and continuous play: While listening to your first track, press 'C' (uppercase) once to toggle continuous play. I think this should be on by default. If you don't toggle this on, the music will stop after the end of the current track. If you want to shuffle tracks press 's' (lowercase).

4\. Searching: If you want to find a specific artist, album or track just type '/', the name you're looking for and ENTER (eg. /Hey joe). The cursor will be on the first result. Press 'n' to look for the next result and 'N' for the previous.

That's all. Now you can get on with your work.

 

Of course there are many other functions to Cmus as it can handle playlists, apply advanced filters, be remotely controlled by another terminal and many other stuff. I will maybe write about those in later posts.

The only thing Cmus isn't capable of is managing your music library files. For that job I continue to use Clementine.

[Cmus project page](https://cmus.github.io/)
