(require 'helm-swoop)

(global-set-key (kbd "M-o") 'helm-swoop)
(global-set-key (kbd "M-O") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c c-o") 'Helm-multi-swoop)
(global-set-key (kbd "C-c M-o") 'helm-multi-swoop-all)

;; isearch実行中にhelm-swoopに移行
(define-key isearch-mode-map (kbd "C-o") 'helm-swoop-from-isearch)
;; helm-swoop実行中にhelm-multi-swoop-allに移行
(define-key helm-swoop-map (kbd "M-o") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save nil)

;; 値がtの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
(setq helm-swoop-split-with-multiple-windows nil)

;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
(setq helm-swoop-speed-or-color nil)
