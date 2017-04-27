 ;; Make sure use-package is installed
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;; ======== Customization starts ========

 ;; Key-bindings
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

 ;; Additional Packages
(unless (package-installed-p 'aggressive-indent)
  (package-refresh-contents)
  (package-install 'aggressive-indent))    
(use-package aggressive-indent)
(unless (package-installed-p 'diffview)
  (package-refresh-contents)
  (package-install 'diffview))
(use-package diffview)

(unless (package-installed-p 'with-editor)
  (package-refresh-contents)
  (package-install 'with-editor))
(use-package with-editor)

;;(unless (package-installed-p 'web-completion-...)
;;  (package-refresh-contents)
;;  (package-install 'web-completion-...))
;;(use-package web-completion-...)

(unless (package-installed-p 's)
  (package-refresh-contents)
  (package-install 's))
(use-package s) 

(unless (package-installed-p 'popup)
  (package-refresh-contents)
  (package-install 'popup))
(use-package popup)

(unless (package-installed-p 'magit-popup)
  (package-refresh-contents)
  (package-install 'magit-popup))
(use-package magit-popup)

(unless (package-installed-p 'hcl-mode)
  (package-refresh-contents)
  (package-install 'hcl-mode))
(use-package hcl-mode)

(unless (package-installed-p 'git-commit)
  (package-refresh-contents)
  (package-install 'git-commit))
(use-package git-commit)

(unless (package-installed-p 'f)
  (package-refresh-contents)
  (package-install 'f))
(use-package f)

(unless (package-installed-p 'dash)
  (package-refresh-contents)
  (package-install 'dash))
(use-package dash)

(unless (package-installed-p 'auto-complete)
  (package-refresh-contents)
  (package-install 'auto-complete))
(use-package auto-complete)

(unless (package-installed-p 'async)
  (package-refresh-contents)
  (package-install 'async))
(use-package async)

(unless (package-installed-p 'web-mode)
  (package-refresh-contents)
  (package-install 'web-mode))
(use-package web-mode)

(unless (package-installed-p 'web-beautify)
  (package-refresh-contents)
  (package-install 'web-beautify))
(use-package web-beautify)

(unless (package-installed-p 'terraform-mode)
  (package-refresh-contents)
  (package-install 'terraform-mode))
(use-package terraform-mode)

(unless (package-installed-p 'magit)
  (package-refresh-contents)
  (package-install 'magit))
(use-package magit)

(unless (package-installed-p 'html5-schema)
  (package-refresh-contents)
  (package-install 'html5-schema))
(use-package html5-schema)

(unless (package-installed-p 'git)
  (package-refresh-contents)
  (package-install 'git))
(use-package git)

;;(unless (package-installed-p 'auto-package-up-...)
;;  (package-refresh-contents)
;;  (package-install 'auto-package-up-...))
;;(use-package auto-package-up-...)

;;(unless (package-installed-p 'angular-snippets)
;;  (package-refresh-contents)
;;  (package-install 'angular-snippets))
;;(use-package angular-snippets)

;;(unless (package-installed-p 'angular-mode)
;;  (package-refresh-contents)
;;  (package-install 'angular-mode))
;;(use-package angular-mode)

(unless (package-installed-p 'ac-html-csswatcher)
  (package-refresh-contents)
  (package-install 'ac-html-csswatcher))
(use-package ac-html-csswatcher)

(unless (package-installed-p 'ac-html)
  (package-refresh-contents)
  (package-install 'ac-html))
(use-package ac-html)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (irony diffview use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; C++ Auto completion
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
