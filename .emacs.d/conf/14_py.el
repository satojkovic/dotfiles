;;
;; fundamental settings
;;
(add-hook 'python-mode-hook
          '(lambda()
             (define-key python-mode-map "\C-m" 'newline-and-indent)
             (setq-default indent-tabs-mode nil)
             (setq python-indent-guess-indent-offset nil)
             ))

;;
;; jedi
;;
(require 'epc)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
