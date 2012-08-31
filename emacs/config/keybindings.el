(provide 'keybindings)

;; Easier version of "C-x k" to kill buffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)

;; Evaluate Buffer
;(global-set-key (kbd "C-c C-e") 'eval-buffer)

;; Commentin'
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
