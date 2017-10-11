; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; list the packages you want
(setq package-list '(better-defaults
                     helm
                     helm-projectile
                     helm-ag
                     ruby-electric
                     rvm
                     seeing-is-believing
                     inf-ruby
                     ruby-test-mode
                     robe))

; custom keys
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-f") #'helm-projectile-ag)
(global-set-key (kbd "C-t") #'helm-projectile-find-file-dwim)

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'better-defaults)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'ruby-mode)

;; Show line numbers
(global-linum-mode)

;; rvm
(rvm-use-default)

;; autoclose paired syntax elements like parens, quotes, etc
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(add-to-list 'auto-mode-alist
             '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; seeing is believing
(require 'seeing-is-believing)
(add-hook 'ruby-mode-hook 'seeing-is-believing)

;; inf ruby
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; ruby test mode
(require 'ruby-test-mode)
(add-hook 'ruby-mode-hook 'ruby-test-mode)

;; robe for code navigation
;(require 'robe-mode)
(add-hook 'ruby-mode-hook 'robe-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (robe solarized-theme seeing-is-believing rvm ruby-test-mode ruby-electric rebecca-theme inf-ruby helm-projectile helm-ag better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
