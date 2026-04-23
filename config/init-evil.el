;;; init-evil.el --- my colemak evil layout -*- lexical-binding: t -*-

(use-package evil
  :init
  ;; Must be set before evil loads
  (setq evil-want-integration        nil
        evil-want-keybinding         nil
        evil-want-C-u-scroll         nil
        evil-undo-system             'undo-redo
        evil-default-state           'emacs
        evil-symbol-word-search      t
        evil-normal-state-cursor     '(box)
        evil-insert-state-cursor     '(box)
        evil-visual-state-cursor     '(box)
        evil-replace-state-cursor    '(box)
        evil-operator-state-cursor   '(box)
        evil-emacs-state-cursor      '(box))

  :config

  ;; --- Reset keymaps BEFORE enabling evil-mode
  (setq evil-normal-state-map (make-sparse-keymap)
        evil-visual-state-map (make-sparse-keymap)
        evil-insert-state-map (make-sparse-keymap)
        evil-motion-state-map (make-sparse-keymap))
  (set-keymap-parent evil-normal-state-map global-map)
  (set-keymap-parent evil-visual-state-map global-map)

  (evil-mode 1)

  ;; --- Misc behavior
  (evil-ex-define-cmd "W" #'evil-write)
  (defalias 'forward-evil-word 'forward-evil-symbol)

  ;; --- Initial states per mode
  ;; evil-normal-state-modes doesn't reliably handle derived modes;
  ;; use evil-set-initial-state instead.
  (setq evil-motion-state-modes nil)

  (dolist (mode '(prog-mode
                  text-mode
                  jai-mode
                  conf-mode
                  yaml-mode
                  toml-mode))
    (evil-set-initial-state mode 'normal))

  ;; --- Leaders
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))

  ;; --- Insert state
  (evil-define-key 'insert 'global
    (kbd "C-v")   #'clipboard-yank
    (kbd "C-SPC") #'completion-at-point)

  ;; --- Visual state
  (evil-define-key 'visual 'global
    (kbd "C-c") #'clipboard-kill-ring-save)

  ;; --- ESC to normal (insert and visual only; motion excluded)
  (evil-define-key '(insert visual) 'global
    (kbd "ESC") #'evil-normal-state)

  (evil-define-key '(normal motion) 'global
  (kbd "V") #'evil-visual-line
  (kbd "v") #'evil-visual-char
  )

  ;; --- Shared movement + info (normal, visual, motion)
  (evil-define-key '(normal visual motion) 'global
    (kbd ";") #'evil-repeat-find-char
    ;; Colemak movement
    (kbd "s") #'evil-backward-char
    (kbd "t") #'evil-forward-char
    (kbd "e") #'evil-next-line
    (kbd "n") #'evil-previous-line
    ;; Navigation
    (kbd "gb") #'xref-go-back
    (kbd "K")  #'eldoc-print-current-symbol-info
    ;; Digit arguments (1-9; 0 is beginning-of-line above)
    (kbd "0") #'evil-beginning-of-line
    (kbd "1") #'digit-argument
    (kbd "2") #'digit-argument
    (kbd "3") #'digit-argument
    (kbd "4") #'digit-argument
    (kbd "5") #'digit-argument
    (kbd "6") #'digit-argument
    (kbd "7") #'digit-argument
    (kbd "8") #'digit-argument
    (kbd "9") #'digit-argument
    ;; Other
    (kbd "C-:") #'eval-expression
    (kbd "b") #'evil-backward-WORD-begin
    (kbd "e") #'evil-forward-word-end
    (kbd "f") #'evil-find-char
    (kbd "F") #'evil-find-char-backward
    (kbd "G") #'evil-goto-line
    (kbd "s") #'evil-backward-char
    (kbd "t") #'evil-forward-char
    (kbd "e") #'evil-next-line
    (kbd "n") #'evil-previous-line
    (kbd "K") #'evil-lookup
    (kbd "m") #'evil-search-next
    (kbd "M") #'evil-search-previous
    (kbd "w") #'evil-forward-word-begin
    (kbd "y") #'evil-yank
    (kbd "gd") #'evil-goto-definition
    (kbd "gg") #'evil-goto-first-line
    (kbd "?") #'evil-search-backward
    (kbd "W") #'evil-window-map
    ;(kbd "C-e") #'evil-scroll-up
    ;(kbd "C-n") #'evil-scroll-down
  )

  (evil-define-key '(visual) 'global
    (kbd "A") #'evil-append
    (kbd "I") #'evil-insert
    (kbd "R") #'evil-change-whole-line
    (kbd "u") #'evil-downcase
    (kbd "U") #'evil-upcase
    (kbd "X") #'evil-delete-line
    (kbd "a") evil-outer-text-objects-map
    (kbd "i") evil-inner-text-objects-map
    (kbd "<insert>") #'undefined
    (kbd "<insertchar>") #'undefined
    (kbd "<escape>") #'evil-exit-visual-state
    (kbd ".") #'evil-repeat
  )

  ;; --- Scrolling (normal, visual)
  (evil-define-key '(normal visual) 'global
    (kbd "C-e") (lambda () (interactive) (evil-scroll-down (max 1 (/ (window-height) 4))))
    (kbd "C-n") (lambda () (interactive) (evil-scroll-up   (max 1 (/ (window-height) 4))))
    (kbd "p") #'evil-paste-after
    (kbd "P") #'evil-paste-before
    (kbd "d") #'evil-delete
    (kbd "x") #'evil-delete-char
  )

  (evil-define-key '(normal) 'global
    (kbd "a") #'evil-append
    (kbd "A") #'evil-append-line
    (kbd "c") #'evil-change
    (kbd "C") #'evil-change-line
    (kbd "D") #'evil-delete-line
    (kbd "I") #'evil-insert-line
    (kbd "o") #'evil-open-below
    (kbd "O") #'evil-open-above
    (kbd "q") #'evil-record-macro
    ;; free Q
    (kbd "r") #'evil-replace
    ;; free s
    (kbd "S") #'evil-change-whole-line
    ;; Free X
    (kbd "y") #'evil-yank
    (kbd ".") #'evil-repeat
    (kbd "@") #'evil-execute-macro
    (kbd "<") #'evil-shift-left
    (kbd ">") #'evil-shift-right
    (kbd "<escape>") #'evil-force-normal-state
    (kbd "u") #'evil-undo
    (kbd "U") #'evil-redo
  )


  ;; --- Normal state
  (evil-define-key 'normal 'global
    (kbd "i")          #'evil-insert
    (kbd "M-x")        #'execute-extended-command
    (kbd ":")        #'evil-ex
    ;; Leader bindings
    (kbd "<leader>x")  #'execute-extended-command
    (kbd "<leader>ff") #'project-find-file
    (kbd "<leader>fr") #'recentf-open
    (kbd "<leader>bb") #'buffer-menu
    (kbd "<leader>pp") #'project-switch-project
    (kbd "<leader>e")  #'treemacs
    (kbd "<leader>kb") #'kill-current-buffer
    (kbd "<leader>kk") #'kill-current-buffer
    (kbd "<leader>kw") (lambda () (interactive) (kill-buffer-and-window))
    (kbd "<leader>fg") #'deadgrep
    (kbd "<leader>z")  #'evil-execute-in-emacs-state)

  (evil-define-key nil evil-window-map
    (kbd "s") #'evil-window-left
    (kbd "n") #'evil-window-up
    (kbd "e") #'evil-window-down
    (kbd "t") #'evil-window-right
    (kbd "k") #'evil-window-delete
    (kbd "a") #'evil-window-new
    (kbd "v") #'evil-window-split
    (kbd "V") #'evil-window-vsplit
    (kbd "w") #'evil-window-next
    (kbd "W") #'evil-window-prev
  )


  ;; --- Hooks
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (evil-local-set-key 'normal (kbd "K") #'eldoc-print-current-symbol-info))))

(provide 'init-evil)

;;; init-evil.el ends here
