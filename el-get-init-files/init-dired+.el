;; diredを便利にする
(require 'dired-x)

;; diredから"r"でファイル名をインライン編集する
(require 'wdired)

;; ディレクトリから先に表示
(setq ls-lisp-dirs-first t)

;; 再帰コピー
(setq dired-recursive-copies 'always)

;; 再帰削除
(setq dired-recursive-deletes 'always)

;; ゴミ箱を利用する
(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(trash-directory "~/.Trash"))

;; for sorting by extensions mac
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

;; dired で Quick Look
(defun my-dired-do-quicklook ()
  "In dired, preview with Quick Look."
  (interactive)
  (let ((file (dired-get-filename))
        (process (get-process "qlmanage_ps")))
    (if process
        (kill-process process)
      (start-process "qlmanage_ps" nil "qlmanage" "-p" file))))

;; @@ diredでディレクトリを開いた際に新規タブで開くのをやめる
;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
(defun dired-open-in-accordance-with-situation ()
  (interactive)
  (let ((file (dired-get-filename)))
    (if (file-directory-p file)
        (dired-find-alternate-file)
      (dired-find-file))))
;; dired-up-directory(アレントディレクトリに移動)の際にも、別タブで開かない
(defun dired-up-directory (&optional other-window)
  "Run Dired on parent directory of current directory."
  (interactive "P")
  (let* ((dir (dired-current-directory))
	 (orig (current-buffer))
	 (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
	;; Only try dired-goto-subdir if buffer has more than one dir.
	(and (cdr dired-subdir-alist)
	     (dired-goto-subdir up))
	(progn
	  (kill-buffer orig)
	  (dired up)
	  (dired-goto-file dir)))))

;; diredでマークをつけたファイルを開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "F") 'my-dired-find-marked-files)
     (defun my-dired-find-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

;; diredでマークをつけたファイルをviewモードで開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "V") 'my-dired-view-marked-files)
     (defun my-dired-view-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'view-file fn-list)))))

(defadvice dired-copy-filename-as-kill (before four-prefix activate)
  (interactive "P")
  (when (eq 4 (prefix-numeric-value (ad-get-arg 0)))
    (ad-set-arg 0 0)))

(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "a") 'dired-find-file)
;; ディレクトリの移動キーを追加(wdired 中は無効)
(define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
(define-key dired-mode-map (kbd "<right>") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "C-b") 'dired-up-directory)
(define-key dired-mode-map (kbd "C-f") 'dired-open-in-accordance-with-situation)
(define-key dired-mode-map (kbd "C-g") 'quit-window)

;; モードフック
(add-hook-lambda 'dired-mode-hook
                 (define-key dired-mode-map (kbd "SPC") 'my-dired-do-quicklook)
                 (define-key dired-mode-map (kbd "c-o") (lambda () (interactive)
                                                          (dired-display-file-n 2))))

(add-hook-lambda 'dired-load-hook
                 (dired-mode-map (kbd "V") 'my-dired-view-marking-files)
                 (dired-mode-map (kbd "C-f") 'dired-do-find-marked-files))
