(yas-global-mode 1)
(setq yas/prompt-functions '(yas/dropdown-prompt))

(setq yas-snippet-dirs '(;; my snippets dir
                         "~/.emacs.d/snippets"
                         ;; bundled snippets dirs
                         "~/.emacs.d/plugins/yasnippet/extras/imported"
                         "~/.emacs.d/plugins/yasnippet/snippets"))
