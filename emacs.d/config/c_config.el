(provide 'c_config)

(defun c-mode-common-custom ()
  (setq c-default-style "linux") ; linux-kernel-developers style indentation
  (setq c-basic-offset 4)        ; 4-space tab size
  (setq c-indent-level 4)
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  )

(add-hook 'c-mode-common-hook 'c-mode-common-custom)
