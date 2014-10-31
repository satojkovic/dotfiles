;; helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c u") 'helm-imenu)
(global-set-key (kbd "C-c g") 'helm-git-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(helm-mode 1)

(require 'helm-swoop)
