(require 'cl-lib)

;; Emacs init config file
(defvar required-packages
  '(monokai-theme
    solarized-theme
    ;clojure-mode
    cider
    ;magit
    ;paredit
    ;powerline
    ;powerline-evil
    evil))

(defun missing-packages ()
  (cl-remove-if nil
		(mapcar
		 (lambda (x) (when (not (package-installed-p x)) x))
		 required-packages)))

;; Initialize package.el and add external repos
(when (>= emacs-major-version 24)
  (require 'package)

  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)


  ;; Pin CIDER to always use MELPA Stable
  ;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable) t)

  ;; Install any missing packages
  (let ((p (missing-packages)))
    (when p
      (message "%s" "Refreshing package database...")
      (package-refresh-contents)
      (message "%s" "Done.")

      (message "%s" "Installing missing packages...")
      (mapcar 'package-install p)
      (message "%s" "Done.")))


  ;;enable evil
  (require 'evil)
  (evil-mode 1)
)

;; Custom config

;; Remove tool, menu and scroll bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Enable number line
(global-linum-mode 1)
(setq linum-format "%3d \u2502")

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "3e4446")

;; Highlight comment annotations
(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

;; Package dependent configurations

;; Load theme
(load-theme 'solarized-dark t)

;; Set default font
(set-default-font "Inconsolata")
(set-face-attribute 'default nil :height 100)

;; Set indentation rules
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)
