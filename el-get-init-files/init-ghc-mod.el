(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))

(autoload 'ghc-init "ghc" nil t)

(defun my/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  (setq flycheck-checker 'haskell-ghc)
  (add-to-list 'ac-sources 'ac-source-ghc-mod)
  (ghc-init))

(add-hook 'haskell-mode-hook 'my/haskell-mode-hook)
