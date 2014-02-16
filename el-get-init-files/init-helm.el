(require 'helm-config)
(require 'helm-files)

(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-i") 'helm-imenu)
(global-set-key (kbd "C-x C-h j") 'helm-c-apropos)

;; C-h でバックスペースと同じように文字を削除できるようにする
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; (global-set-key (kbd "M-o") 'helm-occur)
;; (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
;; (define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur) ;; helm-occurからall-extに受け渡し
;; 指定されていなければ、:default の値を使って表示を更新する）を設定する
;; (defadvice helm-occur (around ad-helm-occur activate)
;;   (let ((helm-maybe-use-default-as-input t))
;;     ad-do-it))


;; ミニバッファで C-k 入力時にカーソル以降を削除する（C-u C-k でも同様の動きをする）
(setq helm-delete-minibuffer-contents-from-point t)

;; 自動補完を無効にする
(setq helm-ff-auto-update-initial-value nil)
