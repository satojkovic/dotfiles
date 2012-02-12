(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.c$" . c++-mode))
              auto-mode-alist))

(add-hook 'c++-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'statement-cont 0)
             (c-set-offset 'brace-list-open 0)
             (c-set-offset 'case-label 4)
             ))

(add-hook 'c++-mode-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

