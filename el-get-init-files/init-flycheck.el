(require 'flycheck)

(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; Python
(add-hook 'python-mode-hook 'flycheck-mode)

;; Ruby
(add-hook 'ruby-mode-hook 'flycheck-mode)
