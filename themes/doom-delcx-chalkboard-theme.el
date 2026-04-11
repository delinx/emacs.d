;;; doom-delcx-chalkboard-theme.el --- Warm dark green chalkboard -*- lexical-binding: t; no-byte-compile: t; -*-
;;; Commentary: bg #2A302A  fg #DDD8C0  strings #D0A448  types #7898B8  control #68B8A0  numbers #C08890
;;; Code:
(require 'doom-themes)

(def-doom-theme doom-delcx-chalkboard
  "A warm dark theme with a hand-chalked chalkboard feel."
  :family 'doom-delcx-chalkboard
  :background-mode 'dark

  ;; name        gui           256           16
  ((bg          '("#2A302A"    "#2A302A"     nil))
   (bg-alt      '("#393F39"    "#393F39"     nil))
   (base0       '("#1A1E1A"    "#1A1E1A"     nil))
   (base1       '("#202420"    "#202420"     nil))
   (base2       '("#2A302A"    "#2A302A"     nil))
   (base3       '("#384038"    "#384038"     nil))
   (base4       '("#4B514B"    "#4B514B"     nil))
   (base5       '("#5E665E"    "#5E665E"     nil))
   (base6       '("#727B72"    "#727B72"     nil))
   (base7       '("#B8B09E"    "#B8B09E"     nil))
   (base8       '("#DDD8C0"    "#DDD8C0"     nil))
   (fg          '("#DDD8C0"    "#DDD8C0"     nil))
   (fg-alt      '("#B8B09E"    "#B8B09E"     nil))

   ;; 6-palette mapped onto doom standard names
   (grey        '("#727B72"    "#727B72"     nil))  ; = base6
   (red         '("#C08890"    "#C08890"     nil))  ; numbers/mauve (closest red-ish)
   (orange      '("#D0A448"    "#D0A448"     nil))  ; strings/gold
   (yellow      '("#D0A448"    "#D0A448"     nil))  ; strings/gold (same)
   (dark-yellow '("#A88038"    "#A88038"     nil))  ; strings darkened
   (green       '("#68B8A0"    "#68B8A0"     nil))  ; control/sage
   (dark-green  '("#4A9080"    "#4A9080"     nil))  ; control darkened
   (teal        '("#68B8A0"    "#68B8A0"     nil))  ; = green/control
   (blue        '("#7898B8"    "#7898B8"     nil))  ; types/sky
   (dark-blue   '("#587898"    "#587898"     nil))  ; types darkened
   (cyan        '("#68B8A0"    "#68B8A0"     nil))  ; = control/sage
   (dark-cyan   '("#4A9080"    "#4A9080"     nil))  ; control darkened
   (magenta     '("#C08890"    "#C08890"     nil))  ; numbers/mauve
   (violet      '("#C890A0"    "#C890A0"     nil))  ; numbers lightened

   ;; face categories
   (highlight      green)
   (vertical-bar   base4)
   (selection      base4)
   (builtin        blue)
   (comments       base6)
   (doc-comments   base6)
   (constants      magenta)
   (functions      fg)
   (keywords       green)
   (methods        fg)
   (operators      fg)
   (type           blue)
   (strings        orange)
   (variables      fg)
   (numbers        magenta)
   (region         base4)
   (error          red)
   (warning        yellow)
   (success        green)

   (vc-modified    (doom-darken blue  0.15))
   (vc-added       (doom-darken green 0.15))
   (vc-deleted     (doom-darken red   0.15))

   (modeline-bg            base3)
   (modeline-fg            fg)
   (modeline-inactive-bg   bg)
   (modeline-inactive-fg   base6))

  ;;;; Face overrides
  ((cursor :background "white")
   (hl-line :background base3)
   ((line-number &override)              :foreground base5)
   ((line-number-current-line &override) :background base3 :foreground yellow)
   (isearch       :foreground base0 :background orange)
   (lazy-highlight :background base4 :foreground fg :bold bold)
   ((link &override) :foreground blue :underline t)
   (minibuffer-prompt :foreground green)
   (mode-line          :background base3 :foreground modeline-fg)
   (mode-line-inactive :background bg    :foreground modeline-inactive-fg)
   (show-paren-match :background base4 :foreground fg :bold t)
   ;; ── company ──
   (company-tooltip            :background base3 :foreground fg)
   (company-tooltip-selection  :background base4)
   (company-tooltip-common     :foreground green)
   (company-tooltip-annotation :foreground base6)
   (company-scrollbar-bg       :background base3)
   (company-scrollbar-fg       :background green)
   (company-preview-common     :foreground green)
   ;; ── flycheck ──
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,blue)   :background base3)
   ;; ── dired ──
   (dired-directory :foreground green :bold t)
   (dired-symlink   :foreground blue)
   (dired-ignored   :foreground base6)
   (dired-header    :foreground yellow :bold t)
   (dired-marked    :foreground yellow)
   ;; ── magit ──
   (magit-section-heading             :foreground yellow :bold t)
   (magit-diff-hunk-heading           :background base3  :foreground fg-alt)
   (magit-diff-hunk-heading-highlight :background base4  :foreground fg)
   (magit-branch-local                :foreground green)
   (magit-branch-remote               :foreground blue)
   (magit-diff-added                  :background (doom-blend green bg 0.15) :foreground (doom-lighten green 0.3))
   (magit-diff-added-highlight        :background (doom-blend green bg 0.25) :foreground (doom-lighten green 0.15))
   (magit-diff-removed                :background (doom-blend red   bg 0.15) :foreground (doom-lighten red   0.3))
   (magit-diff-removed-highlight      :background (doom-blend red   bg 0.25) :foreground (doom-lighten red   0.15))
   ;; ── org ──
   ((org-level-1 &override) :foreground green  :bold t)
   ((org-level-2 &override) :foreground blue   :bold t)
   ((org-level-3 &override) :foreground yellow :bold t)
   ((org-level-4 &override) :foreground magenta :bold t)
   ((org-code    &override) :foreground orange  :background base3)
   ((org-block   &override) :background base3)
   (org-link     :foreground blue   :underline t)
   (org-table    :foreground green)
   (org-verbatim :foreground yellow)
   ;; ── rainbow-delimiters ──
   (rainbow-delimiters-depth-1-face :foreground green)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground yellow)
   (rainbow-delimiters-depth-4-face :foreground magenta)
   ;; ── which-key ──
   (which-key-key-face                 :foreground green)
   (which-key-command-description-face :foreground blue)
   (which-key-group-description-face   :foreground yellow))

  ())

;;; doom-delcx-chalkboard-theme.el ends here
