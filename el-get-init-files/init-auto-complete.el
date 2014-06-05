(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(custom-set-variables
 '(ac-use-fuzzy t)
 '(ac-dwim t)
 '(ac-use-menu-map t))

(setq ac-comphist-file (concat user-emacs-directory "log/ac-comphist.dat"))
(add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(append-to-list 'ac-modes
                html-mode
                haml-mode
                eshell-mode
                markdown-mode)
