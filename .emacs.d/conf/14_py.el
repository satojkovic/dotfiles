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

