(provide 'misc)

;; Place Backup Files in a Specific Directory
(setq make-backup-files t)
;(setq backup-directory-alist (quote ("." . "~/.emacs.d/backups")))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Ido-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-save-directory-list-file "~/.emacs.d/cache/ido.last")
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)

;; Dired uses human readable sizes.
(setq dired-listing-switches "-alh")

;;; Keys
;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

(global-set-key [kp-delete] 'delete-char)

;; switch buffers like other applications
;(global-set-key (kbd "<C-tab>") 'bury-buffer)

