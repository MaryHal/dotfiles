(provide 'misc)

;; Thematic configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(line-number-mode 1)   ; have line numbers and
(column-number-mode 1) ; column numbers in the mode line

;; Fonts
(set-frame-font "Inconsolata 10")
;(load-theme 'zenburn t)

;;; Other
;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Place Backup Files in a Specific Directory
(setq make-backup-files t)
(setq backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))

;; Ido-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;; Keys
;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; switch buffers like other applications
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;; Evil Stuff
(evil-define-keymap evil-esc-map :intercept nil) ; do not interpret ESC as meta
(evil-ex-define-cmd "A" 'ff-find-other-file)     ; :A to switch between header and source
(evil-ex-define-cmd "F" 'ido-find-file)          ; :F to open file
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-operator-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "ESC") 'evil-normal-state)

(set-cursor-color "#ffffff") 
(setq evil-insert-state-cursor '("#aa0000" hbar))

