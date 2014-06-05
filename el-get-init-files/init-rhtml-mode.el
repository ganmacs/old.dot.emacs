(require 'rhtml-mode)

(add-hook-lambda 'rhtml-mode
                 (rinari-launch))

(append-to-list 'auto-mode-alist
                ("\\.eco$"    .rhtml-mode)
                ("\\.jeco$"    .rhtml-mode)
                ("\\.js.erb$"    .rhtml-mode))
