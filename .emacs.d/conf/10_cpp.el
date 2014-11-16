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
(load "c-eldoc")
(add-hook 'c-mode-common-hook 'c-turn-on-eldoc-mode)
(setq c-eldoc-cpp-command "/usr/bin/clang")
(setq c-eldoc-includes "-I/opt/X11/lib/pkgconfig")

;; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/local/Cellar/gcc49/4.9-20131229/lib/gcc/x86_64-apple-darwin13.0.2/4.9.0/include/c++")
  )

(add-hook 'c-mode-common-hook 'my:ac-c-header-init)

;; flymake
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/Users/satojkovic/.pythonz/pythons/CPython-2.7.5/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-common-hook 'my:flymake-google-init)

;; semantic-mode
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
(global-semantic-idle-scheduler-mode 1)
