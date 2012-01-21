(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.cpp$" . c++-mode))
              auto-mode-alist))

(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "cc-mode")
             (setq c-tab-always-indent nil)))

