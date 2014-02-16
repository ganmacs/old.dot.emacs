(add-to-list 'load-path "~/.emacs.d/el-get/jdee/lisp")

(load "jde-autoload")

(defun my-jde-mode-hook ()
  (require 'jde)

  (setq jde-build-function 'jde-ant-build) ; ビルドにantを利用する
  (setq jde-ant-read-target t)             ; targetを問い合わせる
  (setq jde-ant-enable-find t)             ; antに-findオプションを指定する(要らないかも)

  ;; complilationバッファを自動的にスクロールさせる
  (setq compilation-ask-about-save nil)
  (setq compilation-scroll-output 'first-error)

  (define-key jde-mode-map (kbd "C-c C-v .") 'jde-complete-minibuf)
  (define-key jde-mode-map (kbd "M-j") 'duplicate-thing)
  )

(add-hook 'jde-mode-hook 'my-jde-mode-hook)


(defun my-java-mode-setup ()
  "force c-basic-offset to be 4"
  (setq c-basic-offset 2))
(add-hook 'java-mode-hook 'my-java-mode-setup)
