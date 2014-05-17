(provide 'keybinds)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @keybind ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-mにnewline-and-indentを割り当てる。
(global-set-key (kbd "C-m") 'newline-and-indent)

;;C-mにnewline-and-indentを渡したので"C-."でウインドウ切り替え
(global-set-key (kbd "C-.") 'other-window)

;; 文字を削除
(define-key minibuffer-local-completion-map "\C-w" 'kill-word-at-point)

;; C-hをバックスペースに置き換え
(global-set-key (kbd "C-h") 'delete-backward-char)

;; パラグラフ選択
(global-set-key (kbd "C-!") 'mark-paragraph)

;; 補完を再設定 M-/をre-bind
(global-set-key (kbd "C-j") 'dabbrev-expand)

;; emacs終了をC-x C-cでさせない
(global-unset-key (kbd "C-x C-c"))

;; C-x C-hにhelpcommandを割り当て
(global-set-key (kbd "C-x C-h") 'help-command)

;; previous-multi-windowがループしないのでother-windowの逆
(global-set-key-lambda (kbd "C-x o") (other-window -1))

;; タブ文字、全角空白、文末の空白の色付け
(global-set-key (kbd "C-c w") 'global-whitespace-mode)

;;ディレクトリを開ける
(global-set-key (kbd "C-x C-d") 'open-dired-from-recentf)

;; 折り返しトグルコマンド
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;;リージョンコメントをできるように
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; kill all buffers
(global-set-key (kbd "C-x C-k") 'kill-all-buffers)

;; pdfコピー時の濁点の分離をなおす
(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)

;; スペースを1つに
(global-set-key (kbd "C-x C-n") 'just-one-space)

;; １行コメント
(global-set-key (kbd "C-q") 'one-line-comment)

;; いい感じにマーク
(global-set-key (kbd "C-#") 'mark-sexp)

;; ------------shift + ctrl-------------
(global-set-key (kbd "C-S-f") 'next-space)
(global-set-key (kbd "C-S-b") 'previous-space)
(global-set-key (kbd "C-S-i") 'quote-insert-inline)
(global-set-key (kbd "C-S-d") 'double-quote-insert-inline)
(global-set-key (kbd "C-S-t") 'previous-transpose-char)

;; --------------meta------------------
;;M-hで前方単語削除
(global-set-key (kbd "M-h") 'backward-kill-word)

;; 1行削除
(global-set-key (kbd "M-k") 'kill-whole-line)

;; パラグラフ移動（空行移動）
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; --------------super------------------
;; 良い感じに削除
(global-set-key (kbd "s-k") 'kill-sexp)
(global-set-key (kbd "s-h") '(lambda () (interactive) (kill-sexp -1)))

;;バファの切り替えをらくに
(global-set-key (kbd "s-n") 'next-buffer)
(global-set-key (kbd "s-p") 'previous-buffer)

;; 良い感じに移動移動
(global-set-key (kbd "s-f") 'forward-sexp)
(global-set-key (kbd "s-b") 'backward-sexp)

;; window分割
(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)

;; 変更部分を可視化/不可視化のトグル
(global-set-key (kbd "s-i") 'highlight-changes-visible-mode)

;; 文末にいって改行
(global-set-key (kbd "s-m") 'end-line-indent)

;; 今の行を下に移動
(global-set-key (kbd "s-o") 'begin-line-indent)

;; kill buffer
(global-set-key (kbd "C-M-k") 'kill-this-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Function ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; １行コピー
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

;; カーソル位置の単語を削除
(defun kill-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))

;; 指定した最近のディレクトリに行く
(defun open-dired-from-recentf (keyword)
  (interactive "sPart of the destination directory: ")
  (with-temp-buffer
    (mapcar (lambda (x) (insert (format "%s\n" x)))
            recentf-list)
    (goto-char (point-min))
    (search-forward keyword)
    (dired (file-name-directory (thing-at-point 'line)))))

(defun kill-all-buffers()
  (interactive)
  (yes-or-no-p "kill all buffers? ")
  (dolist (buf (buffer-list))
    (unless (member (buffer-name) '("*scratch*" "*Messages*"))
      (kill-buffer buf))))

(defun vimlike-f (char)
  (when (= (char-after (point)) char)
    (forward-char))
  (search-forward (char-to-string char) (point-at-eol) nil 1)
  (backward-char))

(defun vimlike-F (char)
  (search-backward (char-to-string char) (point-at-bol) nil 1))

(defun add-keys-to-vim-likef (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'vimlike-F
                  #'vimlike-f) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-vim-likef "H-" c))
(loop for c from ?a to ?z do (add-keys-to-vim-likef "H-" c))
(loop for c from ?! to ?~ do (add-keys-to-vim-likef "H-" c))
(loop for c from ?0 to ?9 do (add-keys-to-vim-likef "H-C-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-vim-likef "H-C-" c 'word))
(loop for c from ?! to ?~ do (add-keys-to-vim-likef "H-C-" c 'word))

(setq inline-separator "^\s()[]:;,=.\n{}")

;; 文字列をクオートで囲む
(defun quote-insert-inline ()
  (interactive)
  (skip-chars-backward inline-separator)
  (insert "'")
  (skip-chars-forward inline-separator)
  (insert "'"))

;; 文字列をダブルクオートで囲む
(defun double-quote-insert-inline ()
  (interactive)
  (skip-chars-backward inline-separator)
  (insert "\"")
  (skip-chars-forward inline-separator)
  (insert "\""))

;; 次の空白に移動
(defun next-space ()
  (interactive)
  (search-forward (char-to-string ?\s) nil 1)
  (if (= (char-after (point)) ?\s) (next-space)))

;; 前の空白
(defun previous-space ()
  (interactive)
  (search-backward (char-to-string ?\s) nil 1)
  (backward-char)
  (if (= (char-after (point)) ?\s) (previous-space)))

;; 1行コメント
(defun one-line-comment ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (comment-or-uncomment-region (region-beginning) (region-end))))

;; 文末いって改行
(defun end-line-indent ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; 文頭いってから改行
(defun begin-line-indent ()
   (interactive)
   (beginning-of-line)
   (newline-and-indent)
   (previous-line)
   (indent-for-tab-command))

;; 一つ前のC-t
(defun previous-transpose-char ()
  (interactive)
  (transpose-chars -1)
  (forward-char))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Advice ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; kill-lineで行が連結したときにインデントを減らす
(defadvice kill-line (before kill-line-and-fixup activate)
  (when (and (not (bolp)) (eolp))
    (forward-char)
    (fixup-whitespace)
    (backward-char)))

;; 範囲指定していないとき、前の単語を削除
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
      (kill-word-at-point)
    ad-do-it))

;; 範囲指定していないとき、1行削除
(defadvice kill-ring-save (around kill-ring-save-or-copy-line-as-kill (beg end) activate)
  (interactive (list (point) (mark)))
  (if (and (called-interactively-p 'any) (not mark-active))
      (copy-whole-line)
      ad-do-it))

(defadvice dired-copy-filename-as-kill (before four-prefix activate)
  (interactive "P")
  (when (eq 4 (prefix-numeric-value (ad-get-arg 0)))
    (ad-set-arg 0 0)))

;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))
