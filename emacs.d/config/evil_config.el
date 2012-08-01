(provide 'evil_config)

(require 'evil)
(evil-mode t)

;; Evil Stuff
(evil-define-keymap evil-esc-map :intercept nil) ; do not interpret ESC as meta

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

;; Escreen
(evil-ex-define-cmd "tabnew" 'escreen-create-screen)
(evil-ex-define-cmd "tabdel" 'escreen-kill-screen)
(evil-ex-define-cmd "tabprev" 'escreen-goto-prev-screen)
(evil-ex-define-cmd "tabnext" 'escreen-goto-next-screen)
;(evil-define-key 'normal org-mode-map "gT" 'escreen-goto-prev-screen)
;(evil-define-key 'normal org-mode-map "gt" 'escreen-goto-next-screen)
(define-key evil-normal-state-map "J" 'escreen-goto-prev-screen)
(define-key evil-normal-state-map "K" 'escreen-goto-next-screen)

(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-operator-state-map (kbd "ESC") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "ESC") 'evil-normal-state)

;(set-cursor-color "#ffffff")
;(setq evil-insert-state-cursor '("#aa0000" hbar))

;; Org Mode settings
(defun always-insert-item ()
     (interactive)
     (if (not (org-in-item-p))
       (insert "\n- ")
       (org-insert-item)))

(evil-define-key 'normal org-mode-map "O" (lambda ()
                     (interactive)
                     (end-of-line)
                     (org-insert-heading t)
                     (evil-append nil)
                     ))

(evil-define-key 'normal org-mode-map "o" (lambda ()
                     (interactive)
                     (end-of-line)
                     (always-insert-item)
                     (evil-append nil)
                     ))

(evil-define-key 'normal org-mode-map "t" 'org-todo) ; mark a TODO item as DONE
(evil-define-key 'normal org-mode-map "-" 'org-cycle-list-bullet) ;
;;change bullet style

;; (evil-define-key 'normal org-mode-map "L" 'org-shiftright)
;; (evil-define-key 'normal org-mode-map "H" 'org-shiftleft)
;; (evil-define-key 'normal org-mode-map "K" 'org-shiftup)
;; (evil-define-key 'normal org-mode-map "J" 'org-shiftdown)
(evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaright)
(evil-define-key 'normal org-mode-map (kbd "M-h") 'org-metaleft)
(evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)
(evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "M-L") 'org-shiftmetaright)
(evil-define-key 'normal org-mode-map (kbd "M-H") 'org-shiftmetaleft)
(evil-define-key 'normal org-mode-map (kbd "M-K") 'org-shiftmetaup)
(evil-define-key 'normal org-mode-map (kbd "M-J") 'org-shiftmetadown)

