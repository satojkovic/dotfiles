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
;(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))
(require 'auto-complete-clang)
(setq ac-quick-help-delay 0.8)
(defun my-ac-cc-mode-setup ()
  ;; 読み込むプリコンパイル済みヘッダ
  (setq ac-clang-prefix-header "~/dotfiles/.emacs.d/site-lisp/stdafx.pch")
  ;; 補完を自動で開始しない
  (setq ac-auto-start nil)
  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-sources (append '(ac-source-clang
                             ac-source-yasnippet
                             ac-source-gtags)
                           ac-sources)))
(defun my-ac-config ()
  (global-set-key "\C-j" 'ac-start)
  ;; C-n/C-p で候補を選択
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)

  (setq-default ac-sources '(ac-source-abbrev
                             ac-source-dictionary
                             ac-source-words-in-same-mode-buffers))
  (add-hook 'c++-mode-common-hook 'ac-cc-mode-hook)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
 
(my-ac-config)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; magit
(require 'magit)

;; auto-install
(require 'auto-install)

;; anything
;(require 'anything)

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

