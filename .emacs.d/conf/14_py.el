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
(add-to-list 'load-path "~/.emacs.d/el-get/deferred")
(add-to-list 'load-path "~/.emacs.d/el-get/epc")
(add-to-list 'load-path "~/.emacs.d/el-get/ctable")
(add-to-list 'load-path "~/.emacs.d/el-get/jedi")
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
