(provide 'theme)

(require 'color-theme)
(require 'color-theme-twilight)
(color-theme-twilight)
(set-face-attribute 'default nil :background "unspecified-bg")

;; Fonts
(set-frame-font "Inconsolata 10")

;; Thematic configuration
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(line-number-mode 1)   ; have line numbers and
(column-number-mode 1) ; column numbers in the mode line

(setq-default indent-tabs-mode nil) ; No tabs

