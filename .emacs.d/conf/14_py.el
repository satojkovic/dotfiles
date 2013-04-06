(require 'ac-python)
;(add-to-list 'ac-modes 'python-mode)
(add-to-list 'ac-modes 'python-2-mode)
(add-hook 'python-mode-hook
          '(lambda()
             (define-key python-mode-map "\C-m" 'newline-and-indent)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;;
;; jedi
;;
(add-to-list 'load-path "~/.emacs.d/el-get/deferred")
(add-to-list 'load-path "~/.emacs.d/el-get/epc")
(add-to-list 'load-path "~/.emacs.d/el-get/ctable")
(add-to-list 'load-path "~/.emacs.d/el-get/jedi")
;(add-hook 'python-mode-hook 'jedi:ac-setup)
(jedi:key-complete (kbd "<C-tab>"))
(jedi:key-goto-definition (kbd "C-c g"))
(jedi:key-show-doc (kbd "C-c d"))
(jedi:key-related-names (kbd "C-c r"))
(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:setup-keys t)
(require 'jedi)

