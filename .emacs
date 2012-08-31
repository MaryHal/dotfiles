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
   switch-window
   color-theme
   color-theme-twilight
   auto-complete
   auto-complete-clang
   auto-complete-emacs-lisp
   auto-complete-yasnippet
   yasnippet
   workgroups
   powerline
   magit
   lua-mode
   haskell-mode))

(el-get 'sync)

(require 'magit)

(require 'workgroups)
;(workgroups-mode 1)

;; Personal Stuff
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'c_common_config)
(require 'evil_config) ; uses evil
(require 'theme)       ; uses color-theme, color-theme-twilight, powerline

; Uses auto-complete-config, auto-complete-clang,
; auto-complete-yasnippet, yasnippet, auto-complete-emacs-lisp
(require 'autocomplete)

(require 'func)
(require 'keybindings)
(require 'misc)

(require 'copypaste_term)

