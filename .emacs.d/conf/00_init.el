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

;; スクロールバー非表示
(scroll-bar-mode nil)

;; フリンジ(左右の折り返し表示領域)はいらない
(fringe-mode 'none)

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

;;
;; 配色
;;
(if window-system 
    (progn                    
      (set-background-color "Black")
      (set-foreground-color "LightGray")
      ))

(when (>= emacs-major-version 23)
  (ns-toggle-fullscreen-internal)
  (split-window-horizontally))

;;
;; auto-complete
;;
(setq ac-dir "~/dotfiles/.emacs.d/auto-complete/")
(add-to-list 'load-path ac-dir)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))
(ac-config-default)
(setq ac-delay 0.5)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; magit
(require 'magit)

;; auto-install
(require 'auto-install)

;; anything
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key (kbd "C-;") 'anything)

(require 'anything)
(require 'anything-rcodetools)
;; Command to get all RI entries.
(setq rct-get-all-methods-command "PAGER=cat fri -l")
;; See docs
(define-key anything-map "\C-e" 'anything-execute-persistent-action)

;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

;; succor.el
(require 'succor)
(setq *succor-directory* "~/.succor/")
(setq succor-gtags-enable t)
(setq succor-imenu-enable t)

;; iswitchb
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
          (lambda()
            (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
            (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;;
;; flymake
;;
(require 'flymake)
(require 'set-perl5lib)

;; エラー、ウォーニング時のフェイス
(set-face-background 'flymake-errline "red4")
(set-face-foreground 'flymake-errline "black")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "black")

;; エラーをミニバッファに表示
;; http://d.hatena.ne.jp/xcezx/20080314/1205475020
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

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

;;
;; e2wm
;;
(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)

;;
;; markdown mode
;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;
;; el-get
;;
(require 'el-get)

;;
;; anything-git-files
;;
(add-to-list 'load-path "~/.emacs.d/el-get/anything-git-files")
(require 'anything-git-files)

;;
;; open github from here
;;
(add-to-list 'load-path "~/.emacs.d/el-get/open-github-from-here")
(require 'open-github-from-here)

;;
;; popwin
;;
(add-to-list 'load-path "~/.emacs.d/el-get/popwin")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '(dired-mode :position top) popwin:special-display-config)

;;
;; yasnippet
;;
(add-to-list 'load-path "~/.emacs.d/el-get/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/el-get/yasnippet/snippets"))
(yas-global-mode 1)