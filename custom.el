(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-ycmd-request-sync-timeout 0.2)
 '(create-lockfiles nil)
 '(dired-use-ls-dired nil)
 '(markdown-command "python3 -m markdown")
 '(markdown-enable-math t)
 '(mouse-wheel-scroll-amount (quote (1 ((meta) . 5) ((control)))))
 '(org-agenda-files (quote ("~/Desktop/GTD/dairy/" "~/Desktop/GTD/")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (dot . t))))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.2 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-preview-latex-image-directory "/tmp/ltxpng/")
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh))))
 '(package-selected-packages
   (quote
    (yapfify ws-butler winum which-key web-mode use-package toc-org spaceline powerline smeargle restart-emacs racer pyvenv pug-mode persp-mode pcre2el paradox spinner osx-dictionary orgit org-projectile org-pomodoro alert log4e org-plus-contrib org-download open-junk-file neotree move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep live-py-mode link-hint info+ indent-guide hydra hungry-delete htmlize highlight-indentation hide-comnt help-fns+ helm-projectile helm-make projectile helm-gitignore helm-flx helm-company helm-c-yasnippet helm-ag google-translate gitattributes-mode git-timemachine git-messenger git-link fuzzy flycheck-ycmd flycheck-rust flycheck-pos-tip flycheck eyebrowse expand-region exec-path-from-shell evil-surround evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-exchange evil-escape evil-ediff evil-anzu dumb-jump disaster diminish company-statistics column-enforce-mode clang-format cargo rust-mode bind-key auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link auto-complete avy anaconda-mode auctex yasnippet company ycmd request deferred iedit smartparens bind-map highlight evil helm helm-core async f haml-mode s dash window-numbering volatile-highlights vmd-mode vi-tilde-fringe uuidgen undo-tree toml-mode tagedit solarized-theme slim-mode seq scss-mode sass-mode reveal-in-osx-finder request-deferred rainbow-delimiters quelpa pytest pyenv-mode py-isort pos-tip popwin popup pkg-info pip-requirements pcache pbcopy osx-trash org-present org-bullets lorem-ipsum linum-relative less-css-mode launchctl ido-vertical-mode hy-mode hl-todo highlight-parentheses highlight-numbers helm-themes helm-swoop helm-pydoc helm-mode-manager helm-descbinds helm-css-scss graphviz-dot-mode goto-chg golden-ratio gnuplot gntp gitignore-mode gitconfig-mode gh-md flx-ido fill-column-indicator fancy-battery evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-args eval-sexp-fu emmet-mode elisp-slime-nav cython-mode company-ycmd company-web company-c-headers company-auctex company-anaconda cmake-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol anzu ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(tex-directory "/tmp/tex")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-template-field ((t (:foreground "selectedMenuItemColor"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
