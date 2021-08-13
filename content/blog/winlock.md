---
title: "Kid lock on Windows 10"
date: 2021-08-05T20:52:24+03:00
draft: false
tags: [windows]
---

Kids can get carried away with screens and stop paying attention to their environment. It's a battle for all parents, myself included.

I was looking for a kid lock solution for Windows, but without registering on line accounts with Microsoft. Their parental controls solution solely depends on that, as for many other things you need to do in Windows. 

So, if you don't want to do that, there is a simple solution:

Open a command prompt with Admin priviledges and type:

```bash
net user <username> /time:M-F,9am-9pm
```

That means that my son can login into windows from 9am to 9pm from Monday to Friday. Weekends are free.

This command can be more complicated dividing rules with semicolons (eg: M-F,9am-9pm;Sat,10am-10pm).
More details can be found [here](https://www.howtogeek.com/250224/how-to-set-time-limits-for-a-regular-account-in-windows-10/)

ps: There is a downside to this method. If a user is logged in and the time limit is reached, windows does not kick him/her out. So you got to keep an eye on things!
