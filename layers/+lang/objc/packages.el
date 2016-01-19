;;; packages.el --- objc Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq objc-packages
    '(
      ;; package names go here
      cc-mode
      company
      company-ycmd
      ycmd
      flycheck
      semantic
      yasnippet
      ))

;; List of packages to exclude.
;; (setq objc-excluded-packages '())

(unless (configuration-layer/layer-usedp 'c-c++)
  (defun objc/init-cc-mode ()
    (use-package cc-mode :defer t
      :init
      (add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))
      )))

(defun objc/post-init-cc-mode ()
  (use-package cc-mode
    :defer t
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'objc-mode
        "ga" 'projectile-find-other-file
        "gA" 'projectile-find-other-file-other-window)
      )
    ))

(defun objc/post-init-ycmd ()
  (add-hook 'objc-mode-hook 'ycmd-mode)
  (spacemacs/set-leader-keys-for-major-mode 'objc-mode
    "gg" 'ycmd-goto
    "gG" 'ycmd-goto-imprecise))

(defun objc/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'objc-mode-hook))

(defun objc/post-init-company-ycmd ()
  (use-package company-ycmd :defer t
    :config
    ;; replace generic candidate to return detail info
    (progn
      ;; extract candidates infos
      (defun company-ycmd--objc-param (prefix signature)
        (when (and prefix signature)
          (let ((match (s-match (format "%s\\(\\(?:\\^[^(]*\\)?([^)]*)\\|\\w+\\)" prefix) signature)))
            (cadr match)
            )))
      (defun company-ycmd--construct-candidate-objc (candidate)
        "function to construct completion objc string from a CANDIDATE."
        (company-ycmd--with-destructured-candidate candidate
          (let ((param (company-ycmd--objc-param insertion-text menu-text)))
            (propertize insertion-text
                        'return_type extra-menu-info
                        'kind kind
                        'doc detailed-info
                        'meta detailed-info
                        'param param))))

      (advice-add 'company-ycmd--get-construct-candidate-fn :before-until
                  (lambda () "check if objc-mode first"
                    (when (eq major-mode 'objc-mode)
                      #'company-ycmd--construct-candidate-objc)))

      ;; post completion, add param
      (if (configuration-layer/package-usedp 'yasnippet)
          (defun company-template--add-objc-param (param)
            (let ((templ (if (string-match "([^)]+)" param)
                             (progn (let ((mb (+ 1 (match-beginning 0)))
                                           (me (- (match-end 0) 1))
                                           (ct 2)
                                           str-in-paren)
                                      (setq str-in-paren (substring param mb me))
                                      (setq str-in-paren (replace-regexp-in-string "[^[:blank:],][^,]*"
                                        (lambda (str)
                                          (prog1 (format "${%d:%s}" ct str)
                                            (setq ct (+ ct 1)))
                                          ) str-in-paren 't 't))
                                      (concat "${1:" (substring param 0 mb) str-in-paren (substring param me) "}")
                                      ))
                           (concat "${1:" param "}"))
                   ))
              ;; (message "templ %s " templ)
              (yas-expand-snippet templ)
              (when (and (configuration-layer/package-usedp 'smartparens)
                         (not smartparens-mode)
                         smartparens-enabled-initially)
                    (smartparens-mode 1))
              ))
        ;; when no yas, simple insert it. company-template has bugs
        (defun company-template--add-objc-param (param)
          (save-excursion (let* ((beg (point))
                                 (end (progn (insert param) (point-marker)))
                                 ;; (templ (company-template-declare-template (- beg 1) end))
                                 )
                            ;; (company-template-add-field templ (copy-marker beg) end)
                            ;; (message "templated start:%d end:%d" (overlay-start templ) (overlay-end templ))
                            ;; (company-template-move-to-first templ)
                            ))))
      (defun company-ycmd--objc-post-completion (candidate)
        "Insert function arguments after completion for CANDIDATE."
        (--when-let (and (eq major-mode 'objc-mode)
                         company-ycmd-insert-arguments
                         (get-text-property 0 'param candidate))
          (company-template--add-objc-param it)
          't
          ))
      (advice-add 'company-ycmd--post-completion :before-until
                  #'company-ycmd--objc-post-completion)
  )))


;; For each package, define a function objc/init-<package-name>
;;
;; (defun objc/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
