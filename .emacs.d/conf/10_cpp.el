;; google style check by flymake
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
     '(flymake-google-cpplint-command "~/bin/cpplint.py"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; google c style indent
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-make-newline-indent)

;; auto-complete-c-headers
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories
               '"/usr/local/Cellar/gcc49/4.9.3/lib/gcc/4.9/gcc/x86_64-apple-darwin15.2.0/4.9.3/../../../../../../include/c++/4.9.3")
  )
(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; flycheck
(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)

;; eldoc
(require 'c-eldoc)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
(setq c-eldoc-buffer-regenerate-time 60)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)

;; auto-complete-clang
(require 'auto-complete-clang)
(defun my-ac-cc-mode-setup ()
  (setq ac-clang-prefix-header "~/.emacs.d/site-lisp/stdafx.pch")
  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-sources (append '(ac-source-clang)
			   ac-sources)))

(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev
			     ac-source-dictionary
			     ac-source-words-in-same-mode-buffers))
  (add-hook 'c++-mode-hook 'ac-cc-mode-setup)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)
