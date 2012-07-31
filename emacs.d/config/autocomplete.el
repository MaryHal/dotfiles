(provide 'autocomplete)

(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'auto-complete-yasnippet)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")

;(ac-config-default)

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1/x86_64-unknown-linux-gnu
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/../../../../include/c++/4.7.1/backward
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include-fixed
 /usr/include
"
               )))

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev
			     ac-source-dictionary
			     ac-source-filename
			     ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  ;; (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(ac-set-trigger-key "TAB")
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)

;; Key mappings
(setq ac-use-menu-map t)

;(define-key ac-menu-map "\C-n" 'ac-next)
;(define-key ac-menu-map "<backtab>" 'ac-previous)

