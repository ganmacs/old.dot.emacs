(require 'mykie)
(setq mykie:use-major-mode-key-override t)
(mykie:initialize)

(mykie:set-keys nil
  "C-a"
  :default  (beginning-of-line)
  :C-u      mark-whole-buffer

  "C-e"
  :default  (end-of-line)
  :C-u      (end-of-buffer)

  "SPC"
  :default  self-insert-command
  :C-u&url  (browse-url-at-point)
  :C-u      (just-one-space)
  )
