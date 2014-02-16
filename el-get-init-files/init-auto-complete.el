(require 'auto-complete)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

;;背景色
(set-face-background 'ac-candidate-face "#eee")
;;前景
(set-face-foreground 'ac-candidate-face "black")
;;選択時の色
(set-face-background 'ac-selection-face "royalblue")
(set-face-foreground 'ac-selection-face "black")

;; auto-complete: 補完リストをCtrl-n, Ctrl-pで上下
(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; 補完選択時にTABがRETの挙動に変化する
;; 補完候補が一つしかないときにTABをするとRETの挙動になる
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;適用するメージャーモード
(setq ac-modes (append '(
                         html-mode
                         js2-mode
                         ruby-mode
                         css-mode
                         coffee-mode
                         haml-mode
                         lisp-mode
                         emacs-lisp-mode
                         python-mode
                         php-mode
                         clojure-mode
                         web-mode
                         eshell-mode
                         java-mode
                         )))


;;ベースとなるソースを指定
(defvar my-ac-sources '(ac-source-yasnippet
                        ac-source-words-in-all-buffer))

;; enabled in coding-mode
(defun my-coding-mode ()
  (auto-complete-mode)
  (setq ac-sources my-ac-sources))

(defun my-css-mode ()
  (setq ac-sources (append
                    '(ac-source-css-property)
                    my-ac-sources)))

;;適用するメージャーモードのソースのしてい
(add-hook 'css-mode-hook  'my-css-mode)
(add-hook 'html-mode-hook 'my-coding-mode)
(add-hook 'js2-mode-hook  'my-coding-mode)
(add-hook 'lisp-mode-hook  'my-coding-mode)
(add-hook 'emacs-lisp-mode-hook  'my-coding-mode)
(add-hook 'coffee-mode-hook  'my-coding-mode)
(add-hook 'ruby-mode-hook  'my-coding-mode)
(add-hook 'php-mode-hook  'my-coding-mode)
(add-hook 'haml-mode-hook  'my-coding-mode)
(add-hook 'python-mode-hook 'my-coding-mode)
(add-hook 'clojure-mode-hook 'my-coding-mode)
(add-hook 'web-mode-hook 'my-coding-mode)
(add-hook 'java-mode-hook 'my-coding-mode)

;; 履歴の場所
(setq ac-comphist-file "~/.emacs.d/log/ac-comphist.dat")
