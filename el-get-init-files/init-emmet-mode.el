(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'rhml-mode  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'scss-mode  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'text-mode-hook 'emmet-mode)
;; (add-hook 'php-mode-hook 'emmet-mode)

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

;; (eval-after-load "emmet-mode"
;;   ') ;; C-j は newline のままにしておく
(eval-after-load "emmet-mode"
  '(progn     ;; Preview is disable as default
     (setq emmet-preview-default nil)
     (define-key emmet-mode-keymap (kbd "C-j") nil)
     (define-key emmet-mode-keymap (kbd "s-i") 'emmet-expand-line)
     ))
