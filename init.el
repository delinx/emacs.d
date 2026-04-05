;;; -*- lexical-binding: t; -*-

;;; --- Visual

(setq default-frame-alist
      '((width  . 130)
        (height . 40)
        (left   . 1300)
        (top    . 600)))

 ;; A nice theme
 (use-package doom-themes
   :config
   (load-theme 'doom-one t))

(setq-default cursor-type 'box)  ; block cursor
(blink-cursor-mode -1)           ; no blinking
(setq evil-normal-state-cursor   '(box)
      evil-insert-state-cursor   '(box)
      evil-visual-state-cursor   '(box)
      evil-replace-state-cursor  '(box)
      evil-operator-state-cursor '(box)
      evil-emacs-state-cursor    '(box))

(setq w32-mihails-cursor-color "black")
(w32-update-mihails-cursor-color)

(setq-default display-fill-column-indicator-column 120)
(global-display-fill-column-indicator-mode 1)

(show-paren-mode 1)

(setq-default display-line-numbers-width 4)

;;; --- Scroll
(setq scroll-margin 8)

;;; --- Package manager

;; Package sources
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Refresh package list if not done yet
(unless package-archive-contents
  (package-refresh-contents))

;; use-package is built-in on Emacs 29+, but ensure it's set up
(require 'use-package)
(setq use-package-always-ensure t) ; auto-install packages if missing

;;; --- Font
(set-face-attribute 'default nil
  :font "Iosevka:antialias=standard"
  :height 190
  :weight 'normal)   ; weight 400 = normal
;;(setq-default line-spacing 0.5)

(defvar light-mode nil)
(if light-mode
  (set-frame-font "Iosevka-19.0:antialias=subpixel" nil t)
  (set-frame-font "Iosevka-19.0:antialias=standard" nil t))

;;; Ligatures (Iosevka)
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode
    '("<---" "<--" "<<-" "<-" "->" "-->" "--->"
      "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">="
      "<=>" "<==>" "<===>" "::" ":::" "==" "!=" "===" "!=="
      ":=" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "++" "+++"))
  (global-ligature-mode t))

;;; --- Evil

(use-package evil
  :init
  ;; These MUST be set before evil loads
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil) ; required if using evil-collection
  (setq evil-want-C-u-scroll t)  ; C-u scrolls up like vim
  (setq evil-undo-system 'undo-redo) ; use native undo-redo (Emacs 28+)
  :config
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))
  (evil-mode 1))

;; evil-collection provides evil bindings for many built-in modes
;; (dired, magit, help buffers, etc.)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ;;; --- Langs
 (with-eval-after-load 'evil
   (defalias #'forward-evil-word #'forward-evil-symbol)
   (setq-default evil-symbol-word-search t))

 ;;; --- Binds
 (with-eval-after-load 'evil
   (evil-define-key 'normal 'global
     (kbd "K") #'eldoc-print-current-symbol-info))

 (setq eldoc-display-functions '(eldoc-display-in-echo-area))

 (with-eval-after-load 'evil
   (evil-define-key '(normal visual motion) 'global
     (kbd "C-s") #'previous-buffer
     (kbd "C-t") #'next-buffer
     (kbd "C-w") #'kill-current-buffer))

 ;;; --- Other

 (recentf-mode 1)

 ;;; UI Cleanup
 (setq inhibit-startup-message t)  ; no splash screen
 (scroll-bar-mode -1)              ; no scrollbar
 (tool-bar-mode -1)                ; no toolbar
 (menu-bar-mode t)                 ; no menu bar (optional, some like keeping it)
 (set-fringe-mode 10)              ; small breathing room on sides

 ;;; Behaviour
 (setq-default
  tab-width 4
  indent-tabs-mode nil             ; spaces over tabs
  fill-column 120)

 (setq
  make-backup-files nil            ; no ~ backup files cluttering your dirs
  auto-save-default nil            ; no #autosave# files
  create-lockfiles nil
  ring-bell-function 'ignore       ; no audible bell
  scroll-conservatively 101        ; smooth scrolling (don't jump half-screen)
  display-line-numbers-type 'relative) ; relative line numbers (great with evil)

 (global-display-line-numbers-mode t)
 (column-number-mode t)            ; show column in modeline

 ;;; Remember where you were in files
 (save-place-mode 1)

 ;;; Auto-reload files changed on disk
 (global-auto-revert-mode t)

 ;;; Better minibuffer completions
 (setq completion-styles '(flex basic))

 ;;; --- Packages
 ;; Better completion UI in minibuffer (replaces the default list)
 (use-package vertico
   :config (vertico-mode 1))

 ;; Adds rich annotations to vertico (file sizes, docstrings, etc.)
 (use-package marginalia
   :config (marginalia-mode 1))

 ;; Fuzzy search/filter everywhere
 (use-package orderless
   :config
   (setq completion-styles '(orderless basic)))

 ;; Which-key: shows keybinding hints after a pause — essential for learning
 (use-package which-key
   :config
   (which-key-mode 1)
   (setq which-key-idle-delay 1.0))

 ;; Nicer modeline
 (use-package doom-modeline
   :init (doom-modeline-mode 1))

 ;; Git integration
 (use-package magit
   :commands magit-status)

 ;; Syntax highlighting for nearly every language
 (use-package treesit-auto
   :config
   (setq treesit-auto-install 'prompt) ; asks before auto-installing grammars
   (global-treesit-auto-mode))

 ;;; Corfu
 (use-package corfu
   :custom
   (corfu-cycle t)
   (corfu-auto nil)
   (corfu-quit-at-boundary nil)
   (corfu-quit-no-match nil)
   :bind (:map corfu-map
               ("TAB"    . corfu-next)
               ([tab]    . corfu-next)
               ("S-TAB"  . corfu-previous)
               ("RET"    . corfu-insert))
   :init
   (global-corfu-mode)
   (corfu-history-mode)
   (corfu-popupinfo-mode)
   (global-set-key (kbd "C-SPC") #'completion-at-point))

 (use-package nerd-icons-completion
   :after (nerd-icons vertico)
   :config (nerd-icons-completion-mode))

 (use-package nerd-icons-corfu
   :after (nerd-icons corfu)
   :config
   (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
