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
    (defun company-ycmd--construct-candidate-generic (candidate)
      "Generic function to construct completion string from a CANDIDATE."
      (company-ycmd--with-destructured-candidate
       candidate
       (propertize insertion-text
                   'return_type extra-menu-info
                   'kind kind
                   'doc detailed-info
                   'meta detailed-info))))
  )


;; For each package, define a function objc/init-<package-name>
;;
;; (defun objc/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
