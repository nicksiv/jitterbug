---
title: windows notes
Date: 2023-08-08
tags: 
- pb
- Software
lastmod: "2024-01-16"
---

## ## grep like search on windows

Use findstr to get the same result. For example, I search for the word #delete in my tiddlers folder:

- `findstr /s trousers c:\Users\nick\Nextcloud\lydia\wiki\tiddlers\*`

But this works with grep for windows:

- `grep -Rs trousers c:\Users\nick\tabitha\wiki\tiddlers`

## Correct time between Linux and Windows (dual)

### From Linux

- `sudo timedatectl set-local-rtc 1`

## Windows auto time not updating

Apparently the time service not running automatically

> Press [Windows](/#Windows) key + r ( + r). Type services.msc. Click Windows Time in the Name column. Alternate click and then click Properties. Change Startup type to Automatic (if it’s not already set to Automatic). Click Start if the service isn’t started.

## Remove extra keyboard layouts

This relates with the commond problem that you see 3-4 keyboard layouts (mainly English UK) besides the standard English US and Greek.

It turns out the welcome screen has other settings and you need to copy your current regional settings to everything.

- `Control panel>Region>Administrative>Copy Settings`

[https://www.tenforums.com/tutorials/3815-region-language-settings-copy-windows-10-a.html](https://www.tenforums.com/tutorials/3815-region-language-settings-copy-windows-10-a.html)

I was troubled for so long with that!

## Windows 11 Remove widgets
> Powershell, admin mode

- `Get-AppxPackage *WebExperience* | Remove-AppxPackage`


## Detect Hibernation issues

If something keeps windows from hibernating, try seeing which apps does that:

> Command prompt administrator

- `powercfg -requests`

This will list any apps doing that so that you can shut them down.

## Set time limits for account

Set limits without parental controls

- `net user <name> /time:M-F,9am-9pm`

[https://www.howtogeek.com/250224/how-to-set-time-limits-for-a-regular-account-in-windows-10/](https://www.howtogeek.com/250224/how-to-set-time-limits-for-a-regular-account-in-windows-10/)
## Autohotkey Show or run windows terminal with shortcut

From: [https://blog.danskingdom.com/Bring-up-the-Windows-Terminal-in-a-keystroke/](https://blog.danskingdom.com/Bring-up-the-Windows-Terminal-in-a-keystroke/)

I use Ctrl+Shift+L (last line)

> Add this into autohotkey configuration

```
SwitchToWindowsTerminal()
{
  windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
  windowExistsAlready := windowHandleId > 0

  ; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true)
  {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive)
    {
      ; Minimize the window.
      WinMinimize, "ahk_id %windowHandleId%"
    }
    else
    {
      ; Put the window in focus.
      WinActivate, "ahk_id %windowHandleId%"
      WinShow, "ahk_id %windowHandleId%"
    }
  }
  ; Else it's not already open, so launch it.
  else
  {
    Run, wt
  }
}

; Hotkey to use Ctrl+Shift+C to launch/restore the Windows Terminal.
^+l::SwitchToWindowsTerminal()
```

## Stop windows from waking up
> It's really annoying to have the PC waking up for updating chrome, edge or something else you have no idea about.

To fix this, go to: **Control Panel\All Control Panel Items\Power Options\Edit Plan Settings** select **change advanced power settings** and the Power options window will show up.

Then, from the list (on your active power plan) expand the **Sleep** item and under the **Allow wake timers** setting select **Disable**

## Boost volume on Windows 10
[https://sourceforge.net/projects/equalizerapo/files/latest/download](https://sourceforge.net/projects/equalizerapo/files/latest/download)

After installation, you get a configuration app shortcut. There you can set the preamp from -3db to +10db which is too high.

## No media keys keyboard
For keyboard without media keys you can use **Autohotkey** to map function keys with windows button.

> Windows Media controls in Mac positions
> 
> 1. F7::Media_Prev
> 2. F8::Media_Play_Pause
> 3. F9::Media_Next
> 4. F10::Volume_Mute
> 5. F11::Volume_Down
> 6. F12::Volume_Up

Links and tutorials (in order)

- [https://www.autohotkey.com/](https://www.autohotkey.com/)
- [https://damieng.com/blog/2013/08/16/windows-8-media-keys-on-a-regular-keyboard/](https://damieng.com/blog/2013/08/16/windows-8-media-keys-on-a-regular-keyboard/)
- [https://windowsloop.com/run-autohotkey-script-at-windows-startup/#shortcut](https://windowsloop.com/run-autohotkey-script-at-windows-startup/#shortcut)

## Doze to hibernate
Fixing the issue where you put your Windows PC to sleep and after some hours it powers on and hibernates.

[https://itectec.com/superuser/windows-10-desktop-wakes-from-sleep-to-hibernate-even-when-disabled/](https://itectec.com/superuser/windows-10-desktop-wakes-from-sleep-to-hibernate-even-when-disabled/)

## Audacity record pc playback
* Use Windows WASAPI as audio host, Speakers (loopback) as recording device  
[https://manual.audacityteam.org/man/tutorial_recording_computer_playback_on_windows.html](https://manual.audacityteam.org/man/tutorial_recording_computer_playback_on_windows.html)

## Disable a user and hide it from logon screen
Enter command prompt in admin mode

- `net user username /active:no`


## Windows Emacs installation
Below are the notes for required actions after installation of emacs on windows.
1. Set home folder on Windows  
Open Powershell in administrator mode and enter this line:
- `setx HOME %USERPROFILE%`
	
2. Windows regional settings formats in English (world)  
Link Windows config into global system emacs config
file /home/nick/.emacs with contents:
- `(load "~/tabitha/org/sys/dot-emacs")`

3. Using Doc-View for windows (pdf display)  
install chocolatey: https://chocolatey.org/install
- `choco install xpdf-utils ghostscript`

4. Gnus use of PGP for Windows + other utils  
- `choco install gnupg grep curl`

5. Mplayer (for emacs emms music)  
[Install from sourceforge](https://sourceforge.net/projects/mplayerwin/files/MPlayer-MEncoder/r38151/mplayer-svn-38151-x86_64.7z/download)
