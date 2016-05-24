(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
			   '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
			   '("mepla-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(when (executable-find "git")
  (require 'magit nil t)
  (global-set-key (kbd "C-x g") 'magit-status))

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; mini buffer
(column-number-mode t)

(size-indication-mode t)

;(setq display-time-day-and-date t)
;(display-time-mode t)

;(display-battery-mode t)

;; indentation
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

(add-hook 'c-mode-common-hook
		  (lambda ()
			(c-set-style "linux")))

;; high light
;(global-hl-line-mode t)

(setq show-paren-delay 0)
(show-paren-mode t)

;; window move
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;; config
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-config-system 'utf-8-hfs))

(when (eq system-type 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))
