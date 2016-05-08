;;
;; python-mode をロードする
;;
(when (autoload 'python-mode "python-mode" "Python editing mode." t)
  ;; python-mode のときのみ python-pep8 のキーバインドを有効にする
  (setq python-mode-hook
        (function (lambda ()
                    (local-set-key "\C-c\ p" 'python-pep8)
                    (local-set-key "\C-m" 'newline-and-indent))))
  (setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
  (setq interpreter-mode-alist (cons '("python" . python-mode)
                                     interpreter-mode-alist)))


;; jedi
(require 'epc)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook
          '(lambda ()
             (define-key python-mode-map (kbd "<C-S-return>") 'jedi:complete)))
(setq jedi:tooltip-method 'nil)
(set-face-attribute 'jedi:highlight-function-argument nil
                    :foreground "green")

;; flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;; electric-pair
(add-hook 'python-mode-hook
          '(lambda ()
              (define-key python-mode-map "\"" 'electric-pair) ;;括弧の補完
              (define-key python-mode-map "\'" 'electric-pair)
              (define-key python-mode-map "(" 'electric-pair)
              (define-key python-mode-map "[" 'electric-pair)
              (define-key python-mode-map "{" 'electric-pair)))

;;
;; elpy
;;
(elpy-enable)
(elpy-use-ipython)
(add-hook 'elpy-mode-hook 'py-yapf-enable-on-save)
