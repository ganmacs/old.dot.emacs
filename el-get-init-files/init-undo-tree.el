(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-,") 'undo-tree-redo)
