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

;;
;; flymake-python
;;
(when (load "flymake" t)
 (defun flymake-pylint-init ()
   (let* ((temp-file (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
          (local-file (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
         (list "pep8" (list "--repeat" local-file))))

 (add-to-list 'flymake-allowed-file-name-masks
              '("\\.py\\'" flymake-pylint-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
