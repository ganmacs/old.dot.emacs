(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "#fce94f" :weight 'bold)

(setq anzu-search-threshold 1000)

(global-set-key (kbd "C-%") 'anzu-replace-at-cursor-thing)
(global-set-key (kbd "M-%") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "s-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
