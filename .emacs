;;
;; load-path
;;
(setq load-path
      (append '("~/.emacs.d/site-lisp")
	      load-path))

;;
;; init-loaderを使う
;; 
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
