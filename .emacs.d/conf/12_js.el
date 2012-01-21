(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(autoload 'js2-mode "js2" nil t)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 4
                    js-expr-indent-offset 4
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))

;; ac-my-completion for auto-complete
(defun ac-my-completion-list-in-files (files &optional keywords-variable)
  "create completion list for auto-complete"
  (let ((ksymbol keywords-variable) keywords)
    (cond
     ((stringp files)
      (setq files (list files)))
     ((stringp keywords-variable)
      (setq ksymbol (intern keywords-variable))))
    (if (not (boundp ksymbol))
        (progn
          (dolist (file files)
            (let ((buffer (find-file-noselect file)) filename)
              (setq filename (file-name-nondirectory file))
              (with-current-buffer buffer
                (rename-buffer
                 (concat " *" filename "*") t)
                (if (< (buffer-size) 131072) ; 128Kb
                    (save-excursion
                      (goto-char (point-min))
                      (while (re-search-forward "^[^;]\\(\\s_\\|\\sw\\)+\\b$" nil t)
                        (let ((candidate (match-string-no-properties 0)))
                          (if (not (member candidate keywords))
                              (push candidate keywords))))
                      (setq keywords (nreverse keywords)))))))
          ;; (sort keywords #'(lambda (a b) (> (length a) (length b))))
          (if ksymbol
              (set-default ksymbol keywords))
          (message (concat "Building ac-source keywords(" (symbol-name ksymbol) ")...done."))
          keywords))))

(defun ac-my-completion-files (files mode-name &optional set-hook)
  "set completion list to mode-variable for auto-complete"
  (lexical-let
      ((--ac-source (intern (concat "ac-source-" mode-name)))
       (--ac-source-keywords (intern (concat "ac-source-" mode-name "-keywords")))
       (--mode-hook (intern (concat mode-name "-mode-hook")))
       (--files files))
    (set-default --ac-source
                 (list (cons 'candidates
                             (lambda ()
                               (all-completions ac-prefix (symbol-value --ac-source-keywords))))))
    (if set-hook
        (add-hook --mode-hook
                  (lambda()
                    (ac-my-completion-list-in-files --files --ac-source-keywords)
                    (make-local-variable 'ac-sources)
                    (setq ac-sources (append ac-sources (list --ac-source)))))
      (ac-my-completion-list-in-files --files --ac-source-keywords))))

;; 以下をモード毎に設定
(ac-my-completion-files "~/.emacs.d/javascript+DOM" "js2" t)
