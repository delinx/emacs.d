;;; doom-delinx-theme.el --- Delinx Improved 2026 -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Author: Mihails
;; Source: Ported from Delinx Neovim/Zed Theme
;;
;;; Commentary:
;; Dark theme with teal/tan/green palette, ported from the Delinx Zed/Neovim
;; theme to the doom-themes engine for full face coverage.
;;
;; Key palette notes:
;;   turquoise (#3cdcb4) → strings, docs, accent  → doom `cyan`
;;   riptide   (#82e6d7) → numbers, type.builtin  → doom `blue`
;;   pastelgrn (#82e687) → types, constructors    → doom `green`
;;   brtgreen  (#50d246) → comments, success       → doom `dark-green`
;;   mystic    (#c3d2e1) → keywords, constants     → doom `violet`
;;   punch     (#eb3741) → errors, macros          → doom `red`
;;   tan       (#c8b491) → functions, variables    → doom `fg`
;;   warning is intentionally tan (Zed mapping), not a bright colour.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-delinx-theme nil
  "Options for doom-delinx."
  :group 'doom-themes)

(defcustom doom-delinx-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-delinx-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-delinx
  "Dark theme with teal/tan/green palette, ported from Delinx Zed/Neovim."
  :family 'doom-delinx
  :background-mode 'dark

  ;; name         gui           256           16
  ((bg            '("#052525"   "#052525"     nil))           ; editor.background
   (bg-alt        '("#031b1b"   "#031b1b"     nil))           ; elevated_surface / panel / status bar
   (bg-alt2       '("#0a2e2e"   "#0a2e2e"     nil))           ; active_line background

   ;; base scale: dark → light across bg-dark → mystic
   (base0         '("#020f0f"   "black"       "black"))
   (base1         '("#031b1b"   "#031b1b"     "brightblack")) ; bg-dark
   (base2         '("#052525"   "#052525"     "brightblack")) ; bg
   (base3         '("#0a2e2e"   "#0a2e2e"     "brightblack")) ; bg-hl  (hl-line)
   (base4         '("#2d4132"   "#2d4132"     "brightblack")) ; bg-hover (selection hints)
   (base5         '("#3C3C3C"   "#3C3C3C"     "brightblack")) ; border-var
   (base6         '("#5a6354"   "#5a6354"     "brightblack")) ; fg-subtle / inactive ln
   (base7         '("#9D9D9D"   "#9D9D9D"     "brightblack")) ; fg-muted
   (base8         '("#c3d2e1"   "#c3d2e1"     "brightwhite")) ; mystic (also bg-sel)
   (fg            '("#c8b491"   "#c8b491"     "brightwhite")) ; tan — primary text
   (fg-alt        '("#9D9D9D"   "#9D9D9D"     "brightwhite")) ; fg-muted

   ;; named colours — mapped from Delinx palette
   (grey          '("#5a6354"   "#5a6354"     "brightblack")) ; fg-subtle
   (red           '("#eb3741"   "#eb3741"     "red"))         ; punch — errors, macros, return
   (magenta       '("#C586C0"   "#C586C0"     "magenta"))     ; terminal magenta
   (violet        '("#c3d2e1"   "#c3d2e1"     "brightmagenta")) ; mystic — keywords, constants
   (orange        '("#c8b491"   "#c8b491"     "orange"))      ; tan — builtins (same as fg; keeps warning subtle)
   (yellow        '("#c8b491"   "#c8b491"     "yellow"))      ; tan — warning (Zed: warning = tan)
   (dark-yellow   '("#a0906e"   "#a0906e"     "yellow"))      ; darker tan
   (teal          '("#3cdcb4"   "#3cdcb4"     "green"))       ; turquoise — strings (alias of cyan)
   (green         '("#82e687"   "#82e687"     "green"))       ; pastelgreen — types, tags
   (dark-green    '("#50d246"   "#50d246"     "green"))       ; bright green — comments, success
   (blue          '("#82e6d7"   "#82e6d7"     "brightblue"))  ; riptide — numbers, type.builtin
   (dark-blue     '("#5bc4b8"   "#5bc4b8"     "blue"))        ; mid riptide
   (cyan          '("#3cdcb4"   "#3cdcb4"     "brightcyan"))  ; turquoise — strings, doc, accent
   (dark-cyan     '("#2aa88a"   "#2aa88a"     "cyan"))        ; darker turquoise

   ;; semantic face categories
   ;; (doom uses these to set font-lock and other standard faces automatically)
   (highlight      base4)          ; bg-hover — used for highlight face / match
   (vertical-bar   '("#2B2B2B"  "#2B2B2B"  "black"))
   (selection      base4)          ; bg-hover — secondary-selection
   (builtin        violet)         ; mystic
   (comments       dark-green)     ; bright green italic
   (doc-comments   cyan)           ; turquoise italic
   (constants      violet)         ; mystic
   (functions      fg)             ; tan (no bold — Delinx is understated)
   (keywords       violet)         ; mystic
   (methods        fg)             ; tan
   (operators      '("#ffffff"  "#ffffff"  "white"))  ; pure white — explicit override below
   (type           green)          ; pastelgreen
   (strings        cyan)           ; turquoise
   (variables      fg)             ; tan
   (numbers        blue)           ; riptide
   (region         base8)          ; mystic bg — black fg added via override below
   (error          red)            ; punch
   (warning        yellow)         ; tan (Zed maps warning to tan, not a bright colour)
   (success        dark-green)     ; bright green

   (vc-modified    (doom-darken cyan 0.2))
   (vc-added       (doom-darken dark-green 0.2))
   (vc-deleted     (doom-darken red 0.2))

   ;; modeline
   (-modeline-pad
    (when doom-delinx-padded-modeline
      (if (integerp doom-delinx-padded-modeline)
          doom-delinx-padded-modeline
        4)))
   (modeline-bg          bg-alt)
   (modeline-fg          fg)
   (modeline-inactive-bg bg)
   (modeline-inactive-fg base6))


  ;;;; Base theme face overrides
  (
   ;;; ── Core ──────────────────────────────────────────────────────────────
   (cursor              :background "white" :foreground fg)
   (fringe              :background bg :foreground base6)
   (hl-line             :background base3 :extend t)
   (highlight           :background base4)
   ;; region: full-contrast vim.visual — light bg, black fg
   (region              :background base8 :foreground "black" :extend t)
   (secondary-selection :background base4)
   (match               :background base4 :foreground fg)
   (tooltip             :background bg-alt :foreground fg)
   (shadow              :foreground base6)
   (minibuffer-prompt   :foreground cyan :weight 'bold)

   (vertical-border             :foreground vertical-bar)
   (window-divider              :foreground vertical-bar)
   (window-divider-first-pixel  :foreground base5)
   (window-divider-last-pixel   :foreground base5)

   ;;; ── Line numbers ──────────────────────────────────────────────────────
   ;; inactive = bg-hover green, active = mystic
   ((line-number &override)              :foreground base4  :background bg)
   ((line-number-current-line &override) :foreground base8  :background bg :weight 'bold)
   (line-number-major-tick               :foreground base7  :background bg)
   (line-number-minor-tick               :foreground base6  :background bg)

   ;;; ── Search ────────────────────────────────────────────────────────────
   (isearch         :background "white" :foreground red :weight 'bold)
   (isearch-group-1 :background cyan    :foreground bg)
   (isearch-group-2 :background blue    :foreground bg)
   (isearch-fail    :background red     :foreground "white")
   ;; lazy-highlight: dim amber — matches Delinx "#3a2e18"
   (lazy-highlight  :background "#3a2e18" :foreground fg)

   ;;; ── Links ─────────────────────────────────────────────────────────────
   ((link &override) :foreground blue :underline t)
   (link-visited     :foreground cyan :underline t)
   (button           :foreground cyan :underline t)

   ;;; ── Mode line ─────────────────────────────────────────────────────────
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-bg)
           '(:line-width 1 :color "#2B2B2B")))
   (mode-line-inactive
    :background modeline-inactive-bg :foreground modeline-inactive-fg
    :box (if -modeline-pad
             `(:line-width ,-modeline-pad :color ,modeline-inactive-bg)
           '(:line-width 1 :color "#2B2B2B")))
   (mode-line-buffer-id :foreground cyan  :weight 'bold)
   (mode-line-emphasis  :foreground "white" :weight 'bold)
   (mode-line-highlight :foreground base8)

   ;;; ── Font-lock overrides ───────────────────────────────────────────────
   ;; doom-themes sets comment/string/keyword/type/etc. via semantic vars;
   ;; we override the faces that deviate from doom's defaults or are new in 29+.

   ;; doom adds :weight 'bold to keywords by default — Delinx doesn't
   (font-lock-keyword-face       :foreground violet :weight 'normal)
   ;; doom adds :weight 'bold to functions — Delinx uses plain fg
   (font-lock-function-name-face :foreground fg     :weight 'normal)
   (font-lock-function-call-face :foreground fg)
   (font-lock-variable-use-face  :foreground fg)
   ;; Emacs 29+ faces not covered by doom defaults
   (font-lock-operator-face          :foreground "white")
   (font-lock-bracket-face           :foreground fg)
   (font-lock-delimiter-face         :foreground fg)
   (font-lock-misc-punctuation-face  :foreground fg)
   (font-lock-negation-char-face     :foreground "white")
   (font-lock-preprocessor-face      :foreground red  :slant 'italic)
   (font-lock-escape-face            :foreground red  :weight 'bold)
   (font-lock-regexp-grouping-construct :foreground cyan :weight 'bold)
   (font-lock-regexp-grouping-backslash :foreground red  :weight 'bold)
   (font-lock-doc-markup-face        :foreground cyan  :weight 'bold)
   ;; warning face ≠ font-lock-warning-face in Delinx:
   ;;   warning face → tan (subtle), font-lock-warning-face → red bold
   (warning                          :foreground fg)
   (font-lock-warning-face           :foreground red  :weight 'bold)

   ;;; ── Parens ────────────────────────────────────────────────────────────
   ((show-paren-match &override)      :background base4 :foreground base8 :weight 'bold)
   ((show-paren-mismatch &override)   :background red   :foreground "white" :weight 'bold)
   (show-paren-match-expression       :background base4)

   ;;; ── Completion ────────────────────────────────────────────────────────
   (completions-common-part      :foreground cyan :weight 'bold)
   (completions-first-difference :foreground fg)
   (completions-annotations      :foreground base6 :slant 'italic)

   ;; corfu
   (corfu-default     :background bg-alt :foreground fg)
   (corfu-current     :background base4  :foreground fg :weight 'bold)
   (corfu-border      :background vertical-bar)
   (corfu-bar         :background base5)
   (corfu-annotations :foreground base6  :slant 'italic)
   (corfu-deprecated  :foreground base6  :strike-through t)

   ;; vertico / marginalia
   (vertico-current          :background base4 :extend t)
   (marginalia-key           :foreground cyan)
   (marginalia-documentation :foreground base6 :slant 'italic)
   (marginalia-type          :foreground green)
   (marginalia-file-name     :foreground fg)
   (marginalia-modified      :foreground fg)

   ;;; ── Diagnostics ───────────────────────────────────────────────────────
   ;; flycheck — no background tint (unlike gruvbox port), just wave underlines
   (flycheck-error   :underline `(:style wave :color ,red))
   (flycheck-warning :underline `(:style wave :color ,fg))
   (flycheck-info    :underline `(:style wave :color ,cyan))
   ;; flymake
   (flymake-error   :underline `(:style wave :color ,red))
   (flymake-warning :underline `(:style wave :color ,fg))
   (flymake-note    :underline `(:style wave :color ,cyan))

   ;;; ── eglot ─────────────────────────────────────────────────────────────
   (eglot-highlight-symbol-face           :background base4 :weight 'bold)
   (eglot-inlay-hint-face                 :foreground base6 :slant 'italic)
   (eglot-diagnostic-tag-deprecated-face  :strike-through t :foreground base6)
   (eglot-diagnostic-tag-unnecessary-face :foreground base6)

   ;;; ── Diff ──────────────────────────────────────────────────────────────
   (diff-added          :foreground dark-green :background "#0e2b10")
   (diff-removed        :foreground red        :background "#2b0e10")
   (diff-changed        :foreground fg         :background "#2b2510")
   (diff-header         :foreground base8      :weight 'bold)
   (diff-file-header    :foreground cyan       :weight 'bold)
   (diff-hunk-header    :foreground base6)
   (diff-refine-added   :background "#1a4a1a")
   (diff-refine-removed :background "#4a1a1a")

   ;;; ── Magit ─────────────────────────────────────────────────────────────
   (magit-section-heading             :foreground cyan       :weight 'bold)
   (magit-branch-local                :foreground green)
   (magit-branch-remote               :foreground blue)
   (magit-hash                        :foreground base6)
   (magit-tag                         :foreground fg         :weight 'bold)
   (magit-diff-added                  :foreground dark-green :background "#0e2b10")
   (magit-diff-removed                :foreground red        :background "#2b0e10")
   (magit-diff-added-highlight        :foreground dark-green :background "#122e14" :weight 'bold)
   (magit-diff-removed-highlight      :foreground red        :background "#2e1214" :weight 'bold)
   (magit-diff-hunk-heading           :background base3      :foreground fg-alt)
   (magit-diff-hunk-heading-highlight :background base4      :foreground fg)

   ;;; ── Dired ─────────────────────────────────────────────────────────────
   (dired-directory :foreground cyan       :weight 'bold)
   (dired-symlink   :foreground blue)
   (dired-header    :foreground dark-green :weight 'bold)
   (dired-marked    :foreground fg         :background base4)
   (dired-flagged   :foreground red        :background "#2b0e10")
   (dired-ignored   :foreground base6)

   ;;; ── Org ───────────────────────────────────────────────────────────────
   ;; heading heights are from the original; drop them if you prefer flat headings
   ((outline-1 &override) :foreground dark-green)
   ((outline-2 &override) :foreground cyan)
   ((outline-3 &override) :foreground green)
   ((outline-4 &override) :foreground base8)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground fg)

   (org-level-1         :foreground dark-green :weight 'bold :height 1.2)
   (org-level-2         :foreground cyan        :weight 'bold :height 1.1)
   (org-level-3         :foreground green       :weight 'bold)
   (org-level-4         :foreground base8       :weight 'bold)
   (org-level-5         :foreground blue        :weight 'bold)
   (org-level-6         :foreground fg          :weight 'bold)
   ((org-code &override)       :foreground cyan)
   (org-verbatim        :foreground cyan)
   (org-block           :background bg-alt :extend t)
   (org-block-begin-line :foreground base6 :slant 'italic :extend t)
   (org-block-end-line   :foreground base6 :slant 'italic :extend t)
   ((org-link &override)       :foreground blue :underline t)
   (org-todo            :foreground red        :weight 'bold)
   (org-done            :foreground dark-green :weight 'bold)
   (org-date            :foreground cyan)
   (org-tag             :foreground base6)
   (org-special-keyword :foreground base6 :slant 'italic)
   (org-table           :foreground base8)
   (org-document-title  :foreground dark-green :weight 'bold :height 1.4)
   (org-checkbox        :foreground cyan :weight 'bold)

   ;;; ── Markdown ──────────────────────────────────────────────────────────
   (markdown-header-face-1     :foreground dark-green :weight 'bold :height 1.2)
   (markdown-header-face-2     :foreground cyan        :weight 'bold :height 1.1)
   (markdown-header-face-3     :foreground green       :weight 'bold)
   ((markdown-code-face &override)      :background bg-alt :extend t)
   (markdown-inline-code-face   :foreground cyan :background bg-alt)
   (markdown-link-face          :foreground blue :underline t)
   (markdown-url-face           :foreground cyan)
   (markdown-pre-face           :foreground cyan)
   (markdown-italic-face        :foreground fg   :slant 'italic)
   (markdown-bold-face          :foreground fg   :weight 'bold)
   (markdown-list-face          :foreground fg)

   ;;; ── Which-key ─────────────────────────────────────────────────────────
   (which-key-key-face                  :foreground cyan  :weight 'bold)
   (which-key-group-description-face    :foreground base8)
   (which-key-command-description-face  :foreground fg)
   (which-key-separator-face            :foreground base6)

   ;;; ── doom-modeline ─────────────────────────────────────────────────────
   (doom-modeline-project-dir       :bold t :foreground cyan)
   (doom-modeline-buffer-path       :inherit 'bold :foreground dark-green)
   (doom-modeline-buffer-file       :inherit 'bold :foreground fg)
   (doom-modeline-buffer-modified   :inherit 'bold :foreground base8)
   (doom-modeline-error             :background bg)
   (doom-modeline-buffer-major-mode :foreground green :bold t)
   (doom-modeline-info              :bold t :foreground cyan)
   (doom-modeline-bar               :background dark-green)
   (doom-modeline-panel             :background dark-green :foreground fg)

   ;;; ── Rainbow delimiters ────────────────────────────────────────────────
   (rainbow-delimiters-depth-1-face :foreground cyan)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground base8)

   ;;; ── Highlight-thing / highlight-symbol ────────────────────────────────
   (highlight-thing       :background base3 :distant-foreground fg-alt)
   (highlight-symbol-face :background base3 :distant-foreground fg-alt)

   ;;; ── Tree-sitter (old ts package) ──────────────────────────────────────
   ;; Explicit colours — these intentionally do not inherit from font-lock so
   ;; they survive defface resets, matching the original theme's intent.
   (tree-sitter-hl-face:comment               :foreground dark-green :slant 'italic)
   (tree-sitter-hl-face:doc                   :foreground cyan       :slant 'italic)
   (tree-sitter-hl-face:string                :foreground cyan)
   (tree-sitter-hl-face:string.special        :foreground cyan)
   (tree-sitter-hl-face:string.escape         :foreground red        :weight 'bold)
   (tree-sitter-hl-face:keyword.directive     :foreground red        :slant 'italic)
   (tree-sitter-hl-face:keyword               :foreground violet)
   (tree-sitter-hl-face:keyword.control       :foreground "white")  ; conditional/repeat
   (tree-sitter-hl-face:keyword.return        :foreground red)       ; return/exception
   (tree-sitter-hl-face:keyword.operator      :foreground violet)
   (tree-sitter-hl-face:operator              :foreground "white")
   (tree-sitter-hl-face:function              :foreground fg)
   (tree-sitter-hl-face:function.call         :foreground fg)
   (tree-sitter-hl-face:function.macro        :foreground red        :slant 'italic)
   (tree-sitter-hl-face:function.builtin      :foreground violet)
   (tree-sitter-hl-face:method                :foreground fg)
   (tree-sitter-hl-face:method.call           :foreground fg)
   (tree-sitter-hl-face:type                  :foreground green)
   (tree-sitter-hl-face:type.builtin          :foreground blue)
   (tree-sitter-hl-face:constructor           :foreground green)
   (tree-sitter-hl-face:variable              :foreground fg)
   (tree-sitter-hl-face:variable.builtin      :foreground violet)
   (tree-sitter-hl-face:variable.parameter    :foreground fg)
   (tree-sitter-hl-face:property              :foreground fg)
   (tree-sitter-hl-face:number                :foreground blue)
   (tree-sitter-hl-face:boolean               :foreground blue       :weight 'bold)
   (tree-sitter-hl-face:constant              :foreground violet)
   (tree-sitter-hl-face:namespace             :foreground violet     :slant 'italic)
   (tree-sitter-hl-face:attribute             :foreground violet)
   (tree-sitter-hl-face:tag                   :foreground green)
   (tree-sitter-hl-face:tag.attribute         :foreground fg)
   (tree-sitter-hl-face:tag.delimiter         :foreground violet)
   (tree-sitter-hl-face:punctuation           :foreground fg)
   (tree-sitter-hl-face:punctuation.bracket   :foreground fg)
   (tree-sitter-hl-face:punctuation.delimiter :foreground fg)
   (tree-sitter-hl-face:label                 :foreground red)
   (tree-sitter-hl-face:enum                  :foreground green)
   (tree-sitter-hl-face:variant               :foreground green)

   ;;; ── treesit (Emacs 29+ built-in tree-sitter) ──────────────────────────
   (treesit-font-lock-face :foreground fg)

   ;;; ── ANSI / terminal colours ───────────────────────────────────────────
   ;; Mapped from terminal.ansi.* in the Zed theme source.
   (ansi-color-black          :foreground bg-alt     :background bg-alt)
   (ansi-color-red            :foreground red        :background red)
   (ansi-color-green          :foreground dark-green :background dark-green)
   (ansi-color-yellow         :foreground fg         :background fg)
   (ansi-color-blue           :foreground cyan       :background cyan)
   (ansi-color-magenta        :foreground magenta    :background magenta)
   (ansi-color-cyan           :foreground blue       :background blue)  ; riptide
   (ansi-color-white          :foreground fg         :background fg)
   (ansi-color-bright-black   :foreground base6      :background base6)
   (ansi-color-bright-red     :foreground "#FF7B72"  :background "#FF7B72")
   (ansi-color-bright-green   :foreground green      :background green)
   (ansi-color-bright-yellow  :foreground "#d7ba7d"  :background "#d7ba7d")
   (ansi-color-bright-blue    :foreground blue       :background blue)
   (ansi-color-bright-magenta :foreground "#D2A8FF"  :background "#D2A8FF")
   (ansi-color-bright-cyan    :foreground "#a8f0e8"  :background "#a8f0e8")
   (ansi-color-bright-white   :foreground "white"    :background "white"))

  ;;;; Base theme variable overrides
  ())

;;; doom-delinx-theme.el ends here