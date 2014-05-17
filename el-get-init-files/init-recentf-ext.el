;; 自動保存
(require 'recentf-ext)
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 起動画面で recentf を開く
;; (add-hook 'after-init-hook (lambda()
;;     (recentf-open-files)))
