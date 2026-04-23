;;; dacme-theme.el --- Delinx 2026 -*- lexical-binding: t -*-

(deftheme dacme
  "Delinx-inspired light theme with a warm palette.")

(defface font-lock-control-flow-keyword-face
  '((t :foreground "#C00058"))
  "Face for control flow keywords."
  :group 'font-lock-faces)

(let ((bg         "#EDD1B0")
      (ui         "#E3C1A5")
      (fg         "#444444")
      (com-bg     "#E0C5A5")
      (blue       "#406090")
      (cyan       "#008B8B")
      (gray       "#737373")
      (black      "#000000")
      (white      "#FFFFFF")
      (red        "#A52A2A")
      (magenta    "#C00058")
      (debug-fg   "#FA3744")
      (debug-bg   "#00FF00"))

  (custom-theme-set-faces
   'dacme  ; This links the faces to the 'dacme theme
   
   ;; --- Core Interface ---
   `(default ((t :background ,bg :foreground ,fg)))
   `(cursor ((t :background ,black :foreground ,white)))
   `(region ((t :background ,white :foreground ,fg)))
   `(hl-line ((t :background ,ui)))
   
   ;; --- Gutter & UI ---
   `(line-number ((t :background ,ui :foreground ,gray)))
   `(line-number-current-line ((t :background ,ui :foreground ,black)))
   `(mode-line ((t :background ,ui :foreground ,fg :box nil)))
   `(mode-line-inactive ((t :background ,com-bg :foreground ,gray :box nil)))

   ;; --- Syntax (Italics only for docs/comments) ---
   `(font-lock-comment-face ((t :foreground ,blue :background ,com-bg :slant italic)))
   `(font-lock-doc-face ((t :foreground ,blue :background ,com-bg :slant italic)))
   `(font-lock-string-face ((t :foreground ,blue)))
   `(font-lock-keyword-face ((t :foreground ,fg)))
   `(font-lock-type-face ((t :foreground ,cyan)))
   `(font-lock-constant-face ((t :foreground ,gray)))
   `(font-lock-builtin-face ((t :foreground ,red)))
   `(font-lock-function-name-face ((t :foreground ,fg)))
   `(font-lock-variable-name-face ((t :foreground ,fg)))
   `(font-lock-boolean-face              ((t :inherit font-lock-control-flow-keyword-face)))
   
   ;; --- Specifics ---
   `(font-lock-control-flow-keyword-face ((t :foreground ,magenta)))
   `(font-lock-number-face ((t :foreground ,black)))
   `(font-lock-operator-face ((t :foreground ,black)))

;;; --- Tree-sitter
;; Functions
`(tree-sitter-hl-face:function             ((t :inherit font-lock-function-name-face)))
`(tree-sitter-hl-face:function.call        ((t :inherit font-lock-function-name-face)))
`(tree-sitter-hl-face:function.builtin     ((t :inherit font-lock-builtin-face)))
`(tree-sitter-hl-face:function.macro       ((t :foreground ,magenta)))
`(tree-sitter-hl-face:function.special     ((t :inherit font-lock-builtin-face)))
`(tree-sitter-hl-face:method               ((t :inherit font-lock-function-name-face)))
`(tree-sitter-hl-face:method.call          ((t :inherit font-lock-function-name-face)))
;; Types
`(tree-sitter-hl-face:type                 ((t :inherit font-lock-type-face)))
`(tree-sitter-hl-face:type.parameter       ((t :inherit font-lock-type-face)))
`(tree-sitter-hl-face:type.argument        ((t :inherit font-lock-type-face)))
`(tree-sitter-hl-face:type.builtin         ((t :inherit font-lock-builtin-face)))
`(tree-sitter-hl-face:type.super           ((t :inherit font-lock-type-face)))
`(tree-sitter-hl-face:constructor          ((t :inherit font-lock-type-face)))
;; Variables
`(tree-sitter-hl-face:variable             ((t :inherit font-lock-variable-name-face)))
`(tree-sitter-hl-face:variable.parameter   ((t :inherit font-lock-variable-name-face)))
`(tree-sitter-hl-face:variable.builtin     ((t :inherit font-lock-builtin-face)))
`(tree-sitter-hl-face:variable.special     ((t :inherit font-lock-builtin-face)))
;; Keywords
`(tree-sitter-hl-face:keyword              ((t :inherit font-lock-keyword-face)))
;; Literals
`(tree-sitter-hl-face:number               ((t :inherit font-lock-number-face)))
`(tree-sitter-hl-face:string               ((t :inherit font-lock-string-face)))
`(tree-sitter-hl-face:string.special       ((t :inherit font-lock-string-face)))
`(tree-sitter-hl-face:escape               ((t :foreground ,magenta)))
`(tree-sitter-hl-face:constant             ((t :inherit font-lock-constant-face)))
`(tree-sitter-hl-face:constant.builtin     ((t :inherit font-lock-builtin-face)))
;; Comments & Docs
`(tree-sitter-hl-face:comment              ((t :inherit font-lock-comment-face)))
`(tree-sitter-hl-face:doc                  ((t :inherit font-lock-doc-face)))
;; Operators & Punctuation
`(tree-sitter-hl-face:operator             ((t :inherit font-lock-operator-face)))
`(tree-sitter-hl-face:punctuation          ((t :foreground ,fg)))
`(tree-sitter-hl-face:punctuation.bracket  ((t :foreground ,fg)))
`(tree-sitter-hl-face:punctuation.delimiter ((t :foreground ,fg)))
;; Properties
`(tree-sitter-hl-face:property             ((t :foreground ,fg)))
`(tree-sitter-hl-face:property.definition  ((t :foreground ,fg)))
;; Markup / Web
`(tree-sitter-hl-face:tag                  ((t :inherit font-lock-keyword-face)))
`(tree-sitter-hl-face:attribute            ((t :inherit font-lock-type-face)))
`(tree-sitter-hl-face:label                ((t :foreground ,magenta)))
`(tree-sitter-hl-face:embedded             ((t :foreground ,fg)))
;; other
`(tree-sitter-hl-face:boolean              ((t :inherit font-lock-control-flow-keyword-face)))

   ;;; --- Gutter
   `(fringe ((t :background ,ui :foreground ,gray)))

   ;; --- Error/Debug (Bold) ---
   `(error ((t :foreground ,debug-fg :background ,debug-bg :weight bold)))
   `(warning ((t :foreground ,red :weight bold)))))

   

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;; Functions
(defun my/reload-dacme-theme ()
  (interactive)
  (let ((custom-safe-themes t))
    (disable-theme 'dacme)
    (load-theme 'dacme)))

(provide-theme 'dacme)
