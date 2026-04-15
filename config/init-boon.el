;;; init-boon.el --- my colemak boon layout -*- lexical-binding: t -*-

(use-package boon
  :ensure t
  :config
  (boon-mode 1))

(require 'boon-keys)    ;; gets you the empty keymaps
(require 'boon-moves)   ;; boon-move-* functions
(require 'boon-main)    ;; boon-* operator functions
(require 'boon-search)  ;; boon-qsearch-*, boon-occur

;;; MOVES (boon-moves-map)
;; Colemak home row: a r s t / n e i o
;; Design: left hand = backward/up, right hand = forward/down

;; Basic directional
(define-key boon-moves-map (kbd "s") 'backward-char)  ;; char left
(define-key boon-moves-map (kbd "t") 'forward-char)   ;; char right
(define-key boon-moves-map (kbd "e") 'previous-line)
(define-key boon-moves-map (kbd "n") 'next-line)

;(define-key boon-moves-map (kbd "s") 'boon-smarter-backward)  ;; char left
;(define-key boon-moves-map (kbd "t") 'boon-smarter-forward)   ;; char right

;; Word-level
(define-key boon-moves-map (kbd "f") 'boon-backward-word)
(define-key boon-moves-map (kbd "F") 'boon-forward-word)

;; Line
(define-key boon-moves-map (kbd "I") 'boon-beginning-of-line)
(define-key boon-moves-map (kbd "A") 'boon-end-of-line)

;; etc. — fill in as you go

;;; COMMANDS (boon-command-map)
(define-key boon-command-map (kbd "d") 'boon-take-region)   ;; cut/delete
(define-key boon-command-map (kbd "c") 'boon-substitute)    ;; change
(define-key boon-command-map (kbd "p") 'boon-insert-register) ;; paste
;; ... etc.

;;; INSERT MODE ESCAPE
(define-key boon-insert-map [escape] 'boon-set-command-state)

(provide 'init-boon)
