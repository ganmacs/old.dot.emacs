(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1")) ;; 使いたい色を設定、repeatしてくれる

;; 適宜keybindの設定
(global-set-key (kbd "C-9") 'highlight-symbol-at-point)
(global-set-key (kbd "M-9") 'highlight-symbol-remove-all)
