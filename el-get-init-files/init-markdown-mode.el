(require 'markdown-mode)

;; (custom-set-variables
;;     '(markdown-open-command "/Applications/Marked2.app/Contents/Resources/mark"))

(eval-after-load 'markdown-mode
  '(progn
     (define-key markdown-mode-map (kbd "M-p") nil)
     (define-key markdown-mode-map (kbd "M-n") nil)
     ))

;; githubflavar-mode用
(defadvice delete-trailing-whitespace (around disable-in-markdown activate)
  (unless (eq major-mode 'markdown-mode)
    ad-do-it))


;; kobito連携
(defun kobito-preview-file ()
  "run Kobito on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a Kobito.app %s"
           (shell-quote-argument (buffer-file-name)))))
(define-key markdown-mode-map (kbd "C-c k") 'kobito-preview-file)

(defun marked-preview-file ()
  "run Kobito on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a Marked %s"
           (shell-quote-argument (buffer-file-name)))))
(define-key markdown-mode-map (kbd "C-c C-c o") 'marked-preview-file)
