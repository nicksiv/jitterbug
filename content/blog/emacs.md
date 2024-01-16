---
title: emacs
date: "2021-08-29"
tags: 
- pb
- Software
lastmod: "2024-01-16"
---

## 1. Emacs basic configuration
Open a file with the magic shortcut (Cx-Cf) and enter ~/.emacs to create a new configuration:

```lisp
;; Hide toolbars and menubar (not for novice users)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Don't show the standard emacs startup screen
(setq inhibit-startup-screen 1)

;; Changes all yes/no questions to y/n type;
(fset 'yes-or-no-p 'y-or-n-p)

;; No sound bell;
(setq visible-bell 1)

;; Natural reading, wrap at the word
(global-visual-line-mode t)
(setq-default word-wrap 1)

;; Some basic keybindings
(global-set-key \[delete\] 'delete-char) ; Set up the keyboard for <delete>
(global-set-key \[home\] 'beginning-of-line)
(global-set-key \[end\] 'end-of-line) ; Use Home & End key

;; I love killing buffers easily
(global-set-key \[(control q)\] 'kill-this-buffer)

;; I use bookmarks to navigate to my files
(global-set-key \[f5\] 'bookmark-bmenu-list)

;; Typing in my native language without messing up my emacs shortcuts
(setq default-input-method "greek") ; Change layout with C-\\

;; I use this directory as my base all the time
(setq default-directory "/home/nick/org/" )
```


## 2. Gnus setup for mail
The configuration is split in two parts. The first part goes into the emacs config (~/.emacs or init.el).

```lisp
(setq gnus-select-method
'(nnimap "gmail" (nnimap-address "imap.gmail.com")
; it could also be imap.googlemail.com if that's your server.
(nnimap-server-port 993) (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it smtpmail-starttls-credentials
'(("smtp.gmail.com" 587 nil nil))
smtpmail-auth-credentials
'(("smtp.gmail.com" 587 "your_email@gmail.com" nil))
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-local-domain "yourdomain")

(global-set-key [f8] 'gnus)
```

The second file should be created, the ~/.authinfo, which will contain sensitive login info. It is better to have this encrypted, so save it as ~/.authinfo.gpg. Below is the file's contents:

`machine imap.gmail.com login youremail password secret port 993`

Just edit the *youremail* and *secret* with your email and password.

### **Some basic gnus keybindings:**

- g : Refresh list of mapi folders
- RET : Open a folder or a message
- c : Catch up with a folder (all items marked read)
- B-DEL : Delete a message
- l : Show only subscribed folders
- L : Show all folders

## Quick opening emacs on command-line

Add this alias into .bashrc to open emacs in terminal mode without loading the configuration
`alias em="emacs -nw -q -l"`

## Errors and solutions
### Cannot install package
🐛I got an error installing doom-modeline (file-error "melpa.org/packages/doom-modeline-20200513.1103.tar" "Not found")

Apparently you have to run: `package-refresh-contents`

from: https://github.com/flycheck/flycheck/issues/744

### Refile subtree raises error
🐛Debugger entered–Lisp error: (invalid-function org-preserve-local-variables)

`cd ~/.emacs.d/elpa find org*/*.elc -print0 | xargs -0 rm`

from: https://github.com/syl20bnr/spacemacs/issues/11801

## Doom emacs

https://github.com/hlissner/doom-emacs#prerequisites

Run the following commands on your home dir after you rename your `~/.emacs.d `and `~/.emacs`

