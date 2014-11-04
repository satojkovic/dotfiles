(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.c$" . c++-mode))
              auto-mode-alist))

(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)

(add-hook 'c++-mode-hook
          '(lambda()
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)))

;; for find other file
(defvar my-cpp-other-file-alist
  '(("\\.cpp\\'" (".hpp" ".ipp"))
    ("\\.ipp\\'" (".hpp" ".cpp"))
    ("\\.hpp\\'" (".ipp" ".cpp"))
    ("\\.cxx\\'" (".hxx" ".ixx"))
    ("\\.ixx\\'" (".cxx" ".hxx"))
    ("\\.hxx\\'" (".ixx" ".cxx"))
    ("\\.c\\'" (".h"))
    ("\\.h\\'" (".c"))
    ))

(setq-default ff-other-file-alist 'my-cpp-other-file-alist)
(add-hook 'c-initialization-hook (lambda ()
                                   (define-key c-mode-base-map [(meta o)]
                                     'ff-find-other-file))
)

;; eldoc
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
(setq c-eldoc-cpp-command "/usr/bin/clang")

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
