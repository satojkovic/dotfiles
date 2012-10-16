(require 'ac-python)
(add-to-list 'ac-modes 'python-mode)
(add-hook 'python-mode-hook
          '(lambda()
             (define-key python-mode-map "\C-m" 'newline-and-indent)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

