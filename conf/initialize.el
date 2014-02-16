;; 読み込みエラーした時の最低限の設定
(provide 'initialize)

;; ホームディレクトリに移動
(cd "~/")

;; 基本のキーバインド
;; C-hをバックスペースに置き換え
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key (kbd "M-h") 'backward-kill-word)

;;C-mにnewline-and-indentを渡したので"C-."でウインドウ切り替え
(global-set-key (kbd "C-.") 'other-window)

;; 補完を再設定 M-/をre-bind
(global-set-key (kbd "C-j") 'dabbrev-expand)

;color-theme
(setq custom-theme-directory "~/.emacs.d/conf/color-theme/")
(load-theme 'tango t)
