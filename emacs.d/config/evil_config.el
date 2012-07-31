(provide 'evil_config)

(require 'evil)
(evil-mode t)

;; Evil Stuff
(evil-define-keymap evil-esc-map :intercept nil) ; do not interpret ESC as meta
(evil-ex-define-cmd "A" 'ff-find-other-file)     ; :A to switch between header and source
(evil-ex-define-cmd "F" 'ido-find-file)          ; :F to open file
(evil-ex-define-cmd "B" 'ido-switch-buffer)      ; :B to switch buffers
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-operator-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "ESC") 'evil-normal-state)

;(set-cursor-color "#ffffff") 
;(setq evil-insert-state-cursor '("#aa0000" hbar))

