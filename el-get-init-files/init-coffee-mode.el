;; tab幅を2にする
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2)))

(add-hook-lambda 'coffee-mode-hook
                 (coffee-custom))
