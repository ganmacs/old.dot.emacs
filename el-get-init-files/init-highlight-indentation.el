(require 'highlight-indentation)

(add-hook-lambda 'ruby-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'coffee-mode-hook
                 (highlight-indentation-current-column-mode))

;; (add-hook-lambda 'web-mode-hook
;;           (lambda () (highlight-indentation-current-column-mode)))

(add-hook-lambda 'js2-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'rhtml-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'enh-ruby-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'clojure-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'java-mode-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'python-mode-hook
                 (highlight-indentation-current-column-mode))


(add-hook-lambda 'c-mode-common-hook
                 (highlight-indentation-current-column-mode))

(add-hook-lambda 'scheme-mode-hook
                 (highlight-indentation-current-column-mode))

(set-face-background 'highlight-indentation-current-column-face "#222")

(highlight-indentation-current-column-mode)
