(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source" t)
(setq auto-mode-alist 
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.slim$" . ruby-mode)) auto-mode-alist))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; ミニバッファに表示し、かつオーバーレイ
(setq ruby-block-highlight-toggle t)

;;
;; rsense
;;
(setq rsense-home "/Users/satojkovic/dotfiles/.emacs.d/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          '(lambda()
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)
             (define-key ruby-mode-map (kbd "C-x .") 'ac-complete-rsense)))

(setq rsense-rurema-home (concat rsense-home "/doc/ruby-refm-1.9.2-dynamic-20110629"))
(setq rsense-rurema-refe "refe-1_9_2")