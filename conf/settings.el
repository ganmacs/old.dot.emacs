(provide 'settings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @general ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 環境変数
(setenv "LANG" "ja_JP.UTF-8")

;; キーの設定
(setq ns-right-command-modifier (quote hyper))
(setq ns-right-option-modifier (quote alt))

;; 日本語設定
(set-language-environment 'Japanese)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; Macの場合ファイル名はutf-8-hfs
;;(setq file-name-coding-system 'utf-8)
;;(setq locale-coding-system 'utf-8)
(if (eq window-system 'ns)
   (progn
     (require 'ucs-normalize)
     (setq file-name-coding-system 'utf-8-hfs)
     (setq locale-coding-system 'utf-8-hfs)))

;; 英語font
(set-face-attribute 'default nil
                    :family "Menlo" ;; font
                    :height 130)    ;; font size
;; 日本語font
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Maru Gothic ProN")) ;; font

;; 半角と全角の比を1:2に
(setq face-font-rescale-alist
      '((".*Hiragino_Maru_Gothic_ProN.*" . 1.0)))

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;;ファイルをドラッグ&ドロップした時新しいウインドウを開かない
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;; 終了時にオートセーブファイル（#filename#）を消す
(setq delete-auto-save-files t)

;; オートセーブ間隔 :Default=30sec
(setq auto-save-timeout 600)

;; 元ファイルをバックアップファイルにコピーしてから、新たな内容で上書きする
;; つまり、ファイルの所有者とグループは変わらない
;; デフォルトでは、元ファイルを改名してバックアップとして保存し、新たな内容の新たなファイルを作成する
(setq backup-by-copying t)

;; 最近使ったファイルをメニューに表示
(recentf-mode t)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 500)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 500)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;;保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ナローイング許可
(put 'narrow-to-region 'disabled nil)

;; --------save file----------
;; ispellの辞書
(setq ispell-program-name "/usr/local/bin/aspell")

;; バックアップファイル（filename~）とオートセーブファイル（#filename#）は~/.emacs.d/backup/に保存
;; 下記コマンドを crontab -e で記述
;; 0 1 * * * find ~/.emacs.d/backup -mtime +30 -exec rm -f {} \;
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/log/backup/") t)))
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/log/backup"))
            backup-directory-alist))

;; file-path
(setq auto-save-list-file-prefix "~/.emacs.d/log/auto-save-list/.saves-")

;; savehist
(setq savehist-file "~/.emacs.d/log/history")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @BasicTypingRules ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 英数は半角に
;;(setq skk-number-style nil)

;; Undo回数制限
(setq undo-limit 100000)
(setq undo-strong-limit 130000)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 最終行に必ず一行挿入する
(setq require-final-newline nil)

;; tab ではなくスペース を使う
(setq-default indent-tabs-mode nil)

;; tab 幅を 2 に設定
(setq-default tab-width 2)

;; C-Ret で矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @Looks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; モードラインフラット化
(set-face-attribute 'mode-line          nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;ヒープ音をけす
(setq ring-bell-function 'ignore)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; EOB を表示
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such in-tance.
 ;; If there is more than one, they won't work right.
;;  '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; 5分触らないと点滅しだす
(set-cursor-color "#fce94f")
(setq blink-cursor-interval 0.5)
(setq blink-cursor-delay 300.0)
(blink-cursor-mode 1)

;; 現在行を目立たせる
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#151515"))
    (((class color)
      (background light))
     (:background "#aaa"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode 1)

;; 行番号表示
(global-linum-mode t)

;; ウィンドウの透明化
(add-to-list 'default-frame-alist '(alpha . (90 60)))

;; 行間
(setq-default line-spauing 0)

;; マーク領域を色付け
(setq transient-mark-mode t)

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "#fce94f")

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;; マウススクロール調整
(mouse-wheel-mode)
(global-set-key [wheel-up]
                '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [wheel-down]
                '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [double-wheel-up]
                '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [double-wheel-down]
                '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [triple-wheel-up]
                '(lambda () "" (interactive) (scroll-down 2)))
(global-set-key [triple-wheel-down]
                '(lambda () "" (interactive) (scroll-up 2)))

(defface my-face-b-1 '((t (:background "DeepPink"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("　" 0 my-face-b-1 append))))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; @require ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ----------------- @tramp ------------------------
(require 'tramp)
(setq tramp-default-method "ssh")
;; for mac
(setq tramp-persistency-file-name "~/.emacs.d/log/tramp")


;; ----------------- @uniquify ------------------------
;;; バッファ名
;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; ----------------- @filecache ------------------------
(require 'filecache)
(file-cache-add-directory-list
 (list "~/.emacs.d" "~/.emacs.d/config" "~/Dropbox/memorandum"))

(define-key minibuffer-local-completion-map "\C-x\C-f"
  'file-cache-minibuffer-complete)

;; Add to file-cache when `kill-buffer'
(defun file-cache-add-this-file ()
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))
(add-hook 'kill-buffer-hook 'file-cache-add-this-file)


;; ----------------- @whitespace-----------------------

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

;; ----------------- @usc-normalize-----------------------
;; pdfコピーの時の濁点分離を治す
(require 'ucs-normalize)
(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max))
  )

;; ----------------- @align ------------------------

(require 'align)

(add-to-list 'align-rules-list
             '(js-assignment-literal
               (regexp . "\\(\\s-*\\)=")))

;; js2
(add-to-list 'align-rules-list
             '(js-object-attribute
               (regexp . ":\\(\\s-*\\)")
               (modes  . '(js2-mode))))


(add-to-list 'align-rules-list
             '(php-assignment
               (regexp   . "[^-=!^&*+<>/.| \t\n]\\(\\s-*[.-=!^&*+<>/|]*\\)=>?\\(\\s-*\\)\\([^= \t\n]\\|$\\)")
               (justify  . t)
               (tab-stop . nil)
               (modes    . '(php-mode))))

(add-to-list 'align-dq-string-modes 'php-mode)
(add-to-list 'align-sq-string-modes 'php-mode)
(add-to-list 'align-open-comment-modes 'php-mode)
(setq align-region-separate (concat "\\(^\\s-*$\\)\\|"
                                    "\\([({}\\(/\*\\)]$\\)\\|"
                                    "\\(^\\s-*[)}\\(\*/\\)][,;]?$\\)\\|"
                                    "\\(^\\s-*\\(}\\|for\\|while\\|if\\|else\\|"
                                    "switch\\|case\\|break\\|continue\\|do\\)[ ;]\\)"
                                    ))


(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruy-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(camma-assignment
               (regexp . ",\\( *\\)")
               (repeat . t)))

(global-set-key (kbd "C-c i") 'align)

;; ;; -----------------  @YaTex ------------------------

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))
(setq tex-command "/usr/texbin/ptex2pdf -l -ot '-synctex=1'")
(setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/upbibtex")
                           ((string-match "platex" tex-command) "/usr/texbin/pbibtex")
                           ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/bibtexu")
                           ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/bibtex")
                           (t "/usr/texbin/pbibtex")))
(setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/mendex")
                              ((string-match "platex" tex-command) "/usr/texbin/mendex")
                              ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/texindy")
                              ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/makeindex")
                              (t "/usr/texbin/mendex")))

;; (setq dvi2-command "/usr/bin/open -a Preview")
(setq dvi2-command "/usr/bin/open -a Skim")
(setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | sed -e \"s/\\.[^.]*$/\\.pdf/\"`")

(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)
             (reftex-mode 1)
             (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)
             (define-key YaTeX-mode-map (kbd "<f8>") 'YaTeX-typeset-menu)
             (define-key YaTeX-mode-map (kbd "s-R") 'YaTeX-typeset-menu)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; ;; -----------------  @saveplace ------------------------

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/log/saved-places")
