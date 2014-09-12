(require 'cl)
(add-to-list 'load-path "~/.emacs.d/conf")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;initalize
(require 'initialize)

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; set local recipes
(setq
 el-get-sources
 '(
   (:name migemo                :type github :pkgname "emacs-jp/migemo")
   (:name emmet-mode            :type github :pkgname "smihica/emmet-mode")
   (:name duplicate-thing       :type github :pkgname "ongaeshi/duplicate-thing")
   (:name dash-at-point         :type github :pkgname "stanaka/dash-at-point")
   (:name auto-highlight-symbol :type github :pkgname "emacsmirror/auto-highlight-symbol")
   (:name emacs-anzu            :type github :pkgname "syohex/emacs-anzu")
   (:name key-combo             :type github :pkgname "uk-ar/key-combo")
   (:name zlc                   :type github :pkgname "mooz/emacs-zlc")
   (:name web-mode              :type github :pkgname "fxbois/web-mode")
   (:name google-translate      :type github :pkgname "manzyuk/google-translate")
   (:name dired-ex-isearch      :type github :pkgname "keiji0/elisp")
   (:name powerline             :type github :pkgname "milkypostman/powerline")
   (:name emacs-rotate          :type github :pkgname "daic-h/emacs-rotate")
   (:name pager                 :type github :pkgname "skaslev/emacs.d" :compile "pager.el")
   (:name helm-ls-git           :type github :pkgname "emacs-helm/helm-ls-git" :depends helm)
   (:name emacs-helm-ag         :type github :pkgname "syohex/emacs-helm-ag" :depends helm)
   (:name helm-swoop            :type github :pkgname "ShingoFukuyama/helm-swoop" :depends helm)
   (:name smartparens           :type github :pkgname "Fuco1/smartparens" :depends dash)
   (:name manage-minor-mode     :type github :pkgname "ShingoFukuyama/manage-minor-mode")
   (:name tuareg-mode           :type github :pkgname "ocaml/tuareg")
   (:name emacs-git-grep        :type github :pkgname "ganmacs/emacs-git-grep" :depends helm)

   (:name cider                 :type github :pkgname "clojure-emacs/cider"
          :depends (pkg-info dash clojure-mode epl))

   (:name fold-dwim
          :type http
          :url "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el"
          :localname "fold-dwim.el"
          )
   (:name ssh-agent
          :type http
          :url "http://glozer.net/code/ssh-agent.el"
          :compile "ssh-agent.el"
          )
   ))

;; now set our own packages
(setq
 my-packages
 (append
  '(
    ;; basic
    el-get             ; el-get is self-hosting
    magit              ; It's Magit! An Emacs mode for Git.
    helm               ; Emacs incremental and narrowing framework
    auto-complete      ; The most intelligent auto-completion extension.
    undo-tree          ; Treat undo history as a tree
    yasnippet          ; YASnippet is a template system for Emacs.
    popwin             ; Popup Window Manager.
    shell-switcher     ; An emacs mode to easily switch between shell buffers (like with alt+tab)
    escreen            ; Emacs window session manager
    multiple-cursors   ; An experiment in adding multiple cursors to emacs
    expand-region      ; Expand region increases the selected region by semantic units.
    git-gutter-fringe  ; Fringe version of git-gutter.el
    open-junk-file     ; Open a junk (memo) file to try-and-error
    ace-jump-mode      ; A quick cursor location minor mode for emacs
    quickrun           ; Run commands quickly
    point-undo         ; undo/redo position
    goto-chg           ; Goto the point of the most recent edit in the buffer.
    flycheck           ; On-the-fly syntax checking extension
    recentf-ext        ; Recentf extensions
    helm-etags-plus    ; etags plus for helm-mode
    drag-stuff         ; Drag Stuff is a minor mode for Emacs that makes it possible to drag stuff
    exec-path-from-shell ;  Emacs plugin for dynamic PATH loading
    ; evil               ; Evil is an extensible vi layer for Emacs.

    ;; key env
    smartrep           ; Support sequential operation which omitted prefix keys.
    key-chord          ; Map pairs of simultaneously pressed keys to commands.

    ;; dired
    dired-hacks        ; Collection of useful dired additions.
    dired+             ; Extensions to Dired
    dired-details+     ; Make file details hide-able in dired

    ;; major mode
    coffee-mode        ; coffeescript mode
    js2-mode           ; javascript mode
    php-mode           ; A PHP mode for GNU Emacs
    clojure-mode       ; available  Emacs support for the Clojure language.
    rhtml-mode         ; Major mode for editing RHTML files
    markdown-mode      ; Major mode to edit Markdown files in Emacs
    yaml-mode          ; Simple major mode to edit YAML file for emacs
    scss-mode          ; Major mode for editing SCSS files(http://sass-lang.com)
    jedi               ; An awesome Python auto-completion for Emacs
    haskell-mode       ; A Haskell editing mode
    ghc-mod            ; Happy Haskell programming
    robe-mode          ; Code navigation, documentation lookup and completion for Ruby
    rinari             ; Rinari Is Not A Rails IDE

    ;; looks
    yascroll           ; Yet Another Scroll Bar Mode
    rainbow-mode       ; Colorize color names in buffers
    highlight-indentation ; Function for highlighting indentation
    highlight-symbol   ; Quickly highlight a symbol throughout the buffer
    hlinum             ; Extension for linum.el to highlight current line number
    )
  (mapcar 'el-get-source-name el-get-sources)))

;; set init files directory
(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files/")

;; install new packages and init already installed packages
(el-get 'sync my-packages)

;; load setting file
(require 'settings)

;; load for mac keybinding
(require 'keybinds)

;; local key bind
(require 'sub-keybinds)
