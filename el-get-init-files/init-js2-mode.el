;; js2-mode: javascript editing mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; amount of indent
(custom-set-variables
 '(js2-basic-offset 2))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "M-j") nil)
     ))
