; tuareg-mode
(setq auto-mode-alist (cons '("\\.ml[iylp]?$" . tuareg-mode) auto-mode-alist))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(require 'tuareg)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(setenv "PATH"
        (concat '"/Users/ganma/.opam/4.00.1+annot/bin:" (getenv "PATH")))
;(setq ocamlspot-command "/usr/local/bin/ocamlspot")
(setq ocamlspot-command "/Users/ganma/.opam/4.00.1+annot/bin/ocamlspot")
(setq tuareg-interactive-program "/Users/ganma/.opam/4.00.1+annot/bin/ocaml")
(setq omake-program-path "/Users/ganma/.opam/4.00.1+annot/bin/omake")
;(setq omake-program-arguments "-P -w --verbose")
