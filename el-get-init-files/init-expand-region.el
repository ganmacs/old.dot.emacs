;; transient-mark-modeが nilでは動作しない
(transient-mark-mode t)

(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める
