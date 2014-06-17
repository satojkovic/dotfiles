;;
;; load-path
;;
(setq load-path
      (append '("~/.emacs.d/site-lisp")
              '("~/.emacs.d/auto-install")
              '("~/.emacs.d/site-lisp/ess-12.09/")
              '("/usr/local/share/emacs/site-lisp")
              '("~/.emacs.d/el-get/el-get/")
              load-path))

;;
;; init-loaderを使う
;; 
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(if (not (equal (init-loader-error-log) ""))
    (init-loader-show-log))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
