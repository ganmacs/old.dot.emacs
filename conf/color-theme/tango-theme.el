(deftheme tango
  "tango color theme")

(custom-theme-set-faces
 'tango
 ;; 背景・文字・カーソル
 '(default ((t (:background "#020202" :foreground "#eeeeec"))))
 '(mouse ((t (:foregound "#8ae234"))))
 '(cursor ((t (:foregound "#fce94f"))))
; '(background-mode . dark)
 ;; '(help-highlight-face . underline)
 ;; '(ibuffer-dired-buffer-face . font-lock-function-name-face)
 ;; '(ibuffer-help-buffer-face . font-lock-comment-face)
 ;; '(ibuffer-hidden-buffer-face . font-lock-warning-face)
 ;; '(ibuffer-occur-match-face . font-lock-warning-face)
 ;; '(ibuffer-read-only-buffer-face . font-lock-type-face)
 ;; '(ibuffer-special-buffer-face . font-lock-keyword-face)
 ; '(ibuffer-title-face . font-lock-type-face))
 '(border ((t (:background "#888a85"))))
 '(fringe ((t (:background "grey10"))))
 '(mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
 '(region ((t (:background "#555753"))))
 '(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 '(font-lock-comment-face ((t (:foreground "#888a85"))))
 '(font-lock-constant-face ((t (:foreground "#8ae234"))))
 '(font-lock-doc-face ((t (:foreground "#888a85"))))
 '(font-lock-keyword-face ((t (:foreground "#729fcf" :bold t))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8" :italic t))))
 '(font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
 '(font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
 '(font-lock-warning-face ((t (:bold t :foreground "#f57900"))))
 '(font-lock-function-name-face ((t (:foreground "#edd400" :bold t :italic t))))
 '(comint-highlight-input ((t (:italic t :bold t))))
 '(comint-highlight-prompt ((t (:foreground "#8ae234"))))
 '(isearch ((t (:background "#f57900" :foreground "#2e3436"))))
 '(isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
 '(show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
 '(show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
 '(minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
 '(info-xref ((t (:foreground "#729fcf"))))
 '(info-xref-visited ((t (:foreground "#ad7fa8"))))
)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tango)