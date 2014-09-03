(require 'key-combo)

;; Lisp-mode-setting --------------------------------------------------
(defvar kb-lisp
  '(("."  . (key-combo-execute-original))
    (". SPC" . " . ")
    ("SPC"  . (key-combo-execute-original))
    ("SPC ." . " . ")
    (","  . (key-combo-execute-original))
    (",@" . " ,@");; for macro
    (";"  . (";; " "; "))
    (";=" . ";=> ")
    ("="  . ("= " "eq " "equal "))
    (">=" . ">= ")
    ;; ("C-M-x" . (key-combo-execute-original
    ;;             (lambda ()
    ;;               (let ((current-prefix-arg '(4)))
    ;;                 (call-interactively 'eval-defun)))));; lamda for message
    ("-"  . (key-combo-execute-original));; for symbol name
    ))


(defvar kb-lisp-mode-hooks
  '(lisp-mode-hook
    emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    inferior-gauche-mode-hook
    scheme-mode-hook))


;; commom-setting-----------------------------------------------------------
(defvar kb-common
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("=>" . " => ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > "))
    (">=" . " >= ")
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*"  . (key-combo-execute-original " * ") )
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < "))
    ("<=" . " <= ")
    ("/=" . " /= ")
    ;;     ("' SPC" . "'`!!''")
    ;;     ("\" SPC" . "\"`!!'\"")
    )
  )

(defvar kb-common-mode-hooks
  '(ruby-mode-hook
    coffee-mode-hook
    php-mode-hook
    python-mode-hook
    js2-mode-hook
    tuareg-mode-hook
    enh-ruby-mode-hook
    c-mode-common-hook
    )
  )



(defvar kb-java
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " "++" key-combo-execute-original))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "--"))
    (">=" . " >= ")
    (">>=" . " >>= ")
    ("<<=" . " <<= ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > " " >> "))
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < " " << "))
    ("<=" . " <= ")
    ("/=" . " /= ")
    )
  )

;; c++-mode-----------------------------------------

(defvar kb-c++
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " "++" key-combo-execute-original))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "--"))
    (">=" . " >= ")
    (">>=" . " >>= ")
    ("<<=" . " <<= ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > " " >> "))
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < " " << "))
    ("<=" . " <= ")
    ("/=" . " /= ")
    )
  )

;; haskell-mode-----------------------------------------

(defvar kb-haskell
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " " ++ " key-combo-execute-original))
    ("*"  . (key-combo-execute-original " * " " ** "))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "--"))
    (">" . (key-combo-execute-original " > "))
    ("<" . (key-combo-execute-original " < "))
    (":" . (key-combo-execute-original " :: " " : "))
    ("." . (key-combo-execute-original " . "))
    ("|"  . (key-combo-execute-original " | " " || "))
    ("=>" . " => ")
    ("<=" . " <= ")
    ("<-" . " <- ")
    ("->" . " -> ")
    ))


;;ruby-mode --------------------------------------------------------
(defvar kb-ruby
  '(("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("|"  . (" | " " || " "|`!!'|"))
    ("=~" . " =~ ")
    ("/" . (key-combo-execute-original " / " " /`!!'/"))
    ("*"  . (" * " "**" key-combo-execute-original) )
    ("**"  . "**" )
    ("**=" . " **= ")
    ("<" . (" < " " << "))
    ("&&=" . " &&= ")
    ("||=" . " ||= ")
    ("!~" . " !~ ")   ; for ruby
    (";" . "; ")
    ("#" . "# ")
    )
  )


;; python-mode --------------------------------------------------------
(defvar kb-python
  '(
    ("/" . (key-combo-execute-original " / "))
    ("-"  . (key-combo-execute-original " - "))
    ("+"  . (" + " key-combo-execute-original))
    ("|"  . (" | " " || "))
    )
  )

