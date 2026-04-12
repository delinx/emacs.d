;;; -*- lexical-binding: t; -*-

;;; --- Rendering / Optimizations
(setq redisplay-skip-fontification-on-input t)
(setq gc-cons-threshold (* 512 1024 1024))  ; 512MB — replaced by gcmh below
(setq native-comp-async-report-warnings-errors nil)
(setq package-native-compile t)
(pixel-scroll-precision-mode 1)

;;; --- Package Manager

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)

;;; --- Custom File

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;; --- Aliases

(with-eval-after-load 'evil
  (evil-ex-define-cmd "W" 'evil-write))

;;; --- Visual

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode t)
(set-fringe-mode 10)
(column-number-mode t)

(setq default-frame-alist
      '((width  . 150)
        (height . 42)
        (left   . 1300)
        (top    . 600)))

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))

(load-theme 'doom-delcx-dusk t)

(defvar delcx-themes
  ;doom-delcx-parchment
  '(doom-delcx-chalkboard doom-delcx-teal doom-delcx-amber doom-delcx-dusk))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-state-icon t))

(setq-default cursor-type 'box)
(blink-cursor-mode -1)

;; Custom patch for cursor, important
(when (and (eq system-type 'windows-nt)
           (boundp 'w32-mihails-cursor-color)
           (fboundp 'w32-update-mihails-cursor-color))
  (setq w32-mihails-cursor-color "black")
  (w32-update-mihails-cursor-color))

(use-package nerd-icons)

(use-package nerd-icons-completion
  :after (nerd-icons vertico)
  :config (nerd-icons-completion-mode))

(use-package nerd-icons-corfu
  :after (nerd-icons corfu)
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;;; --- Font

(defvar light-mode t)

(if light-mode
    (set-frame-font "Iosevka-20.0:antialias=subpixel" nil t)
  (set-frame-font "Iosevka-19.5:antialias=standard" nil t))

(setq-default line-spacing 0.1)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
    '(
      "-<<" "-<" "-<-" "<--" "<---" "<<-" "<-"
      "->" "->>" "-->" "--->" "->-" ">-" ">>-"
      "=<<" "=<" "=<=" "<==" "<===" "<<=" "<="
      "=>" "=>>" "==>" "===>" "=>=" ">=" ">>="
      "<->" "<-->" "<--->" "<---->"
      "<=>" "<==>" "<===>" "<====>"
      "::" ":::" "__"
      "<~~" "</" "</>" "/>" "~~>"
      "==" "!=" "/=" "~=" "<>" "===" "!==" "!===" "=/=" "=!="
      "<:" ":=" "*=" "*+" ":>"
      "<*" "<*>" "*>" "<|" "<|>" "|>"
      "<." "<.>" ".>"
      "(*" "*)" "/*" "*/" "[|" "|]" "{|" "|}"
      "++" "+++"
      "\\/" "/\\"
      "|-" "-|"
      "<!--" "<!--->"))
  (global-ligature-mode t))

;;; --- Behaviour

(setq-default
 tab-width 4
 indent-tabs-mode nil
 fill-column 120)

(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil
 ring-bell-function 'ignore
 scroll-conservatively 101
 scroll-margin 8
 display-line-numbers-type 'relative)

(setq-default display-line-numbers-width 4)

(global-display-line-numbers-mode t)
(save-place-mode 1)
(global-auto-revert-mode t)
(recentf-mode 1)

(setq-default display-fill-column-indicator-column 120)
(global-display-fill-column-indicator-mode 1)

(setq eldoc-display-functions '(eldoc-display-in-echo-area))

;;; --- GC

(use-package gcmh
  :config
  (setq gcmh-high-cons-threshold (* 512 1024 1024))
  (gcmh-mode 1))

;;; --- Evil

(setq select-enable-clipboard t
      save-interprogram-paste-before-kill t
      select-enable-primary nil)

(use-package evil
  :init
  (setq evil-want-integration nil
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-undo-system 'undo-redo
        evil-default-state 'emacs
        evil-normal-state-cursor   '(box)
        evil-insert-state-cursor   '(box)
        evil-visual-state-cursor   '(box)
        evil-replace-state-cursor  '(box)
        evil-operator-state-cursor '(box)
        evil-emacs-state-cursor    '(box))
  :config
  (setq evil-normal-state-modes
        '(prog-mode
          text-mode
          jai-mode
          conf-mode
          yaml-mode
          toml-mode))
  (setq evil-motion-state-modes nil)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))
  (evil-mode 1))

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  (setq-default evil-symbol-word-search t))

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  (setq-default evil-symbol-word-search t))

;;; --- Keybinds

;;; Override minor mode — bindings here beat everything
(defvar my-override-map (make-sparse-keymap))
(define-minor-mode my-override-mode
  "Global minor mode whose bindings always win."
  :global t
  :keymap my-override-map)
(my-override-mode 1)
(evil-make-intercept-map my-override-map)

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (local-set-key (kbd "C-v") #'clipboard-yank)))

(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-v") #'clipboard-yank)

  (evil-define-key 'visual 'global
    (kbd "C-c") #'clipboard-kill-ring-save)

  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (evil-local-set-key 'normal (kbd "K") #'eldoc-print-current-symbol-info)))

  (evil-define-key '(normal visual motion) 'global
    (kbd "<leader>kb") #'kill-current-buffer
    (kbd "gb") #'xref-go-back
    (kbd "K") #'eldoc-print-current-symbol-info)

  (evil-define-key '(insert) 'global
    (kbd "C-SPC") #'completion-at-point)

    (evil-define-key '(normal visual) 'global
        (kbd "C-d") (lambda () (interactive) (evil-scroll-down (max 1 (/ (window-height) 4))))
        (kbd "C-u") (lambda () (interactive) (evil-scroll-up  (max 1 (/ (window-height) 4)))))

  (evil-define-key 'normal 'global
    (kbd "<leader>x") #'execute-extended-command
    (kbd "<leader>ff") #'project-find-file
    (kbd "<leader>fr") #'recentf-open
    (kbd "<leader>bb") #'buffer-menu
    (kbd "<leader>pp") #'project-switch-project
    (kbd "<leader>e")  #'treemacs
    (kbd "<leader>x")  #'execute-extended-command
    (kbd "<leader>kk")  #'kill-current-buffer
    (kbd "<leader>z")  #'evil-execute-in-emacs-state
    (kbd "<leader>fg") #'deadgrep
    (kbd "<leader>kw")  (lambda () (interactive) (kill-buffer-and-window))))


;;; --- Completion

(use-package vertico
  :config
  (vertico-mode 1)
  (define-key vertico-map (kbd "TAB")       #'vertico-next)
  (define-key vertico-map (kbd "<backtab>") #'vertico-previous))

(use-package consult
  :config
  (setq completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args))))

(use-package marginalia
  :config (marginalia-mode 1))

(use-package hotfuzz
  :ensure t)

(use-package orderless
  :config
  (setq completion-styles '(hotfuzz orderless basic)
        completion-category-overrides '((command (styles hotfuzz orderless basic))
                                        (file    (styles hotfuzz orderless basic))
                                        (symbol  (styles hotfuzz orderless basic)))))

;;; --- UI

(use-package which-key
  :ensure nil  ; built-in since Emacs 30
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 1.0))

(use-package iflipb
  :ensure t
  :custom
  (iflipb-wrap-around t)
  (iflipb-ignore-buffers (lambda (buf)
                         (and (string-match-p "^[*]" buf)
                         (not (string-match-p "^\\*deadgrep" buf)))))
  :bind (:map my-override-map
         ("C-s" . iflipb-previous-buffer)
         ("C-t" . iflipb-next-buffer)))

(use-package treemacs
  :config
  (setq treemacs-width 25
        treemacs-show-hidden-files t
        treemacs-position 'right)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

(add-hook 'treemacs-mode-hook
          (lambda ()
            (text-scale-set -1.5)))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-nerd-icons
  :after (treemacs nerd-icons)
  :config (treemacs-load-theme "nerd-icons"))

;;; --- Tools

(use-package magit
  :commands magit-status)

(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :init
  (setq tree-sitter-langs-grammar-dir "C:/other/grammar"))

;;; --- LSP (Eglot)

(use-package eglot
  :ensure nil  ; built-in
  :hook ((c-ts-mode c-mode rust-ts-mode rust-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t
        eglot-ignored-server-capabilities '(:inlayHintProvider)))

(use-package eglot-booster
  :vc (:url "https://github.com/jdtsmith/eglot-booster" :rev :newest)
  :after eglot
  :config (eglot-booster-mode))

(use-package popper
  :ensure t
  :bind (("M-p"   . popper-cycle)
         ("C-M-p" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

;;; --- Langs

; --- Jai
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(jai-mode . ("jails"))))

(use-package jai-mode
  :vc (:url "https://github.com/elp-revive/jai-mode" :rev :newest)
  :mode "\\.jai\\'"
  :hook ((jai-mode . eglot-ensure)
         (jai-mode . (lambda ()
                       (setq-local tab-width 4
                                   indent-tabs-mode nil)))))
(add-hook 'jai-mode-hook
          (lambda ()
            (setq-local beginning-of-defun-function nil)))



;; Safe paths
(add-to-list 'safe-local-variable-directories "A:/Projects/uST01_j/")
