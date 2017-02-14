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

;;
;; elpy
;;
(elpy-enable)
(elpy-use-ipython)
(add-hook 'elpy-mode-hook 'py-yapf-enable-on-save)
(set-face-background 'highlight-indentation-face "#313131")
(set-face-background 'highlight-indentation-current-column-face "#777777")
(add-hook 'elpy-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'elpy-mode-hook
          '(lambda ()
             (define-key elpy-mode-map "\C-c\C-c" 'quickrun)
             (auto-complete-mode -1)
             (define-key company-active-map (kbd "\C-n") 'company-select-next)
             (define-key company-active-map (kbd "\C-p") 'company-select-previous)
             (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
             (define-key company-active-map (kbd "<tab>") 'company-complete)
             ))

;; use flycheck
(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(define-key elpy-mode-map (kbd "C-c C-v") 'helm-flycheck)
(require 'smartrep)
(smartrep-define-key elpy-mode-map "C-c"
  '(("C-n" . flycheck-next-error)
    ("C-p" . flycheck-previous-error)))
