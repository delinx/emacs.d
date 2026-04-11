;;; delinx-theme.el --- Delinx Improved 2026 -*- lexical-binding: t -*-

;; Author: Mihails (Ported from Delinx Neovim/Zed Theme)
;; Version: 1.0
;; Package-Requires: ((emacs "29.1"))

;;; Commentary:
;; Port of the Delinx Improved 2026 Zed theme.
;; Requires Emacs 29+ for full tree-sitter face support.

;;; Code:

(deftheme delinx
  "Delinx Improved 2026 — a dark theme with a teal/tan/green palette."
  :background-mode 'dark
  :kind 'color-scheme)

(let (;; backgrounds
      (bg          "#052525")   ; editor.background
      (bg-dark     "#031b1b")   ; elevated_surface / status_bar / panel
      (bg-hl       "#0a2e2e")   ; active_line (editor.active_line.background ~#0525251a lifted)
      (bg-hover    "#2d4132")   ; element.hover / highlighted_line
      (bg-sel      "#c3d2e1")   ; region — full-contrast vim.visual

      ;; borders
      (border      "#2B2B2B")
      (border-var  "#3C3C3C")

      ;; foregrounds
      (fg          "#c8b491")   ; tan — main text
      (fg-muted    "#9D9D9D")
      (fg-subtle   "#5a6354")   ; placeholder / module / inactive line numbers

      ;; syntax palette
      (turquoise   "#3cdcb4")   ; strings, info, accent
      (riptide     "#82e6d7")   ; numbers, floats, booleans, type.builtin
      (pastelgreen "#82e687")   ; types, constructors, enums, tags
      (green       "#50d246")   ; comments, success, diff+, titles
      (punch       "#eb3741")   ; errors, macros, return/exception, escape
      (mystic      "#c3d2e1")   ; keywords, constants, namespaces, attributes
      (white       "#ffffff")   ; operators, conditional/repeat keywords
      (black       "#000000")
      (purple      "#C586C0")   ; terminal magenta

      ;; line numbers
      (ln-inactive "#2d4132")
      (ln-active   "#c3d2e1"))

  (custom-theme-set-faces
   'delinx

   ;; core
   `(default                    ((t (:background ,bg :foreground ,fg))))
   `(cursor                     ((t (:background ,white :foreground ,fg))))
   `(fringe                     ((t (:background ,bg :foreground ,fg-subtle))))
   `(region                     ((t (:background ,bg-sel :foreground ,black :extend t))))
   `(secondary-selection        ((t (:background ,bg-hover))))
   `(highlight                  ((t (:background ,bg-hover))))
   `(hl-line                    ((t (:background ,bg-hl :extend t))))
   `(vertical-border            ((t (:foreground ,border))))
   `(window-divider             ((t (:foreground ,border))))
   `(window-divider-first-pixel ((t (:foreground ,border-var))))
   `(window-divider-last-pixel  ((t (:foreground ,border-var))))
   `(minibuffer-prompt          ((t (:foreground ,turquoise :weight bold))))
   `(shadow                     ((t (:foreground ,fg-subtle))))
   `(match                      ((t (:background ,bg-hover :foreground ,fg))))
   `(tooltip                    ((t (:background ,bg-dark :foreground ,fg))))

   ;; mode line
   `(mode-line           ((t (:background ,bg-dark :foreground ,fg
                               :box (:line-width 1 :color ,border)))))
   `(mode-line-inactive  ((t (:background ,bg :foreground ,fg-subtle
                               :box (:line-width 1 :color ,border)))))
   `(mode-line-buffer-id ((t (:foreground ,turquoise :weight bold))))
   `(mode-line-emphasis  ((t (:foreground ,white :weight bold))))
   `(mode-line-highlight ((t (:foreground ,mystic))))

   ;; line numbers
   `(line-number              ((t (:foreground ,ln-inactive :background ,bg))))
   `(line-number-current-line ((t (:foreground ,ln-active :background ,bg :weight bold))))
   `(line-number-major-tick   ((t (:foreground ,fg-muted :background ,bg))))
   `(line-number-minor-tick   ((t (:foreground ,fg-subtle :background ,bg))))

   ;; search — active_match=#ffffff66, match=#c8b49166
   `(isearch         ((t (:background ,white :foreground ,punch :weight bold))))
   `(isearch-group-1 ((t (:background ,turquoise :foreground ,bg))))
   `(isearch-group-2 ((t (:background ,riptide :foreground ,bg))))
   `(lazy-highlight  ((t (:background "#3a2e18" :foreground ,fg))))
   `(isearch-fail    ((t (:background ,punch :foreground ,white))))

   ;; links — link_text=riptide, link_uri=turquoise
   `(link         ((t (:foreground ,riptide :underline t))))
   `(link-visited ((t (:foreground ,turquoise :underline t))))
   `(button       ((t (:foreground ,turquoise :underline t))))

   ;; status / diagnostics — warning=tan in Zed
   `(error           ((t (:foreground ,punch :weight bold))))
   `(warning         ((t (:foreground ,fg))))
   `(success         ((t (:foreground ,green))))
   `(flycheck-error   ((t (:underline (:style wave :color ,punch)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,fg)))))
   `(flycheck-info    ((t (:underline (:style wave :color ,turquoise)))))
   `(flymake-error    ((t (:underline (:style wave :color ,punch)))))
   `(flymake-warning  ((t (:underline (:style wave :color ,fg)))))
   `(flymake-note     ((t (:underline (:style wave :color ,turquoise)))))

   ;; font-lock
   ;; NOTE: Zed uses white for conditional/repeat, red for return/exception.
   ;; Emacs has one keyword face; subcategories covered by tree-sitter faces below.
   `(font-lock-comment-face              ((t (:foreground ,green :slant italic))))
   `(font-lock-comment-delimiter-face    ((t (:foreground ,green :slant italic))))
   `(font-lock-doc-face                  ((t (:foreground ,turquoise :slant italic))))
   `(font-lock-doc-markup-face           ((t (:foreground ,turquoise :weight bold))))
   `(font-lock-string-face               ((t (:foreground ,turquoise))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,turquoise :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,punch :weight bold))))
   `(font-lock-escape-face               ((t (:foreground ,punch :weight bold))))
   `(font-lock-keyword-face              ((t (:foreground ,mystic))))
   `(font-lock-builtin-face              ((t (:foreground ,mystic))))
   `(font-lock-constant-face             ((t (:foreground ,mystic :slant normal))))
   `(font-lock-function-name-face        ((t (:foreground ,fg))))
   `(font-lock-function-call-face        ((t (:foreground ,fg))))
   `(font-lock-variable-name-face        ((t (:foreground ,fg))))
   `(font-lock-variable-use-face         ((t (:foreground ,fg))))
   `(font-lock-type-face                 ((t (:foreground ,pastelgreen))))
   `(font-lock-number-face               ((t (:foreground ,riptide))))
   `(font-lock-operator-face             ((t (:foreground ,white))))
   `(font-lock-bracket-face              ((t (:foreground ,fg))))
   `(font-lock-delimiter-face            ((t (:foreground ,fg))))
   `(font-lock-misc-punctuation-face     ((t (:foreground ,fg))))
   `(font-lock-preprocessor-face         ((t (:foreground ,punch :slant italic))))
   `(font-lock-negation-char-face        ((t (:foreground ,white))))
   `(font-lock-warning-face              ((t (:foreground ,punch :weight bold))))

   ;; parens
   `(show-paren-match            ((t (:background ,bg-hover :foreground ,mystic :weight bold))))
   `(show-paren-mismatch         ((t (:background ,punch :foreground ,white :weight bold))))
   `(show-paren-match-expression ((t (:background ,bg-hover))))

   ;; completion
   `(completions-common-part      ((t (:foreground ,turquoise :weight bold))))
   `(completions-first-difference ((t (:foreground ,fg))))
   `(completions-annotations      ((t (:foreground ,fg-subtle :slant italic))))
   `(corfu-default     ((t (:background ,bg-dark :foreground ,fg))))
   `(corfu-current     ((t (:background ,bg-hover :foreground ,fg :weight bold))))
   `(corfu-border      ((t (:background ,border))))
   `(corfu-bar         ((t (:background ,border-var))))
   `(corfu-annotations ((t (:foreground ,fg-subtle :slant italic))))
   `(corfu-deprecated  ((t (:foreground ,fg-subtle :strike-through t))))

   ;; vertico / marginalia
   `(vertico-current          ((t (:background ,bg-hover :extend t))))
   `(marginalia-key           ((t (:foreground ,turquoise))))
   `(marginalia-documentation ((t (:foreground ,fg-subtle :slant italic))))
   `(marginalia-type          ((t (:foreground ,pastelgreen))))
   `(marginalia-file-name     ((t (:foreground ,fg))))
   `(marginalia-modified      ((t (:foreground ,fg))))

   ;; diff / magit — added=#50d246 deleted=#eb3741 modified=tan
   `(diff-added          ((t (:foreground ,green :background "#0e2b10"))))
   `(diff-removed        ((t (:foreground ,punch :background "#2b0e10"))))
   `(diff-changed        ((t (:foreground ,fg   :background "#2b2510"))))
   `(diff-header         ((t (:foreground ,mystic :weight bold))))
   `(diff-file-header    ((t (:foreground ,turquoise :weight bold))))
   `(diff-hunk-header    ((t (:foreground ,fg-subtle))))
   `(diff-refine-added   ((t (:background "#1a4a1a"))))
   `(diff-refine-removed ((t (:background "#4a1a1a"))))
   `(magit-diff-added             ((t (:foreground ,green :background "#0e2b10"))))
   `(magit-diff-removed           ((t (:foreground ,punch :background "#2b0e10"))))
   `(magit-diff-added-highlight   ((t (:foreground ,green :background "#122e14" :weight bold))))
   `(magit-diff-removed-highlight ((t (:foreground ,punch :background "#2e1214" :weight bold))))
   `(magit-section-heading        ((t (:foreground ,turquoise :weight bold))))
   `(magit-branch-local           ((t (:foreground ,pastelgreen))))
   `(magit-branch-remote          ((t (:foreground ,riptide))))
   `(magit-hash                   ((t (:foreground ,fg-subtle))))
   `(magit-tag                    ((t (:foreground ,fg :weight bold))))

   ;; org — title=green bold, text.literal=turquoise
   `(org-level-1          ((t (:foreground ,green :weight bold :height 1.2))))
   `(org-level-2          ((t (:foreground ,turquoise :weight bold :height 1.1))))
   `(org-level-3          ((t (:foreground ,pastelgreen :weight bold))))
   `(org-level-4          ((t (:foreground ,mystic :weight bold))))
   `(org-level-5          ((t (:foreground ,riptide :weight bold))))
   `(org-level-6          ((t (:foreground ,fg :weight bold))))
   `(org-code             ((t (:foreground ,turquoise))))
   `(org-verbatim         ((t (:foreground ,turquoise))))
   `(org-block            ((t (:background ,bg-dark :extend t))))
   `(org-block-begin-line ((t (:foreground ,fg-subtle :slant italic :extend t))))
   `(org-block-end-line   ((t (:foreground ,fg-subtle :slant italic :extend t))))
   `(org-link             ((t (:foreground ,riptide :underline t))))
   `(org-todo             ((t (:foreground ,punch :weight bold))))
   `(org-done             ((t (:foreground ,green :weight bold))))
   `(org-date             ((t (:foreground ,turquoise))))
   `(org-tag              ((t (:foreground ,fg-subtle))))
   `(org-special-keyword  ((t (:foreground ,fg-subtle :slant italic))))
   `(org-table            ((t (:foreground ,mystic))))
   `(org-document-title   ((t (:foreground ,green :weight bold :height 1.4))))
   `(org-checkbox         ((t (:foreground ,turquoise :weight bold))))

   ;; markdown
   `(markdown-header-face-1    ((t (:foreground ,green :weight bold :height 1.2))))
   `(markdown-header-face-2    ((t (:foreground ,turquoise :weight bold :height 1.1))))
   `(markdown-header-face-3    ((t (:foreground ,pastelgreen :weight bold))))
   `(markdown-code-face        ((t (:background ,bg-dark :extend t))))
   `(markdown-inline-code-face ((t (:foreground ,turquoise :background ,bg-dark))))
   `(markdown-link-face        ((t (:foreground ,riptide :underline t))))
   `(markdown-url-face         ((t (:foreground ,turquoise))))
   `(markdown-italic-face      ((t (:foreground ,fg :slant italic))))
   `(markdown-bold-face        ((t (:foreground ,fg :weight bold))))
   `(markdown-list-face        ((t (:foreground ,fg))))
   `(markdown-pre-face         ((t (:foreground ,turquoise))))

   ;; tree-sitter — explicit colors, no inherit, to survive defface resets
   `(treesit-font-lock-face                    ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:comment               ((t (:foreground ,green :slant italic))))
   `(tree-sitter-hl-face:doc                   ((t (:foreground ,turquoise :slant italic))))
   `(tree-sitter-hl-face:string                ((t (:foreground ,turquoise))))
   `(tree-sitter-hl-face:string.special        ((t (:foreground ,turquoise))))
   `(tree-sitter-hl-face:string.escape         ((t (:foreground ,punch :weight bold))))
   `(tree-sitter-hl-face:keyword.directive ((t (:foreground ,punch :slant italic))))
   `(tree-sitter-hl-face:keyword               ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:keyword.control       ((t (:foreground ,white))))
   `(tree-sitter-hl-face:keyword.return        ((t (:foreground ,punch))))
   `(tree-sitter-hl-face:keyword.operator      ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:operator              ((t (:foreground ,white))))
   `(tree-sitter-hl-face:function              ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:function.call         ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:function.macro        ((t (:foreground ,punch :slant italic))))
   `(tree-sitter-hl-face:function.builtin      ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:method                ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:method.call           ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:type                  ((t (:foreground ,pastelgreen))))
   `(tree-sitter-hl-face:type.builtin          ((t (:foreground ,riptide))))
   `(tree-sitter-hl-face:constructor           ((t (:foreground ,pastelgreen))))
   `(tree-sitter-hl-face:variable              ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:variable.builtin      ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:variable.parameter    ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:property              ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:number                ((t (:foreground ,riptide))))
   `(tree-sitter-hl-face:boolean               ((t (:foreground ,riptide :weight bold))))
   `(tree-sitter-hl-face:constant              ((t (:foreground ,mystic :slant normal))))
   `(tree-sitter-hl-face:namespace             ((t (:foreground ,mystic :slant italic))))
   `(tree-sitter-hl-face:attribute             ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:tag                   ((t (:foreground ,pastelgreen))))
   `(tree-sitter-hl-face:tag.attribute         ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:tag.delimiter         ((t (:foreground ,mystic))))
   `(tree-sitter-hl-face:punctuation           ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:punctuation.bracket   ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:punctuation.delimiter ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:label                 ((t (:foreground ,punch))))
   `(tree-sitter-hl-face:enum                  ((t (:foreground ,pastelgreen))))
   `(tree-sitter-hl-face:variant               ((t (:foreground ,pastelgreen))))

   ;; eglot
   `(eglot-highlight-symbol-face           ((t (:background ,bg-hover :weight bold))))
   `(eglot-inlay-hint-face                 ((t (:foreground ,fg-subtle :slant italic))))
   `(eglot-diagnostic-tag-deprecated-face  ((t (:strike-through t :foreground ,fg-subtle))))
   `(eglot-diagnostic-tag-unnecessary-face ((t (:foreground ,fg-subtle))))

   ;; which-key
   `(which-key-key-face               ((t (:foreground ,turquoise :weight bold))))
   `(which-key-group-description-face ((t (:foreground ,mystic))))
   `(which-key-command-description-face ((t (:foreground ,fg))))
   `(which-key-separator-face         ((t (:foreground ,fg-subtle))))

   ;; dired
   `(dired-directory ((t (:foreground ,turquoise :weight bold))))
   `(dired-symlink   ((t (:foreground ,riptide))))
   `(dired-header    ((t (:foreground ,green :weight bold))))
   `(dired-marked    ((t (:foreground ,fg :background ,bg-hover))))
   `(dired-flagged   ((t (:foreground ,punch :background "#2b0e10"))))
   `(dired-ignored   ((t (:foreground ,fg-subtle))))

   ;; ansi / terminal — mapped from terminal.ansi.* in Zed theme
   `(ansi-color-black          ((t (:foreground ,bg-dark :background ,bg-dark))))
   `(ansi-color-red            ((t (:foreground ,punch :background ,punch))))
   `(ansi-color-green          ((t (:foreground ,green :background ,green))))
   `(ansi-color-yellow         ((t (:foreground ,fg :background ,fg))))
   `(ansi-color-blue           ((t (:foreground ,turquoise :background ,turquoise))))
   `(ansi-color-magenta        ((t (:foreground ,purple :background ,purple))))
   `(ansi-color-cyan           ((t (:foreground ,riptide :background ,riptide))))
   `(ansi-color-white          ((t (:foreground ,fg :background ,fg))))
   `(ansi-color-bright-black   ((t (:foreground ,fg-subtle :background ,fg-subtle))))
   `(ansi-color-bright-red     ((t (:foreground "#FF7B72" :background "#FF7B72"))))
   `(ansi-color-bright-green   ((t (:foreground ,pastelgreen :background ,pastelgreen))))
   `(ansi-color-bright-yellow  ((t (:foreground "#d7ba7d" :background "#d7ba7d"))))
   `(ansi-color-bright-blue    ((t (:foreground ,riptide :background ,riptide))))
   `(ansi-color-bright-magenta ((t (:foreground "#D2A8FF" :background "#D2A8FF"))))
   `(ansi-color-bright-cyan    ((t (:foreground "#a8f0e8" :background "#a8f0e8"))))
   `(ansi-color-bright-white   ((t (:foreground ,white :background ,white))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'delinx)

;;; delinx-theme.el ends here