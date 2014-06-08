(require 'robe)
(require 'ac-robe)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (robe-mode)
             (ac-robe-setup)
             ))
