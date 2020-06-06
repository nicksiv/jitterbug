---
title: "Resetting my emacs config"
date: "2017-09-30"
---

 

I should tell you that I'm an emacs user for some years now. Too little to be an expert and too many to be able to use anything else. For an emacs user the config file is the most vital part of the whole system. All the customizations are kept in there and wiping it out can be a dreadful and liberating experience. Especially if you are a novice user and keep adding various snippets from lots of different sources. There is a time, when you know exactly what each config line does and you start creating your own config for your specific needs. That's one of the emacs beauties. In my case I would like to show you my essentials-only config, before setting up anything else.

So after installing emacs, I just open a file with the magic shortcut (Cx-Cf) and enter ~/.emacs to create my new configuration.

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
(global-set-key \[end\] 'end-of-line) ; Use \[Home\] & \[End\] key

;; I love killing buffers easily
(global-set-key \[(control q)\] 'kill-this-buffer)

;; I use bookmarks for years. My preferred way to navigate to my files
(global-set-key \[f5\] 'bookmark-bmenu-list)

;; Typing in my native language without messing up my emacs shortcuts
(setq default-input-method "greek") ; Change layout with C-\\

;; I use this directory as my base all the time
(setq default-directory "/home/nick/org/" )

 

That was my pretty basic configuration. You may take what you want from it.
