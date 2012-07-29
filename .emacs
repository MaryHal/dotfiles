(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(setq
 el-get-sources
 '(el-get
   evil
   zenburn-theme
   switch-window
   auto-complete
   auto-complete-clang
   yasnippet))

(el-get 'sync)

(require 'evil)
(evil-mode t)

(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/el-get/yasnippet/snippets")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
;(ac-config-default)
(require 'auto-complete-clang)
(require 'auto-complete-yasnippet)

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

(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
;;(ac-set-trigger-key "TAB")
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)

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

(require 'magit)

;; Personal Stuff
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'c_config)
(require 'func)
(require 'misc)
(require 'copypaste_term)

