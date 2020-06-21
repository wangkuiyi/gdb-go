(add-to-list 'load-path "/root/.emacs.d/lisp")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
