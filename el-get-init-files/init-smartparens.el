(require 'smartparens-config)

(smartparens-global-mode t)
(show-smartparens-global-mode t)

(sp-pair "(" ")" :wrap "C-(")
(global-set-key (kbd "C-S-k") 'sp-kill-hybrid-sexp)
(global-set-key (kbd "s-T") 'sp-transpose-hybrid-sexp)
(global-set-key (kbd "C-)") 'sp-slurp-hybrid-sexp)
(global-set-key (kbd "M-(") 'sp-push-hybrid-sexp)
(global-set-key (kbd "s-S-t") 'sp-transpose-hybrid-sexp)

(custom-set-faces
 '(sp-pair-overlay-face ((t (:inherit default))))
 '(sp-show-pair-match-face ((t (:background "black" :foreground "green" :weight semi-bold))))
 )

(eval-after-load "ruby-mode"
  '(progn
     (require 'smartparens-ruby)
     (define-key ruby-mode-map (kbd "C-M-p") 'chrome-scroll-up)
     (define-key ruby-mode-map (kbd "C-M-n") 'chrome-scroll-down)
     (define-key ruby-mode-map (kbd "C-M-r") 'chrome-reload)
     (define-key ruby-mode-map (kbd "s-r") 'chrome-reload)
     (define-key ruby-mode-map (kbd "C-M-f") 'chrome-next-tab)
     (define-key ruby-mode-map (kbd "C-M-b") 'chrome-previous-tab)
     ))

(eval-after-load "web-mode"
  '(progn (require 'smartparens-html)))

(eval-after-load "rhtml-mode"
  '(progn
     (require 'smartparens-html)))
