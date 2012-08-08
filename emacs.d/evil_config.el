(provide 'evil_config)

(require 'evil)
(evil-mode t)

;; Evil Stuff
(evil-define-keymap evil-esc-map :intercept nil) ; do not interpret ESC as meta
(setq evil-auto-indent t)
(setq evil-want-C-u-scroll t) ; Needs to be before evil is loaded

;; Alternate File
(evil-ex-define-cmd "A"  'ff-find-other-file)
(evil-ex-define-cmd "AS" (lambda()
                           (interactive)
                           (split-window-below)
                           (evil-window-down 1)
                           (ff-find-other-file)))
(evil-ex-define-cmd "AV" (lambda()
                           (interactive)
                           (split-window-right)
                           (evil-window-right 1)
                           (ff-find-other-file)))

;; Ido-open file
(evil-ex-define-cmd "F" 'ido-find-file)
(evil-ex-define-cmd "FS" (lambda()
                           (interactive)
                           (split-window-below)
                           (evil-window-down 1)
                           (ido-find-file)))
(evil-ex-define-cmd "FV" (lambda()
                           (interactive)
                           (split-window-right)
                           (evil-window-right 1)
                           (ido-find-file)))

;; Buffers
(evil-ex-define-cmd "b"  'ido-switch-buffer)      ;B to switch buffers
(evil-ex-define-cmd "B"  'ido-switch-buffer)      ;B to switch buffers
(evil-ex-define-cmd "bm" 'buffer-menu)           ;Bd to open buffer menu
(evil-ex-define-cmd "bd" (lambda()
                           (interactive)
                           (kill-this-buffer)
                           (delete-window)))   ;Bd to delete buffers
(evil-ex-define-cmd "BD" 'kill-this-buffer)      ;Bd to delete buffers

;; Workgroups
(evil-ex-define-cmd "tabnew" 'wg-create-workgroup)
(evil-ex-define-cmd "tabdel" 'wg-kill-workgroup)
(evil-ex-define-cmd "tabprev" 'wg-switch-left)
(evil-ex-define-cmd "tabnext" 'wg-switch-right)
;(evil-define-key 'normal org-mode-map "gT" 'escreen-goto-prev-screen)
;(evil-define-key 'normal org-mode-map "gt" 'escreen-goto-next-screen)
(define-key evil-normal-state-map "J" 'wg-switch-left)
(define-key evil-normal-state-map "K" 'wg-switch-right)

(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-operator-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "ESC") 'evil-normal-state)

;(set-cursor-color "#ffffff")
;(setq evil-insert-state-cursor '("#aa0000" hbar))

;; Org Mode settings
(evil-define-key 'normal org-mode-map
  (kbd "RET") 'org-open-at-point
  "za" 'org-cycle
  "zA" 'org-shifttab
  "zm" 'hide-body
  "zr" 'show-all
  "zo" 'show-subtree
  "zO" 'show-all
  "zc" 'hide-subtree
  "zC" 'hide-all
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'normal orgstruct-mode-map
  (kbd "RET") 'org-open-at-point
  "za" 'org-cycle
  "zA" 'org-shifttab
  "zm" 'hide-body
  "zr" 'show-all
  "zo" 'show-subtree
  "zO" 'show-all
  "zc" 'hide-subtree
  "zC" 'hide-all
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert org-mode-map
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert orgstruct-mode-map
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)