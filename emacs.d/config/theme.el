(provide 'theme)

(require 'color-theme)
(require 'color-theme-twilight)
(color-theme-twilight)

(unless window-system
  (when (getenv "DISPLAY")
    (set-face-attribute 'default nil :background "unspecified-bg")
    ;; Fonts
    (set-frame-font "Inconsolata 12")
    ))

;; Thematic configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(line-number-mode 1)   ; have line numbers and
(column-number-mode 1) ; column numbers in the mode line

(setq-default indent-tabs-mode nil) ; No tabs
(setq-default show-trailing-whitespace t)

