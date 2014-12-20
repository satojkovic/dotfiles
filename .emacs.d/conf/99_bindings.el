; C-h必須
(global-set-key "\C-h" 'delete-backward-char)

;; 指定行へジャンプする
(global-set-key (kbd "M-g") 'goto-line)

;; buffer-move
(global-set-key (kbd "C-c <up>") 'buf-move-up)
(global-set-key (kbd "C-c <down>") 'buf-move-down)
(global-set-key (kbd "C-c <left>") 'buf-move-left)
(global-set-key (kbd "C-c <right>") 'buf-move-right)

;; iedit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; delete indentation
(global-set-key "\C-cq" 'delete-indentation)
