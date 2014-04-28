(require 'highlight-indentation)

(add-hook 'ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
;; (add-hook 'web-mode-hook
;;           (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'js2-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'rhtml-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'clojure-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'java-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'python-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'c-mode-common-hook
           (lambda () (highlight-indentation-current-column-mode)))

(set-face-background 'highlight-indentation-current-column-face "#222")

(highlight-indentation-current-column-mode)
