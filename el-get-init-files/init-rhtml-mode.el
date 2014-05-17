(require 'rhtml-mode)

(append-to-list 'auto-mode-alist
                ("\\.eco$"    .rhtml-mode)
                ("\\.jeco$"    .rhtml-mode)
                ("\\.js.erb$"    .rhtml-mode))
