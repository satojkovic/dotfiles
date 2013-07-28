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

(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/dotfiles/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (global-set-key "\C-j" 'ac-start)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (add-hook 'c++-mode-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)