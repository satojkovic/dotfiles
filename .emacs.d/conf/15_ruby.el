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
