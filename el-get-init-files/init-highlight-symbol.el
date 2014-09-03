(require 'highlight-symbol)
;; (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1"))

;; 適宜keybindの設定
(global-set-key (kbd "C-0") 'highlight-symbol-at-point)
(global-set-key (kbd "M-0") 'highlight-symbol-remove-all)
