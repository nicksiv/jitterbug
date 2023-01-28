
;;My custom Tiddlywiki files handler============================================================
;;26 Sept 2022
;;----------------------------------------------------------------------------------------------

;Connect tid files to ORG MODE
(add-to-list 'auto-mode-alist '("\\.tid\\'" . org-mode))

;I couldn't do anything about the tiddlywiki custom highlighting yet. So I format the field names of the tiddler front matter to stand out.
(make-face 'org-special-words)
(set-face-attribute 'org-special-words nil :foreground "#8F3F71")
(let ((pattern "\\<\\(type:\\|created:\\|creator:\\|modifier:\\|modified:\\|tags:\\|\.TODO\\|title:\\)"))
  (mapc
   (lambda (mode)
     (font-lock-add-keywords mode `((,pattern 1 'org-special-words prepend))))
   '(org-mode markdown-mode ledger-mode)))

;;Set wiki tiddlers folder
(setq twiki "~/Documents/wiki/tiddlers/")


;====Borrowed this from https://github.com/whacked/tiddlywiki-org and made some modifications===
(defun tiddlywiki-update-modified-time ()
  (when (string= "tid" (file-name-extension (buffer-file-name)))
    (save-excursion
      (beginning-of-buffer)
      (search-forward "modified: ")
      (delete-region (point) (line-end-position))
      (insert (tiddlywiki-timestamp)))

    ))

(add-hook 'before-save-hook 'tiddlywiki-update-modified-time)

(defun tiddlywiki-timestamp ()
  (format-time-string "%Y%m%d%H%M%S%3N"))

(defun tiddlywiki-org-mode-tiddler-preamble (title)
  "returns a default preamble section for org-mode content type"
  (format "created: %s
creator: nick
modified: %s
modifier: nick
tags: 
title: %s
type: %s"
          (tiddlywiki-timestamp)
          (tiddlywiki-timestamp)
          title
          "text/vnd.tiddlywiki"))
;==============================================================


; Tiddlywiki Links handling. If there is a | character they don't look good, but they open
(defun org-pass-link-to-system (link)

  (message "%s" (propertize link 'face '(:foreground "red")))
					;If there is a colon | do split and get second part
					;else get whole

(if (eq (string-match "|" link) nil)
(setq thelink link)
(setq thelink (substring (substring link  (string-match (regexp-quote "|") link) (length link)) 1))
)

; Check if its https to open link
(if (eq (string-match "http" thelink) nil)
    (find-file (expand-file-name (concat thelink ".tid") twiki))
    (browse-url thelink) 
)

  )

(add-hook 'org-open-link-functions 'org-pass-link-to-system)




;; Create new tiddler. By default I add a timestamp
(defun tiddlywikiNew ()
  (interactive)
  (setq my-org-note--name (read-string "Filename: "))
  (setq my-org-note--time (format-time-string "%Y%m%d"))
  (find-file (concat (file-name-as-directory twiki) (format "%s %s.tid" my-org-note--time my-org-note--name) )   )

(insert
   (format
    "%s\n\n"
    (tiddlywiki-org-mode-tiddler-preamble (format "%s %s" my-org-note--time my-org-note--name) )))
  )

;Some hotkeys
(global-set-key (kbd "C-c n") (lambda() (interactive) (tiddlywikiNew)))
(global-set-key (kbd "C-c t") (lambda () (interactive) (cd twiki) (call-interactively 'find-file)))

;;DIRED specific
(global-set-key (kbd "C-<f5>") (lambda () (interactive) (dired twiki)   ))

(setq dired-listing-switches "-lAG --ignore=.* --ignore=\\#* --ignore=*~ --ignore=\\$*")


;;Move opened file

(defun tw-move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (expand-file-name
                      (if buffer-file-name
                          (read-file-name "Move file to: ")
                        (read-file-name "Move file to: "
                                        default-directory
                                        (expand-file-name (file-name-nondirectory (buffer-name))
                                                          default-directory))))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))

;;Insert wiki Links
(defun tw-link ()
  (interactive)
  (insert (concat "[["  (file-name-base (read-file-name "Linkto:" twiki (expand-file-name (file-name-nondirectory (buffer-name)) twiki)))) "]]" )
  )

(global-set-key (kbd "C-c k") (lambda() (interactive) (tw-link)))



