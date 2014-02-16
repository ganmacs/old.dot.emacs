(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)

(push '("^\*helm .+\*$" :regexp t :width 0.65 :position right) popwin:special-display-config)

;; M-x anything
(push '("^\*anything.*\*$" :regexp t :width 0.5 :position right) popwin:special-display-config)

;; (setq anything-samewindow nil)
;; (push '("*anything*" :height 50) popwin:special-display-config)

;; M-!
(push "*Shell Command Output*" popwin:special-display-config)

;; M-x compile
(push '(compilation-mode :noselect t) popwin:special-display-config)

;; undo-tree
(push '(" *undo-tree*" :width 0.35 :position right) popwin:special-display-config)

;; direx (when user direx)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-n") 'direx:jump-to-directory-other-window)

;; M-x dired-jump-other-window
(push '(dired-mode :position top) popwin:special-display-config)

;; escreen
(push '("*Escreen List*" :width 0.2 :position right) popwin:special-display-config)

;; Magit
;;(push '("^\*magit-edit.*\*$" :regexp t :height 0.5) popwin:special-display-config)

;;slime
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

(push '("*quickrun*") popwin:special-display-config)

(push '("*Moccur*") popwin:special-display-config)

;; (push '("*YaTeX-typesetting*" :noselect t) popwin:special-display-config)

(define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
(define-key dired-mode-map "o" #'(lambda ()
                                     (interactive)
                                     (popwin:find-file (dired-get-file-for-visit))))

(setq popwin:close-popup-window-timer-interval 0.05)
