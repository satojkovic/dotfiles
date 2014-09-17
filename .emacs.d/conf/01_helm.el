;; helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(helm-mode 1)

(require 'helm-swoop)
