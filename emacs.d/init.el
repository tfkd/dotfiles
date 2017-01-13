(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
               '("mepla-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; mini buffer
(column-number-mode t)

(size-indication-mode t)

;(setq display-time-day-and-date t)
;(display-time-mode t)

;(display-battery-mode t)

;; indentation
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

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

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; completion
(require 'auto-complete)
(require 'auto-complete-config)

;; yasnippet
(yas-global-mode 1)

;; magit
(when (executable-find "git")
  (require 'magit nil t)
  (global-set-key (kbd "C-x g") 'magit-status))

;; helm
;; http://emacs.rubikitch.com/sd1504-helm/
(setq recentf-max-saved-items 500)
(setq recentf-exclude
      '("/TAGS$" "/var/tmp"))
(require 'recentf-ext)
(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir))
(require 'helm-config)

(define-key global-map (kbd "C-x M-f") 'helm-for-files)

;; gtags
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-prefix-key " M-g")
 '(helm-gtags-suggested-key-mapping t)
 '(package-selected-packages
   (quote
    (protobuf-mode markdown-mode helm-gtags helm magit jedi go-mode go-autocomplete ensime))))
(require 'helm-gtags)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)

;; golang
(require 'go-autocomplete)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kdb "M-.") 'godef-jump)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; scala
(require 'scala-mode)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(setq ensime-completion-style 'auto-complete)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
