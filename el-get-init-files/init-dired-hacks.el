(require 'dired-subtree)
(define-key dired-mode-map (kbd "i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "I") 'dired-subtree-remove)

(require 'dired-filter)


(require 'dired-narrow)
(define-key dired-mode-map (kbd ";") 'dired-narrow)
