(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

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
(require 'eldoc)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)

;; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-hook 'my:ac-c-header-init)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)

;; flymake
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/Users/satojkovic/bin/cpplint.py"))
  (add-hook 'c++-mode-hook 'flymake-google-cpplint-load)
  (add-hook 'c-mode-common-hook 'flymake-google-cpplint-load)
  )
(add-hook 'c-mode-common-hook 'my:flymake-google-init)

;; semantic-mode
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(global-semantic-idle-scheduler-mode 1)
;; flycheck
(add-hook 'c-mode-common-hook 'flycheck-mode)
