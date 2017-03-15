;; Install packages
;; ------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 '(package-selected-packages
   (quote
    (magit projectile neotree py-autopep8 flycheck elpy better-defaults pyenv-mode-auto paradox gruvbox-theme))))
(custom-set-faces
)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(package-install-selected-packages)

;; Basic settings
;; ------------------------------

(load-theme 'gruvbox t) ;; load gruvbox theme
(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(setq visible-bell nil) ;; disable visible bell

(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Project control
;; ------------------------------

(require 'neotree) ;; shows a project tree
(projectile-mode) ;; finds files inside the project

(global-set-key [f2] 'neotree-toggle)
(global-set-key (kbd "C-x g") 'magit-status)

;; Python settings
;; ------------------------------

(require 'pyenv-mode-auto)
(require 'py-autopep8)

(elpy-enable) ;; enable Python IDE

(when (require 'flycheck nil t) ;; Configure flycheck to work with elpy
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
