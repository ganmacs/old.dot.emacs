(provide 'utility)
(eval-when-compile (require 'cl))

;; add-to-listに複数指定する
(defmacro append-to-list (mode-list &rest body)
  (let ((lst (gensym)))
    `(dolist (,lst ',body)
       (add-to-list ,mode-list ,lst))))

;; add-hookのlambdaをなくす
(defmacro add-hook-lambda (hook &rest body)
  `(add-hook ,hook (lambda () ,@body)))

;; gobal-set-keyに関数を渡すときlambdaをなくす
(defmacro global-set-key-lambda (keybind &rest body)
  `(global-set-key ,keybind '(lambda () (interactive) ,@body)))


;; ------------------- Unit Test ----------------

;; emacs -batch -l ~/.emacs.d/conf/utility.el -f ert-run-tests-batch-and-exit

(dont-compile
  (require 'ert)
  (require 'cl)
  (message "Running tests on Emacs %s" emacs-version)

  (ert-deftest append-to-list-test ()
    "第2引数以降に受け取ったものをリストに追加する"
    "append-to-list is "
    (let ((lst nil))
      (append-to-list 'lst
        'h
        (f . g)
        (d e)
        c
        "b"
        a
        )
      (should (equal lst '(a "b" c (d e) (f . g) 'h)))))
  )
