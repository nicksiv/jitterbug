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
