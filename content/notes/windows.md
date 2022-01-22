---
title: Windows
date: 2022-01-21
icon: 💻
lastmod: 2022-01-21
---

## Windows auto time not updating

Apparently the time service is not running automatically

>
    - Press [Windows key] + R 
    - Type services.msc
    - Click Windows Time in the Name column.
    - Alternate click and then click Properties.
    - Change Startup type to Automatic (if it’s not already set to Automatic).
    - Click Start if the service isn’t started.


## Windows 10: Set time limits for account

* https://www.howtogeek.com/250224/how-to-set-time-limits-for-a-regular-account-in-windows-10/

Windows: set limits without parental controls

```
net user <name> /time:M-F,9am-9pm
```

## Windows 10: doze to hibernate

Fixing the issue where you put your Windows PC to sleep and after some hours it powers on and hibernates.

* https://itectec.com/superuser/windows-10-desktop-wakes-from-sleep-to-hibernate-even-when-disabled/

## Minecraft: Game fails to switch the audio output from one device to another after the game has started

https://bugs.mojang.com/browse/MC-44055

>
To work around the issue, you can manually reload sounds (and all other resources) with `F3+T` (at the same time).

## MS Teams release media play button

Windows 10: This fixes the annoying bug which occurs when you press the media play key and instead of your music player you hear the Teams notification.

Create a new shortcut with the following line and run Teams from there:

`C:\Users\nick\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe" --process-start-args "-disable-features=HardwareMediaKeyHandling --system-initiated"`

> source: https://techcommunity.microsoft.com/t5/microsoft-teams/media-keys-and-teams-notifications/m-p/1949714

