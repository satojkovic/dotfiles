(require 'go-mode)
(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
             (local-set-key (kbd "C-c i") 'go-goto-imports)
             (local-set-key (kbd "C-c d") 'godoc)
             ))

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-autocomplete)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;; go-direx
(define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
