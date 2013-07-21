(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.c$" . c++-mode))
              auto-mode-alist))

(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)

(add-hook 'c++-mode-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

(add-hook 'c++-mode-hook
          '(lambda()
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)))
