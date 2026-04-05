;;; -*- lexical-binding: t; -*-

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

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-state-icon t))

(setq-default cursor-type 'box)
(blink-cursor-mode -1)

;; Custom patch for cursor, important
(when (eq system-type 'windows-nt)
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

(defvar light-mode nil)

(if light-mode
    (set-frame-font "Iosevka-19.0:antialias=subpixel" nil t)
  (set-frame-font "Iosevka-19.0:antialias=standard" nil t))

(setq-default line-spacing 0.1)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
    '("<---" "<--" "<<-" "<-" "->" "-->" "--->"
      "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">="
      "<=>" "<==>" "<===>" "::" ":::" "==" "!=" "===" "!=="
      ":=" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "++" "+++"))
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
(show-paren-mode 1)

(setq-default display-fill-column-indicator-column 120)
(global-display-fill-column-indicator-mode 1)

(setq eldoc-display-functions '(eldoc-display-in-echo-area))

;;; --- Evil

(setq select-enable-clipboard t
      save-interprogram-paste-before-kill t
      x-select-enable-primary nil)

(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-undo-system 'undo-redo
        evil-normal-state-cursor   '(box)
        evil-insert-state-cursor   '(box)
        evil-visual-state-cursor   '(box)
        evil-replace-state-cursor  '(box)
        evil-operator-state-cursor '(box)
        evil-emacs-state-cursor    '(box))
  :config
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  (setq-default evil-symbol-word-search t))

;;; --- Keybinds

(add-hook 'minibuffer-setup-hook
          (lambda ()
            (local-set-key (kbd "C-v") #'clipboard-yank)))

(with-eval-after-load 'evil
  (define-key evil-insert-state-map (kbd "C-v") #'clipboard-yank)

  (evil-define-key 'visual 'global
    (kbd "C-c") #'clipboard-kill-ring-save)

  (evil-define-key '(normal visual motion) 'global
    (kbd "C-w") #'kill-current-buffer
    (kbd "K")   #'eldoc-print-current-symbol-info)

  (evil-define-key 'normal 'global
    (kbd "<leader>ff") #'find-file
    (kbd "<leader>fr") #'recentf-open-files
    (kbd "<leader>bb") #'buffer-menu
    (kbd "<leader>e")  #'treemacs
    (kbd "<leader>pp") #'projectile-switch-project
    (kbd "<leader>pa") #'projectile-add-known-project
    (kbd "<leader>pf") #'projectile-find-file
    (kbd "<leader>pc") #'projectile-compile-project
    (kbd "<leader>x")  #'execute-extended-command
    (kbd "<leader>w")  (lambda () (interactive) (kill-buffer-and-window))))

;;; --- Completion

(use-package vertico
  :config (vertico-mode 1))

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

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto nil)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match t)
  :bind (:map corfu-map
              ("TAB"   . corfu-next)
              ([tab]   . corfu-next)
              ("S-TAB" . corfu-previous)
              ("RET"   . corfu-insert))
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  (global-set-key (kbd "C-SPC") #'completion-at-point))

;;; --- UI

(use-package which-key
  :config
  (which-key-mode 1)
  (setq which-key-idle-delay 1.0))

(use-package centaur-tabs
  :after projectile
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-show-new-tab-button nil
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-group-by-projectile-project)
  (with-eval-after-load 'evil
    (evil-define-key '(normal visual motion) 'global
      (kbd "C-s") #'centaur-tabs-backward
      (kbd "C-t") #'centaur-tabs-forward)))

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

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-nerd-icons
  :after (treemacs nerd-icons)
  :config (treemacs-load-theme "nerd-icons"))

;;; --- Tools

(use-package magit
  :commands magit-status)

(use-package projectile
  :config (projectile-mode +1))

(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))