```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

Read the getting started guide: https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org

* Configuration: ~/.doom.d/config.el (private configuration)
* Configuration: ~/.doom.d/packages.el (package management)

### Windows installation 
* Tutorial: https://earvingad.github.io/posts/doom_emacs_windows/
* ripgrep and fd installed by chocolatey and kept into `C:\ProgramData\chocolatey\lib`
* https://chocolatey.org/
* Manually install ttf fonts of all-the-icons. They are in `C:\Users\nick\.emacs.d\.local\straight\repos\all-the-icons.el\fonts`
* Dictionary installation is tricky. Did not make it: https://nb.balaji.blog/posts/emacs-tools-integration-spellcheck/

### Other
* https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
* https://tecosaur.github.io/emacs-config/config.html
* [niyumard/Doom-Emacs-Cheat-Sheet](https://github.com/niyumard/Doom-Emacs-Cheat-Sheet)

## Blogs
* <https://www.emacs.dyerdwelling.family>

## Articles & Links
- [Absolute beginners guide to emacs by Jessica Hamrick](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
- https://www.mtsolitary.com/20210309194647-my-org-mode-setup/
- https://leanpub.com/markdown-mode
- [J.Wiegley emacs configs](https://github.com/jwiegley/dot-emacs)
* [Use GNU Emacs](https://www2.lib.uchicago.edu/keith/emacs/)

- [Guide for installing org-roam into doom-emacs](https://ianjones.us/own-your-second-brain)
- [Install doom-emacs on Windows](https://earvingad.github.io/posts/doom_emacs_windows/)
- [Emacs on Windows](https://caiorss.github.io/Emacs-Elisp-Programming/Emacs_On_Windows.html)
* [Org-roam & windows](https://earvingad.github.io/posts/org_roam_windows/)
- [Getting Started with Org Roam - Build a Second Brain in Emacs - Invidious](https://yewtu.be/watch?v=AyhPmypHDEw)
- [A How to on taking notes in org-mode](https://blog.jethro.dev/posts/how_to_take_smart_notes_org/)
- [EMFY-emacs for you configuration](https://github.com/susam/emfy)
    - I'm already using some of those cool config options
- [https://www.mtsolitary.com/20210309194647-my-org-mode-setup/](https://www.mtsolitary.com/20210309194647-my-org-mode-setup/)
- [https://leanpub.com/markdown-mode](https://leanpub.com/markdown-mode)
- [https://config.daviwil.com/emacs](https://config.daviwil.com/emacs)
- [Alex Schroeder's Emacs configuration](https://alexschroeder.ch/cgit/emacs-setup/tree/)
- [https://www.mtsolitary.com/20210309194647-my-org-mode-setup/](https://www.mtsolitary.com/20210309194647-my-org-mode-setup/)
- [https://leanpub.com/markdown-mode](https://leanpub.com/markdown-mode)
- [http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
- [https://alexschroeder.ch/wiki/2020-07-16_Emacs_everything](https://alexschroeder.ch/wiki/2020-07-16_Emacs_everything)
- [https://alexschroeder.ch/wiki/Emacs](https://alexschroeder.ch/wiki/Emacs)
- Theme: [https://git.madhouse-project.org/algernon/brutalist-theme.el](https://git.madhouse-project.org/algernon/brutalist-theme.el)
- [Ramin Honary: Emacs as a shell](http://tilde.town/~ramin_hal9001/emacs-for-professionals/emacs-as-your-shell.html)
- [Book logging in Emacs](https://getpocket.com/read/3608010494)
    - A technique to build a kind of books database using tables. Original article gone. Available only on pocket
- [TiddlyWiki and Emacs - blog.dornea.nu](https://blog.dornea.nu/2022/07/12/tiddlywiki-and-emacs/)
- [Zettelkasten, Emacs, and Creative Thinking](https://www.alexkehayias.com/essays/zettelkasten-setup/)

## Packages
- Installing Org-roam on doom: [https://ianjones.us/own-your-second-brain](https://ianjones.us/own-your-second-brain)
- Installing doom on Windows: [https://earvingad.github.io/posts/doom_emacs_windows/](https://earvingad.github.io/posts/doom_emacs_windows/)
- Getting Started with Org Roam :[https://yewtu.be/watch?v=AyhPmypHDEw](https://yewtu.be/watch?v=AyhPmypHDEw)
- All packages project: [https://github.com/emacs-tw/awesome-emacs](https://github.com/emacs-tw/awesome-emacs)
- Emacs On Windows: [https://caiorss.github.io/Emacs-Elisp-Programming/Emacs_On_Windows.html](https://caiorss.github.io/Emacs-Elisp-Programming/Emacs_On_Windows.html)
- [Viper mode (Vi, included mode)](https://www.gnu.org/software/emacs/manual/html_mono/viper.html)

