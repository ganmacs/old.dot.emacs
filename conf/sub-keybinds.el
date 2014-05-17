(provide 'sub-keybinds)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @OverwreiteKeybind ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
;; -----------sheme--------------------

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(add-to-list 'process-coding-system-alist '("gosh" utf-8 . utf-8))
(setq scheme-program-name "/usr/local/bin/gosh -i")

(defun scheme-other-windows ()
  (interactive)
  (save-selected-window
    (select-window (split-window-horizontally))
    (run-scheme scheme-program-name)))

(define-key global-map "\C-cG" 'scheme-other-windows)

;; ------------C Hook------------------
(add-hook-lambda 'c-mode-common-hook
                 (define-key c-mode-base-map  (kbd "M-j") 'duplicate-thing))


;; ------------Java Hook------------------
(add-hook-lambda 'java-mode-hook
                 (setq c-basic-offset 2)
                 (define-key java-mode-map (kbd "M-j") 'duplicate-thing))

;; -------------Python Hook----------------
(add-hook-lambda 'python-mode-hook
                 (setq python-indent 2)
                 (setq indent-tabs-mod nil))


;;-------------- @ruby-mode ----------------

(append-to-list 'auto-mode-alist
                ("Gemfile" . ruby-mode)
                ("\\.thor$" . ruby-mode)
                ("\\.rake$" . ruby-mode)
                ("Guardfile$" . ruby-mode)
                ("\\.env$" . ruby-mode))

(add-hook-lambda 'ruby-mode-hook
                 (setq ruby-insert-encoding-magic-comment nil)
                 (define-key ruby-mode-map (kbd "C-M-p") 'chrome-scroll-up)
                 (define-key ruby-mode-map (kbd "C-M-n") 'chrome-scroll-down)
                 (define-key ruby-mode-map (kbd "C-M-r") 'chrome-reload)
                 (define-key ruby-mode-map (kbd "s-r") 'chrome-reload)
                 (define-key ruby-mode-map (kbd "C-M-f") 'chrome-next-tab)
                 (define-key ruby-mode-map (kbd "C-M-b") 'chrome-previous-tab))

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @for iTerm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun execute-on-iterm (command)
  (interactive "MCommand: ")
  (do-applescript
   (format "tell application \"iTerm\"
              activate
              tell current session of current terminal
                write text \"%s\"
              end tell
            end tell"
           command)))

(defun cd-on-iterm ()
  (interactive)
  (execute-on-iterm
   (format "cd %s" default-directory)))

(defun rspec-on-iterm ()
  (interactive)
  (execute-on-iterm
   (format "bundle exec spring rspec %s:%s" buffer-file-name (line-number-at-pos))))

(global-set-key (kbd "C-c d") 'cd-on-iterm)
(define-key ruby-mode-map (kbd "C-c r") 'rspec-on-iterm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @ForChrome ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-M-f") 'chrome-next-tab)
(global-set-key [C-tab] 'chrome-next-tab)
(global-set-key (kbd "C-M-b") 'chrome-previous-tab)
(global-set-key [C-S-tab] 'chrome-previous-tab)

(global-set-key (kbd "C-M-r") 'chrome-reload)
(global-set-key (kbd "s-r") 'chrome-reload)
(global-set-key (kbd "C-M-n") 'chrome-scroll-down)
(global-set-key [s-down] 'chrome-scroll-down)
(global-set-key (kbd "C-M-p") 'chrome-scroll-up)
(global-set-key [s-up] 'chrome-scroll-up)
(define-key dired-mode-map (kbd "C-M-b") 'chrome-previous-tab)


(defun chrome-reload ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\" to reload active tab of first window'"))

(defun chrome-next-tab ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\" to set active tab index of first window to (get (active tab index of first window) mod (get count tabs of first window)) + 1'"))

(defun chrome-previous-tab ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\"
 set act_i to active tab index of first window
 if act_i > 1 then
 	set (active tab index of first window) to (get active tab index of first window) - 1
 else
 	set active tab index of first window to get count tabs of first window
 end if
end tell'"))

(defun chrome-scroll-down ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\" to execute active tab of first window javascript \"var x = document.documentElement.scrollLeft || document.body.scrollLeft; var y = document.documentElement.scollTop || document.body.scrollTop; y += 50; window.scroll(x, y);\"'"))

(defun chrome-scroll-up ()
  (interactive)
  (shell-command "osascript -e 'tell application \"Google Chrome\" to execute active tab of first window javascript \"var x = document.documentElement.scrollLeft || document.body.scrollLeft; var y = document.documentElement.scrollTop || document.body.scrollTop; y -= 50; window.scroll(x, y);\"'"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @MacDictionary ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Macの辞書起動
(define-key global-map (kbd "s-W") 'dictionary)
;; emacs内で辞書参照
(define-key global-map (kbd "s-w") 'ns-popup-dictionary)


(defun dictionary ()
  "dictionary.app"
  (interactive)

  (let ((editable (not buffer-read-only))
        (pt (save-excursion (mouse-set-point last-nonmenu-event)))
        beg end)

    (if (and mark-active
             (<= (region-beginning) pt) (<= pt (region-end)) )
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion
        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))

    (browse-url
     (concat "dict:///"
             (url-hexify-string (buffer-substring-no-properties beg end))))))

(defvar dict-bin "~/Dropbox/programming/commandline-dictionary-app/src/dict"
  "dict 実行ファイルのパス")

(defun temp-cancel-read-only (function &optional jaspace-off)
  "eval temporarily cancel buffer-read-only
&optional t is turn of jaspace-mode"
  (let ((read-only-p nil)
	(jaspace-mode-p nil))
    (when jaspace-off
      (when jaspace-mode
	(jaspace-mode)
	(setq jaspace-mode-p t)))
    (when buffer-read-only
      (toggle-read-only)
      (setq read-only-p t))
    (eval function)
    (when read-only-p
      (toggle-read-only))
    (when jaspace-mode-p
      (jaspace-mode))))

(defun ns-popup-dictionary ()
   "マウスカーソルの単語を Mac の辞書でひく"
   (interactive)
   (let ((word (substring-no-properties (thing-at-point 'word)))
	 (old-buf (current-buffer))
	 (dict-buf (get-buffer-create "*dictionary.app*"))
	 (dict))
     (when (and mark-active transient-mark-mode)
       (setq word (buffer-substring-no-properties (region-beginning) (region-end))))
     (set-buffer dict-buf)
     (erase-buffer)
     (call-process dict-bin
		   nil "*dictionary.app*" t word
		   "Japanese-English" "Japanese" "Japanese Synonyms")
     (setq dict (buffer-string))
     (set-buffer old-buf)
     (when (not (eq (length dict) 0))
       (temp-cancel-read-only '(popup-tip dict :margin t :scroll-bar t))
       )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; @ForSafari ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-set-key '[M-left] 'safari-history-back)
;; (global-set-key '[M-right] 'safari-history-forward)
;; (global-set-key (kbd "C-M-b") 'safari-previous-tab)
;; (global-set-key (kbd "C-M-f") 'safari-next-tab)
;; (global-set-key (kbd "C-M-r") 'safari-reload)
;; (global-set-key (kbd "C-M-n") 'safari-scroll-down)
;; (global-set-key (kbd "C-M-p") 'safari-scroll-up)
;; (define-key dired-mode-map (kbd "C-M-b") 'safari-previous-tab)


;; (defun safari-do-javascript(command)
;;   (shell-command
;;    (concat "osascript -e 'tell application \"Safari\" to do JavaScript \"" command "\" in document 1'")))

;; (defun safari-scroll(direction)
;;   (let ((amount 200))
;;     (if (eq direction 1)
;;         (setq amount (- amount)))
;;     (safari-do-javascript
;;      (concat "javascript:window.scrollBy(0,"
;;              (int-to-string amount)
;;              ");"))))

;; (defun safari-scroll-up()
;; 	(interactive)
;; 	(safari-scroll 1))

;; (defun safari-scroll-down()
;; 	(interactive)
;; 	(safari-scroll 0))

;; (defun safari-reload()
;;   (interactive)
;;   (safari-do-javascript "location.reload(true);"))

;; (defun safari-next-tab ()
;; 	(interactive)
;; 	(shell-command "osascript -e \"tell application \\\"Safari\\\" to tell window 1 to set current tab to tab (((current tab's index) mod (count every tab)) + 1)\""))

;; (defun safari-previous-tab ()
;; 	(interactive)
;; 	(shell-command "osascript -e \"tell application \\\"Safari\\\"
;; 	tell window 1
;; 		set act_i to current tab's index
;; 		if act_i > 1 then
;; 			set (current tab) to tab (act_i - 1)
;; 		else
;; 			set current tab to tab (get count every tab)
;; 		end if
;; 	end tell
;; end tell\""))

;; (defun safari-history-forward ()
;;   (interactive)
;;   (safari-do-javascript "history.forward();"))

;; (defun safari-history-back ()
;;   (interactive)
;;   (safari-do-javascript "history.back();"))
