(require 'quickrun)

;; 一番最初だけリージョンしてないとエラー？
(defun quickrun-sc (start end)
     (interactive "r")
     (if mark-active
         (quickrun :start start :end end)
       (quickrun)))

;; emacs終了をbindしているので注意
(global-set-key (kbd "s-R") 'quickrun-sc)
