(require 'hiwin)

;; 読み取り専用の時も色をかえない
(setq hiwin-deactive-color "#222")
(setq hiwin-readonly-color "#020202")
(setq hiwin-normal-color "#020202")

(global-set-key (kbd "M-ESC ESC") 'hiwin-refresh-win)
(hiwin-mode) ; 起動時から有効にしたい場合
