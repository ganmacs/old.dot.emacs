(require 'haskell-mode)
(require 'haskell-cabal)
(require 'haskell-simple-indent)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(eval-after-load "haskell-mode"
  '(progn
     (haskell-simple-indent-mode)
     (define-key haskell-mode-map (kbd "M-n") 'forward-paragraph)
     (define-key haskell-mode-map (kbd "M-p") 'backward-paragraph)
     (define-key haskell-mode-map (kbd "TAB") 'haskell-simple-indent)
     (define-key haskell-mode-map (kbd "<backtab>") 'haskell-simple-indent-backtab)
     (define-key haskell-mode-map (kbd "S-TAB") 'haskell-simple-indent-backtab)
     (define-key haskell-mode-map [remap newline] 'haskell-simple-indent-newline-same-col)
     (define-key haskell-mode-map [remap newline-and-indent] 'haskell-simple-indent-newline-indent)
     ))
