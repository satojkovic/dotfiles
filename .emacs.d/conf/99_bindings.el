; C-h必須
(global-set-key "\C-h" 'delete-backward-char)

;;
;; e2wm
;;
(e2wm:add-keymap
 e2wm:pst-minor-mode-keymap
 '(("<M-left>" . e2wm:dp-code) ; code
   ("<M-right>" . e2wm:dp-two) ; two
   ("<M-up>" . e2wm:dp-doc)
   ("<M-down>" . e2wm:dp-dashboard)
   ("C-." . e2wm:pst-history-forward-command)
   ("C-," . e2wm:pst-history-back-command)
   ("M-m" . e2wm:pst-window-select-main-command)
   ) e2wm:prefix-key)

