---
title: Vim editor
date: 2022-01-21
icon: ✏️
lastmod: 2022-01-21
---


## Markdown support
- https://secluded.site/vim-as-a-markdown-editor/

## Plugins
- [Managing plugins in Vim](https://gist.github.com/manasthakur/ab4cf8d32a28ea38271ac0d07373bb53)

## Other
-[Building a Note-taking System with Vanilla Vim](https://www.edwinwenink.xyz/posts/42-vim_notetaking/)


## My Basic config

```
syntax on
colorscheme peachpuff
set autoindent
set hlsearch

"Move line up & down"
nmap <C-UP> :m-2<CR>  
nmap <C-DOWN> :m+1<CR>
```


## Cheatsheet

Cursor movement (Inside command/normal mode)

The four directions in Vim, keys h, j, k, and l.

    w - jump by start of words (punctuation considered words)
    W - jump by words (spaces separate words)
    e - jump to end of words (punctuation considered words)
    E - jump to end of words (no punctuation)
    b - jump backward by words (punctuation considered words)
    B - jump backward by words (no punctuation)
    0 - (zero) start of line
    ^ - first non-blank character of line (same as 0w)
    $ - end of line
    Advanced (in order of what I find most useful)
        Ctrl+d - move down half a page
        Ctrl+u - move up half a page
        } - go forward by paragraph (the next blank line)
        { - go backward by paragraph (the next blank line)
        gg - go to the top of the page
        G - go the bottom of the page
        : [num] [enter] - Go to that line in the document
        Searching
            f [char] - Move to the next char on the current line after the cursor
            F [char] - Move to the next char on the current line before the cursor
            t [char] - Move to before the next char on the current line after the cursor
            T [char] - Move to before the next char on the current line before the cursor
            All these commands can be followed by ; (semicolon) to go to the next searched item, and , (comma) to go the previous searched item

Insert/Appending/Editing Text

    Results in Insert mode
        i - start insert mode at cursor
        I - insert at the beginning of the line
        a - append after the cursor
        A - append at the end of the line
        o - open (append) blank line below current line (no need to press return)
        O - open blank line above current line
        cc - change (replace) an entire line
        c [movement command] - change (replace) from the cursor to the move-to point.
        ex. ce changes from the cursor to the end of the cursor word
    Esc or Ctrl+[ - exit insert mode
    r [char] - replace a single character with the specified char (does not use Insert mode)
    d - delete
        d - [movement command] deletes from the cursor to the move-to point.
        ex. de deletes from the cursor to the end of the current word
    dd - delete the current line
    Advanced
        J - join line below to the current one

Marking text (visual mode)

    v - starts visual mode
        From here you can move around as in normal mode (h, j, k, l etc.) and can then do a command (such as y, d, or c)
    V - starts linewise visual mode
    Ctrl+v - start visual block mode
    Esc or Ctrl+[ - exit visual mode
    Advanced
        O - move to other corner of block
        o - move to other end of marked area

Visual commands

Type any of these while some text is selected to apply the action

    y - yank (copy) marked text
    d - delete marked text
    c - delete the marked text and go into insert mode (like c does above)

    (Copy from terminal to linux clipboard: Select with mouse and then Ctrl+Shift+C)

Cut and Paste

    yy - yank (copy) a line
    p - put (paste) the clipboard after cursor
    P - put (paste) before cursor
    dd - delete (cut) a line
    x - delete (cut) current character
    X - delete previous character (like backspace)

Exiting

    :w - write (save) the file, but don’t exit
    :wq - write (save) and quit
    :q - quit (fails if anything has changed)
    :q! - quit and throw away changes

Search/Replace

    /pattern - search for pattern
    ?pattern - search backward for pattern
    n - repeat search in same direction
    N - repeat search in opposite direction
    :%s/old/new/g - replace all old with new throughout file (gn is better though)
    :%s/old/new/gc - replace all old with new throughout file with confirmations

Working with multiple files

    :e filename - Edit a file
    :tabe - Make a new tab
    gt - Go to the next tab
    gT - Go to the previous tab
    Advanced
        :vsp - vertically split windows
        ctrl+ws - Split windows horizontally
        ctrl+wv - Split windows vertically
        ctrl+ww - switch between windows
        ctrl+wq - Quit a window

Marks

Marks allow you to jump to designated points in your code.

    m{a-z} - Set mark {a-z} at cursor position
    A capital mark {A-Z} sets a global mark and will work between files
    ‘{a-z} - move the cursor to the start of the line where the mark was set
    ‘’ - go back to the previous jump location

General

    u - undo
    Ctrl+r - redo
    . - repeat last command


# Read also
- [TextEditors Wiki: HomePage](https://texteditors.org/cgi-bin/wiki.pl)