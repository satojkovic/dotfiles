;; melpa
(load (expand-file-name "~/.emacs.d/elpa/package.el"))
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])  

;; ヴィジュアルベル無効
(setq visible-bell nil)

;; ビープ音も無効
(setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; バックアップしない
(setq make-backup-files nil)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; 各種バー非表示
(toggle-scroll-bar nil)
(tool-bar-mode nil)
(menu-bar-mode nil)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 色つける
(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(require 'font-lock)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; kill-lineで行末も削除する
(setq kill-whole-line t)

;; scratchバッファのメッセージを消す
(setq initial-scratch-message "")

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; linum-mode
(require 'linum)
(global-linum-mode 1)

;;
;; フォント
;;
(set-face-attribute 'default nil
		    :family "Monaco"
		    :height 140)
		    ;:height 90)
(set-fontset-font "fontset-default"
		  'japanese-jisx0208
		  '("Osaka" . "iso10646-1"))
(set-fontset-font "fontset-default"
		  'katakana-jisx0201
		  '("Osaka" . "iso10646-1"))
(setq face-font-rescale-alist
      '((".*Monaco-bold.*" . 1.0)
	(".*Monaco-medium.*" . 1.0)
	(".*Osaka-bold.*" . 1.2)
	(".*Osaka-medium.*" . 1.2)
	("-cdac$" . 1.4)))

;;;
;;; fullscreenの設定
;;;
(cond ((= emacs-major-version 24)
       (progn
	 (setq ns-use-native-fullscreen nil)
	 ))
      ((= emacs-major-version 23)
       (progn
	 (ns-toggle-fullscreen-internal)
	 (split-window-horizontally)
	 ))
      )

;;
;; wdired
;;
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;
;; diredでファイル作成
;;
(defun dired-create-file (file-name)
  (interactive "F Create file: ")
  (write-region "" nil file-name nil nil nil))

(define-key dired-mode-map "c" 'dired-create-file)

;; anything
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;; 
;; 現在行のハイライト
;;
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-delay 0.1)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; ido-mode
(require 'ido)
(ido-mode t)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; color-theme-solarized
(load-theme 'solarized-dark t)

;; nyan-mode
(nyan-mode)

;; git-gutter
(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; marked
(defun markdown-preview-file ()
  "run marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name))))
  )
(global-set-key "\C-cm" 'markdown-preview-file)
