(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(custom-set-variables
 '(ac-use-fuzzy t)
 '(ac-dwim t)
 '(ac-use-menu-map t)
 '(ac-ignore-case nil))

(setq ac-comphist-file (concat user-emacs-directory "log/ac-comphist.dat"))
(add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
(add-to-list 'ac-sources 'ac-source-yasnippet)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

(append-to-list 'ac-modes
                html-mode
                haml-mode
                eshell-mode
                markdown-mode)
