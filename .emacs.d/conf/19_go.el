(require 'go-mode)
(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             ))

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-autocomplete)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)
