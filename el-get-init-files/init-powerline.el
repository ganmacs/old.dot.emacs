(require 'powerline)

;; powerline.el
 (defun arrow-right-xpm (color1 color2)
   "Return an XPM right arrow string representing."
   (format "/* XPM */
 static char * arrow_right[] = {
 \"12 18 2 1\",
 \". c %s\",
 \"  c %s\",
 \".           \",
 \"..          \",
 \"...         \",
 \"....        \",
 \".....       \",
 \"......      \",
 \".......     \",
 \"........    \",
 \".........   \",
 \".........   \",
 \"........    \",
 \".......     \",
 \"......      \",
 \".....       \",
 \"....        \",
 \"...         \",
 \"..          \",
 \".           \"};"  color1 color2))

(defun arrow-left-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\". c %s\",
\"  c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\"};"  color2 color1))


(defconst color1 "#462743") ;; 紫
;; (defconst color1 "#63B132") ;; 緑
(defconst color2 "#ccc")
(defconst color3 "#729fcf") ;; 青
(defconst color4 "#444")
(defconst color5 "#222")



(defvar arrow-right-1 (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))
(defvar arrow-right-2 (create-image (arrow-right-xpm color2 color3) 'xpm t :ascent 'center))
(defvar arrow-right-3 (create-image (arrow-right-xpm color3 "None") 'xpm t :ascent 'center))

(defvar arrow-left-1  (create-image (arrow-left-xpm "None" color2) 'xpm t :ascent 'center))
(defvar arrow-left-2  (create-image (arrow-left-xpm color2 color3) 'xpm t :ascent 'center))

(setq-default mode-line-format
 (list
        '(:eval (concat (propertize " %m " 'face 'mode-line-color-1)
                        (propertize " " 'display arrow-right-1)))
        '(:eval (concat (propertize " %b " 'face 'mode-line-color-2)
                        (propertize " " 'display arrow-right-2)))
        '(:eval (concat (propertize " %p " 'face 'mode-line-color-3)
                        (propertize " " 'display arrow-right-3)))
        ;; '("-"
        ;;   minor-mode-alist)

        ;; Justify right by filling with spaces to right fringe - 16
        ;; (16 should be computed rahter than hardcoded)
        '(:eval (propertize " " 'display '((space :align-to (- right-fringe 20)))))

        '(:eval (concat (propertize " " 'display arrow-left-1)
                        (propertize " %4l:%3c " 'face 'mode-line-color-2)))
        '(:eval (concat (propertize " " 'display arrow-left-2)
                        (propertize " %Z%*    " 'face 'mode-line-color-6)))
))

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground "#fff"
                     ;;                     :foreground "#222"
                    :background color1)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
;;                     :foreground "#333"
                    :foreground "#462743"
                    :background color2)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground "#333"
                    :background color3)

(make-face 'mode-line-color-6)
(set-face-attribute 'mode-line-color-6 nil
                    :foreground "#333"
                    :background color3)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color4
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background color5)
