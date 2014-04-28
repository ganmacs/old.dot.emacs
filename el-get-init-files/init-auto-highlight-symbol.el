(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; high-lightする秒数
(ahs-set-idle-interval 0.001)

(setq ahs-modes (append ahs-modes
                        '(js2-mode
                          php-mode-improved
                          rthml-mode
                          web-mode
                          ruby-mode
                          clojure-mode
                          coffee-mode
                          enh-ruby-mode
                          java-mode
                          python-mode
                          scheme-mode
                          )))

(setq ahs-definition-face-list (append ahs-definition-face-list
                                       '(font-lock-constant-face)))

(custom-set-faces
 '(ahs-face ((t (:underline t))))
 '(ahs-definition-face ((t (:underline t))))
 '(ahs-plugin-defalt-face ((t (:underline t))))
 '(ahs-plugin-whole-buffer-face ((t (:underline t))))
 '(ahs-plugin-bod-face ((t (:underline t))))
 )
