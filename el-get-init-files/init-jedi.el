; http://tkf.github.io/emacs-jedi/latest/#install
(require 'jedi)
(add-hook 'python-mode-hook '(jedi:ac-setup))
(setq jedi:complete-on-dot t)
