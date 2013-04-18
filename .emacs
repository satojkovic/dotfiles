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


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
