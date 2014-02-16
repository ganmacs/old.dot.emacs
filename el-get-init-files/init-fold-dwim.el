(require 'fold-dwim)

;; ruby用の設定
(let ((ruby-mode-hs-info
       '(ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))

(global-set-key (kbd "<f7>")      'fold-dwim-toggle)
(global-set-key (kbd "<s-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<M-f7>")  'fold-dwim-show-all)
(global-set-key (kbd "<C-f7>")  'hs-hide-level)

(add-hook 'ruby-mode-hook 'hs-minor-mode)
(add-hook 'js2-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
