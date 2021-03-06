;; melpa
(load (expand-file-name "~/.emacs.d/elpa/package.el"))
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq python-shell-prompt-detect-failure-warning nil)
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

;; display-time-mode
(display-time-mode 1)

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
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

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
(define-key dired-mode-map (kbd "C-s") 'phi-search-dired)

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
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

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

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ctags
(require 'anything-exuberant-ctags)

;; window move
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; zenburn-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; google-this
(google-this-mode 1)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; migemo
(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\g"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8)
(load-library "migemo")
(migemo-init)

;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;対応する括弧を挿入
(require 'smartparens-config)
(smartparens-global-mode t)

;;
;; imenus
;;
(require 'ido-occasional)
(require 'ido-vertical-mode)
(require 'imenus)
(setq ido-enable-flex-matching t)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)


;;; エラー対策
(defun imenu-find-default--or-current-symbol (&rest them)
  (condition-case nil
      (apply them)
    (error (thing-at-point 'symbol))))
(advice-add 'imenu-find-default :around 'imenu-find-default--or-current-symbol)
;;; なぜか現在のシンボルを取ってくれないから
(defun imenus-exit-minibuffer ()
  (exit-minibuffer))

;;; M-oでのmulti-occurをシンボル正規表現にするよう改良
(push '(occur . imenus-ido-multi-occur) imenus-actions)
(defun imenus-ido-multi-occur (buffers input)
  (multi-occur buffers
               (format "\\_<%s\\_>"
                       (regexp-quote (replace-regexp-in-string "^.*|" "" input)))))

;; iedit
(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; elscreen
(elscreen-start)

;; browse the kill ring
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))

;; smartrep
(require 'smartrep)
(smartrep-define-key
    global-map "\C-x" '(("p" . 'git-gutter:previous-hunk)
                        ("n" . 'git-gutter:next-hunk)))

;; clippy
(setq clippy-tip-show-function #'clippy-popup-tip-show)
