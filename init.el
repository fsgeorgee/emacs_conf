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

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
  )
;; Themes
;;(load-theme 'badwolf t)
;;(require 'solarized-theme)


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

(unless (package-installed-p 'sr-speedbar)
  (package-refresh-contents)
  (package-install 'sr-speedbar))
(use-package sr-speedbar)
(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text for buttons
(setq sr-speedbar-right-side nil) ; put on left side

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

(unless (package-installed-p 'doremi)
  (package-refresh-contents)
  (package-install 'doremi))
(use-package doremi)

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

;; Markdown realtime preview using vmd
(add-to-list 'load-path "~/.emacs.d/vmd-mode")
(require 'vmd-mode)
(require 'cl-lib)

(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company))
(require 'company)

(unless (package-installed-p 'company-jedi)
  (package-refresh-contents)
  (package-install 'company-jedi))
(require 'company-jedi)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-to-list 'company-backends 'company-shell)
(add-to-list 'company-backends 'company-shell-env)

(defun vmd-company-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-sample-backend))
    (prefix (and (eq major-mode 'fundamental-mode)
		 (company-grab-symbol)))
    (candidates
     (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c))
      vmd-mode/github-emojis-list))))

(add-to-list 'company-backends 'vmd-company-backend)

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "DarkOliveGreen3" "#e7c547" "DeepSkyBlue1" "#c397d8" "#70c0b1" "#1c1c1c"))
 '(custom-safe-themes
   (quote
    ("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "b51c2dda65e8e7e66ab1b06bc10b59e61c153b0cf928f296efab5a7574779fb6" default)))
 '(fci-rule-color "#121212")
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (company-jedi company ac-html ac-html-csswatcher git html5-schema magit terraform-mode web-beautify web-mode auto-complete f git-commit hcl-mode magit-popup popup s with-editor aggressive-indent sr-speedbar doremi 0blayout irony diffview use-package)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))
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

;; Hooks

(add-hook 'emacs-startup-hook (lambda () (sr-speedbar-open) ))
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