;; javascript-mode------------------------------------------------
(defvar kb-js2
  '(
    ("=" . (" = " " == " " === "))
    ("!"  . (key-combo-execute-original))
    ("!="  . (" != " " !== ") )
    ("/" . (" / " "// " "/`!!'/" key-combo-execute-original))
    ("-" . (key-combo-execute-original " - "))
    ;; ("{" . (key-combo-execute-original))
    ;; ("{ RET" . "{\n`!!'\n}")
    ;; ("{ SPC" . "{  `!!'  }")
    ;; ("( SPC" . "(`!!')")
    ;; ("[ SPC" . "[  `!!'  ]")
    ("+"  . (" + " "++"))
    ("|"  . (" | " " || "))
    )
  )

;; coffee-mode --------------------------------------------------------
(defvar kb-coffee
  '(
    ("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("|"  . (" | " " || "))
    ("->" . " -> ")
    ("/" . (" / " " /`!!'/" key-combo-execute-original))
    )
  )

;; css-mode --------------------------------------------------------
(defvar kb-css
  '(
    (":" . ": ")
;;    ("{" . (key-combo-execute-original))
    ;; ("{" . " {\n`!!'\n}")
    (","  . ", ")
    )
  )

;; php-mode --------------------------------------------------------
(defvar kb-php
  '(
    ("{" . (key-combo-execute-original))
    ;; ("{ RET" . "{\n`!!'\n}")
    ;; ("{ SPC" . "{  `!!'  }")
    ;; ("( SPC" . "(`!!')")
    ;; ("[ SPC" . "[`!!']")
    ("+"  . (" + " "++"))
    ("-" . (key-combo-execute-original " - "))
    ("/" . (key-combo-execute-original " / " "// "))
    ("=" . (" = " " == " " === "))
    )
  )


;; markdown-mode --------------------------------------------------------
(defvar kb-markdown
  '(
    ("。" . "．")
    ("、"  . "，")
    ("　" . ("	" key-combo-execute-original))
    )
  )


;; tuareg-mode --------------------------------------------------------
(defvar kb-tuareg
  '(("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("/"  . (key-combo-execute-original " / "))
    ("*"  . (" * " "**" key-combo-execute-original) )
    ("+."  . " +. ")
    ("-."  . " -. ")
    ("*."  . " *. ")
    ("/."  . " /. ")
    (":="  . " := ")
    ("|"  . (" | " " || "))
    ("&"  . (" & " " && "))
    (";"  . ("; " ";;"))
    (":"  . (key-combo-execute-original " :: "))
    ("->" . " -> ")
    )
  )



;; tex-mode----------------------------------------------

(defvar kb-yatex
  '(
    ("。" . "．")
    ("、"  . "，")
    )
  )




(defun my-key-combo-load ()
  (interactive)
  (global-key-combo-mode t)
  (key-combo-define-hook kb-common-mode-hooks
                         'kb-common-load
                         kb-common)
  (key-combo-define-hook kb-lisp-mode-hooks
                         'kb-lisp-load
                         kb-lisp)
  (key-combo-define-hook 'ruby-mode-hook
                         'kb-ruby-load
                         kb-ruby)
  (key-combo-define-hook 'python-mode-hook
                         'kb-python-load
                         kb-python)
  (key-combo-define-hook 'css-mode-hook
                         'kb-css-load
                         kb-css)
  (key-combo-define-hook 'coffee-mode-hook
                         'kb-coffee-load
                         kb-coffee)
  (key-combo-define-hook 'markdown-mode-hook
                         'kb-markdown-load
                         kb-markdown)
  (key-combo-define-hook 'yatex-mode-hook
                         'kb-yatex-load
                         kb-yatex)
  (key-combo-define-hook 'js2-mode-hook
                         'kb-js2-load
                         kb-js2)
  (key-combo-define-hook 'php-mode-hook
                         'kb-php-load
                         kb-php)
  (key-combo-define-hook 'java-mode-hook
                         'kb-java-load
                         kb-java)
  (key-combo-define-hook 'c++-mode-hook
                         'kb-c++-load
                         kb-c++)
  (key-combo-define-hook 'haskell-mode-hook
                         'kb-haskell-load
                         kb-haskell)
  (key-combo-define-hook 'tuareg-mode-hook
                         'kb-tuareg-load
                         kb-tuareg)
  )

(my-key-combo-load)
