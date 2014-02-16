(add-hook 'php-mode-hook
          (lambda ()
            (define-key php-mode (kbd "C-m") 'forward-char)
            (define-key php-mode (kbd "C-") 'other-window)
            (c-set-offset 'case-label' 4)
            (c-set-offset 'arglist-intro' 4)
            (c-set-offset 'arglist-cont-nonempty' 4)
            (c-set-offset 'arglist-close' 0)))
