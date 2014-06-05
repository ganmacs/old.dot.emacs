(require 'eshell)
(require 'shell-switcher)

;; set shell-switcher-mode
(setq shell-switcher-mode t)

;環境変数設定
(setenv "PATH" (concat
                "/usr/local/bin:"
                "/usr/bin"
                "/usr/X11/bin:"
                "/Applications/mongodb-osx-x86_64-1.8.2/bin:"
                (concat (getenv "HOME") "/.rbenv/shims:")
                (concat (getenv "HOME") "/.rbenv/bin:")
                (concat (getenv "HOME") "/.cabal/bin:")
                "/usr/texbin:"
                "/usr/local/share/npm/bin:"
                (concat (getenv "HOME") "/node_modules/.bin:")
                (concat (getenv "HOME") "/local/node/bin:")
                "/opt/local/bin:"
                "/opt/local/sbin:"
                "/Applications/UpTeX.app/teTeX/bin/:"
                (getenv "PATH")))


(setenv "NODE_PATH" (concat
                     (concat (getenv "HOME") "/.npm/lib:")
                     (concat (getenv "HOME") "/local/node:")
;;                      (concat (getenv "HOME") "/.rbenv/shims:")
                     (concat (getenv "HOME") "/local/node/lib/node_modules")
                     ))

(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims/")
                 (cons (concat (getenv "HOME") "/.rbenv/bin/") exec-path)))

(add-to-list 'exec-path "/usr/local/bin")

;; 環境変数を基に、eshellサーチパスを設定する
(setq eshell-path-env (getenv "PATH"))


;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)
;; 確認なしでヒストリ保存
(setq eshell-ask-to-save-history (quote always))
;; 補完時にサイクルする
;; (setq eshell-cmpl-cycle-completions t)
;; (setq eshell-cmpl-cycle-completions nil)
;; 補完候補がこの数値以下だとサイクルせずに候補表示
;; (setq eshell-cmpl-cycle-cutoff-length 5)
;; 履歴で重複を無視する
(setq eshell-hist-ignoredups t)

(custom-set-variables
 ;; '(eshell-ask-to-save-history (quote always))
 ;; '(eshell-history-size 1000)
 ;; '(eshell-ls-dired-initial-args (quote ("-h")))
 ;; '(eshell-ls-exclude-regexp "~\\'")
 ;; '(eshell-ls-initial-args "-h")
 ;; '(eshell-ls-use-in-dired t nil (em-ls))
 ;; '(eshell-modules-list (quote (eshell-alias eshell-basic
 ;;                                            eshell-cmpl eshell-dirs eshell-glob
 ;;                                            eshell-hist eshell-ls eshell-pred
 ;;                                            eshell-prompt eshell-rebind
 ;;                                            eshell-script eshell-smart
 ;;                                            eshell-term eshell-unix eshell-xtra)))
 ;; '(eshell-prefer-to-shell t nil (eshell))
 ;; '(eshell-stringify-t nil)
 ;; '(eshell-term-name "ansi")
 '(eshell-visual-commands (quote ("vi" "vim" "top" "screen" "lynx"
                                  "ssh" "rlogin" "telnet"
                                  "irb" "coffee" "ghci")))
 )

;; color
(require 'ansi-color)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

;; C-aで行頭に行かずに"$ "の次にカーソルが来るように. C-p, C-nで履歴をループ.
(add-hook 'eshell-mode-hook
          '(lambda ()
             (progn
               (define-key eshell-mode-map "\C-a" 'eshell-bol)
               (define-key eshell-mode-map "\C-p"
                 'eshell-previous-matching-input-from-input)
               (define-key eshell-mode-map "\C-n"
                 'eshell-next-matching-input-from-input)
               )
             ))


;; プロンプトの表示変更
(defun my-eshell-prompt ()
  (concat (eshell/pwd) "\n$ " ))
(setq eshell-prompt-function 'my-eshell-prompt)
(setq eshell-prompt-regexp "^[^#$n]*[#$] ")

;; sudoに続くコマンドの変換
(defun pcomplete/sudo ()always
  "Completion rules for the `sudo' command."
  (let ((pcomplete-help "complete after sudo"))
    (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))))

;; eshell/clear
(defun eshell/clear ()
  "Clear the current buffer, leaving one prompt at the top."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; eshell/bmk - version 0.1.3
(defun pcomplete/eshell-mode/bmk ()
  "Completion for `bmk'"
  (pcomplete-here (bookmark-all-names)))
(defun eshell/bmk (&rest args)
  "Integration between EShell and bookmarks.
For usage, execute without arguments."
  (setq args (eshell-flatten-list args))
  (let ((bookmark (car args))
        filename name)
    (cond
     ((eq nil args)
      (format "Usage:
* bmk BOOKMARK to
** either change directory pointed to by BOOKMARK
** or bookmark-jump to the BOOKMARK if it is not a directory.
* bmk . BOOKMARK to bookmark current directory in BOOKMARK.
Completion is available."))
     ((string= "." bookmark)
      ;; Store current path in EShell as a bookmark
      (if (setq name (car (cdr args)))
          (progn
            (bookmark-set name)
            (bookmark-set-filename name (eshell/pwd))
            (format "Saved current directory in bookmark %s" name))
        (error "You must enter a bookmark name")))
     (t
      ;; Check whether an existing bookmark has been specified
      (if (setq filename (cdr (car (bookmark-get-bookmark-record bookmark))))
          ;; If it points to a directory, change to it.
          (if (file-directory-p filename)
              (eshell/cd filename)
            ;; otherwise, just jump to the bookmark
            (bookmark-jump bookmark))
        (error "%s is not a bookmark" bookmark))))))


;; eshell での補完に auto-complete.el を使う
(require 'pcomplete)
;(add-to-list 'ac-modes 'eshell-mode)
;; (ac-define-source pcomplete
;;   '((candidates . pcomplete-completions)))
;; (defun my-ac-eshell-mode ()
;;   (setq ac-sources
;;         '(ac-source-pcomplete
;;           ac-source-dictionary)))
;; (add-hook 'eshell-mode-hook
;;           (lambda ()
;;             (my-ac-eshell-mode)
;;             (define-key eshell-mode-map (kbd "C-i") 'auto-complete)))

;; anything で履歴から入力
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                (kbd "C-r")
                'helm-eshell-history)))
;; anything で補完
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                (kbd "M-c")
                'helm-esh-pcomplete)))


;;;; following key bindgs are automatically defined
;; @@ shell-switcher: 複数のeshell起動
;; C-' opens the first 2 buffers (one after the other) and switch between them
;; Repeating ' continues switching after an initial C-'
;; (define-key shell-switcher-mode-map (kbd "C-'")
;;             'shell-switcher-switch-buffer)
;; ;; C-x 4 ' is similar to C-' but within another window
;; (define-key shell-switcher-mode-map (kbd "C-x 4 '")
;;             'shell-switcher-switch-buffer-other-window)
;; ;; C-M-' forces the creation of a new shell
;; (define-key shell-switcher-mode-map (kbd "C-M-'")
;;             'shell-switcher-new-shell)
