;;; doom-delcx-sand-theme.el --- Warm sandy light theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;; Commentary: bg #EDD1B0  fg #444444  strings #406090  types #008B8B  control #C00058  numbers #000000
;;; Code:
(require 'doom-themes)

(defface font-lock-control-flow-face
  '((t :foreground "black" :background "aquamarine"))
  "Face for control flow keywords."
  :group 'font-lock)

(def-doom-theme doom-delcx-sand
  "A warm light theme on sandy parchment with muted ink highlights."
  :family 'doom-delcx-sand
  :background-mode 'light

  ;; name        gui           256           16
  ((bg          '("#EDD1B0"    "#EDD1B0"     nil))
   (bg-alt      '("#E3C1A5"    "#E3C1A5"     nil))
   (base0       '("#F5E0C8"    "#F5E0C8"     nil))
   (base1       '("#EDD1B0"    "#EDD1B0"     nil))
   (base2       '("#E8C8A8"    "#E8C8A8"     nil))
   (base3       '("#E3C1A5"    "#E3C1A5"     nil))
   (base4       '("#D4B090"    "#D4B090"     nil))
   (base5       '("#737373"    "#737373"     nil))
   (base6       '("#606060"    "#606060"     nil))
   (base7       '("#555555"    "#555555"     nil))
   (base8       '("#444444"    "#444444"     nil))
   (fg          '("#444444"    "#444444"     nil))
   (fg-alt      '("#737373"    "#737373"     nil))

   (grey        '("#737373"    "#737373"     nil))
   (red         '("#A52A2A"    "#A52A2A"     nil))
   (orange      '("#A52A2A"    "#A52A2A"     nil))
   (yellow      '("#FED06C"    "#FED06C"     nil))
   (dark-yellow '("#B58640"    "#B58640"     nil))
   (green       '("#008B8B"    "#008B8B"     nil))
   (dark-green  '("#006060"    "#006060"     nil))
   (teal        '("#008B8B"    "#008B8B"     nil))
   (blue        '("#406090"    "#406090"     nil))
   (dark-blue   '("#2A4060"    "#2A4060"     nil))
   (cyan        '("#008B8B"    "#008B8B"     nil))
   (dark-cyan   '("#006060"    "#006060"     nil))
   (magenta     '("#C00058"    "#C00058"     nil))
   (violet      '("#C892EA"    "#C892EA"     nil))

   (black       '("#000000"    "#000000"     nil))
   (white       '("#FFFFFF"    "#FFFFFF"     nil))
   (comment-bg  '("#E0C5A5"    "#E0C5A5"     nil))

   (highlight      teal)
   (vertical-bar   base4)
   (selection      base4)
   (builtin        red)
   (comments       blue)
   (doc-comments   blue)
   (constants      grey)
   (functions      fg)
   (keywords       fg)
   (methods        fg)
   (operators      black)
   (type           cyan)
   (strings        blue)
   (variables      fg)
   (numbers        black)
   (region         white)
   (error          red)
   (warning        red)
   (success        teal)

   (vc-modified    (doom-darken blue 0.15))
   (vc-added       (doom-darken teal 0.15))
   (vc-deleted     (doom-darken red  0.15))

   (modeline-bg            base3)
   (modeline-fg            fg)
   (modeline-inactive-bg   bg)
   (modeline-inactive-fg   grey))

  ;; ============================================================
  ;; Face overrides
  ;; ============================================================
  ;; doom-themes-base.el wires most font-lock faces through the aliases
  ;; above, but its defaults apply extra weight/slant/blends that the
  ;; original Delinx theme did not have. Everything in this section either
  ;;   (a) strips off the extra bold/italic/blend, or
  ;;   (b) diverges from doom's default category mapping (e.g. preprocessor
  ;;       should be red, not operators-colour).
  ((cursor :background black)
   (hl-line :background base3)
   (region  :background white :foreground black)
   ((line-number &override)              :foreground base5)
   ((line-number-current-line &override) :background base3 :foreground black)
   (isearch        :foreground black :background yellow)
   (lazy-highlight :background base4 :foreground fg :weight 'bold)
   (link :foreground blue :underline t :slant 'italic)
   (minibuffer-prompt :foreground teal)
   (mode-line          :background base3 :foreground modeline-fg)
   (mode-line-inactive :background bg    :foreground modeline-inactive-fg)
   (show-paren-match   :background white :foreground black :weight 'bold)
   (fill-column-indicator :foreground base3)
   (trailing-whitespace :background (doom-blend red bg 0.3))

   ;; ---- font-lock ----
   ;; Comments: blue ink on a sandy block, italic — the Delinx signature.
   (font-lock-comment-face           :foreground blue :background comment-bg :slant 'italic)
   (font-lock-comment-delimiter-face :foreground blue)
   (font-lock-string-face            :foreground blue :slant 'italic)
   (font-lock-doc-face               :foreground fg   :background base3)
   (font-lock-doc-markup-face        :foreground grey :background base3)

   ;; Numbers / operators / punctuation — pure black against the sand.
   ;; Doom's default punctuation-face is (doom-blend operators fg 0.25);
   ;; we want the literal colour.
   (font-lock-number-face           :foreground black)
   (font-lock-operator-face         :foreground black)
   (font-lock-punctuation-face      :foreground black)
   (font-lock-misc-punctuation-face :foreground black)

   ;; Brackets and delimiters stay at fg (old theme used d-tan for these).
   ;; Doom inherits both from punctuation-face, so we decouple explicitly.
   (font-lock-bracket-face   :foreground fg)
   (font-lock-delimiter-face :foreground fg)

   ;; Preprocessor / escape / negation: doom defaults to
   ;;   :inherit 'bold :foreground operators
   ;; which would make them bold black. We want red (brown), no bold.
   (font-lock-preprocessor-face      :foreground red  :weight 'normal)
   (font-lock-preprocessor-char-face :foreground red  :weight 'normal)
   (font-lock-escape-face            :foreground red  :weight 'normal)
   (font-lock-negation-char-face     :foreground grey :weight 'normal)

   ;; Regex: plain fg (old theme used d-tan), no bold.
   (font-lock-regexp-face               :foreground fg)
   (font-lock-regexp-grouping-backslash :foreground fg :weight 'normal)
   (font-lock-regexp-grouping-construct :foreground fg :weight 'normal)

   ;; Properties, variable-use, function-call: plain fg, no blend, no bold,
   ;; no italic. Doom defaults are blend+bold for properties, blend for
   ;; variable-use, and italic+blend for function-call.
   (font-lock-property-name-face :foreground fg :weight 'normal)
   (font-lock-property-use-face  :foreground fg :weight 'normal)
   (font-lock-variable-use-face  :foreground fg)
   (font-lock-function-call-face :foreground fg :slant 'normal)

   ;; Custom control-flow face (declared above).
   (font-lock-control-flow-face :foreground magenta)

   ;; ---- tree-sitter.el (external package) ----
   ;; These faces sit in their own namespace and are not touched by
   ;; doom-themes. Wire every variant through to the font-lock equivalent
   ;; so fixes to the latter propagate here automatically.
   (tree-sitter-hl-face:attribute             :inherit 'font-lock-constant-face)
   (tree-sitter-hl-face:comment               :inherit 'font-lock-comment-face)
   (tree-sitter-hl-face:constant              :inherit 'font-lock-constant-face)
   (tree-sitter-hl-face:constant.builtin      :inherit 'font-lock-builtin-face)
   (tree-sitter-hl-face:constructor           :inherit 'font-lock-function-name-face)
   (tree-sitter-hl-face:doc                   :inherit 'font-lock-doc-face)
   (tree-sitter-hl-face:escape                :inherit 'font-lock-escape-face)
   (tree-sitter-hl-face:boolean               :inherit 'font-lock-control-flow-face)
   (tree-sitter-hl-face:function              :inherit 'font-lock-function-name-face)
   (tree-sitter-hl-face:function.builtin      :inherit 'font-lock-builtin-face)
   (tree-sitter-hl-face:function.call         :inherit 'font-lock-function-call-face)
   (tree-sitter-hl-face:function.macro        :inherit 'font-lock-preprocessor-face)
   (tree-sitter-hl-face:function.special      :inherit 'font-lock-preprocessor-face)
   (tree-sitter-hl-face:keyword               :inherit 'font-lock-keyword-face)
   (tree-sitter-hl-face:label                 :inherit 'font-lock-preprocessor-face)
   (tree-sitter-hl-face:method                :inherit 'font-lock-function-name-face)
   (tree-sitter-hl-face:method.call           :inherit 'font-lock-function-call-face)
   (tree-sitter-hl-face:number                :inherit 'font-lock-number-face)
   (tree-sitter-hl-face:operator              :inherit 'font-lock-operator-face)
   (tree-sitter-hl-face:property              :inherit 'font-lock-property-name-face)
   (tree-sitter-hl-face:property.definition   :inherit 'font-lock-property-name-face)
   (tree-sitter-hl-face:punctuation           :inherit 'font-lock-punctuation-face)
   (tree-sitter-hl-face:punctuation.bracket   :inherit 'font-lock-bracket-face)
   (tree-sitter-hl-face:punctuation.delimiter :inherit 'font-lock-delimiter-face)
   (tree-sitter-hl-face:punctuation.special   :inherit 'font-lock-punctuation-face)
   (tree-sitter-hl-face:string                :inherit 'font-lock-string-face)
   (tree-sitter-hl-face:string.special        :inherit 'font-lock-string-face)
   (tree-sitter-hl-face:tag                   :inherit 'font-lock-preprocessor-face)
   (tree-sitter-hl-face:type                  :inherit 'font-lock-type-face)
   (tree-sitter-hl-face:type.argument         :inherit 'font-lock-type-face)
   (tree-sitter-hl-face:type.builtin          :inherit 'font-lock-builtin-face)
   (tree-sitter-hl-face:type.parameter        :inherit 'font-lock-type-face)
   (tree-sitter-hl-face:type.super            :inherit 'font-lock-type-face)
   (tree-sitter-hl-face:variable              :inherit 'font-lock-variable-name-face)
   (tree-sitter-hl-face:variable.builtin      :inherit 'font-lock-builtin-face)
   (tree-sitter-hl-face:variable.parameter    :inherit 'font-lock-variable-name-face)
   (tree-sitter-hl-face:variable.special      :inherit 'font-lock-keyword-face)
   (tree-sitter-hl-face:variable.synthesized  :inherit 'font-lock-variable-name-face)

   ;; ---- Company ----
   (company-tooltip            :background base3 :foreground fg)
   (company-tooltip-selection  :background base4)
   (company-tooltip-common     :foreground teal)
   (company-tooltip-annotation :foreground grey)
   (company-scrollbar-bg       :background base3)
   (company-scrollbar-fg       :background teal)
   (company-preview-common     :foreground teal)

   ;; ---- Flycheck ----
   (flycheck-error   :underline `(:style wave :color ,red)         :background base3)
   (flycheck-warning :underline `(:style wave :color ,dark-yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,blue)        :background base3)

   ;; ---- Dired ----
   (dired-directory :foreground teal :weight 'bold)
   (dired-symlink   :foreground blue)
   (dired-ignored   :foreground grey)
   (dired-header    :foreground red  :weight 'bold)
   (dired-marked    :foreground red)

   ;; ---- Magit ----
   (magit-section-heading             :foreground red :weight 'bold)
   (magit-diff-hunk-heading           :background base3 :foreground fg-alt)
   (magit-diff-hunk-heading-highlight :background base4 :foreground fg)
   (magit-branch-local                :foreground teal)
   (magit-branch-remote               :foreground blue)
   (magit-diff-added             :background (doom-blend teal bg 0.20) :foreground (doom-darken teal 0.20))
   (magit-diff-added-highlight   :background (doom-blend teal bg 0.30) :foreground (doom-darken teal 0.30))
   (magit-diff-removed           :background (doom-blend red  bg 0.20) :foreground (doom-darken red  0.20))
   (magit-diff-removed-highlight :background (doom-blend red  bg 0.30) :foreground (doom-darken red  0.30))

   ;; ---- Org ----
   ((org-level-1 &override) :foreground teal    :weight 'bold)
   ((org-level-2 &override) :foreground blue    :weight 'bold)
   ((org-level-3 &override) :foreground red     :weight 'bold)
   ((org-level-4 &override) :foreground magenta :weight 'bold)
   ((org-code    &override) :foreground red     :background base3)
   ((org-block   &override) :background base3)
   (org-link     :foreground blue :underline t)
   (org-table    :foreground teal)
   (org-verbatim :foreground red)

   ;; ---- Rainbow delimiters ----
   (rainbow-delimiters-depth-1-face :foreground teal)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground red)
   (rainbow-delimiters-depth-4-face :foreground magenta)

   ;; ---- which-key ----
   (which-key-key-face                 :foreground teal)
   (which-key-command-description-face :foreground blue)
   (which-key-group-description-face   :foreground red))

  ())

;;; doom-delcx-sand-theme.el ends here
