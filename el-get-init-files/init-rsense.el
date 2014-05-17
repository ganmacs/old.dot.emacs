(setq rsense-home "/usr/local/Cellar/rsense/0.3/libexec/")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(add-hook-lambda 'ruby-mode-hook
                 ;; .や::を入力直後から補完開始
                 (add-to-list 'ac-sources 'ac-source-rsense-method)
                 (add-to-list 'ac-sources 'ac-source-rsense-constant)
                 ;; C-x .で補完出来るようキーを設定
                 (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense))
