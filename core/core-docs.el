;;; core-docs.el

(use-package dash-at-point
  :when IS-MAC
  :commands (dash-at-point dash-at-point-with-docset dash-at-point-run-search
             dash-at-point-guess-docset)
  :init
  (defun doom-docs-lookup (&optional search all)
    (let ((docset (unless all (dash-at-point-guess-docset))))
      (dash-at-point-run-search search docset))))

(use-package zeal-at-point
  :when (not IS-MAC)
  :commands (zeal-at-point zeal-at-point-set-docset)
  :init
  (defun doom-docs-lookup (&optional search all)
    (let ((zeal-at-point-docset (if all "" zeal-at-point-docset)))
      (zeal-at-point search))))

(defmacro def-docset! (mode docset)
  `(add-hook! ,mode
     (setq-local ,(if IS-MAC 'dash-at-point-docset 'zeal-at-point-docset)
                 ,docset)))

(use-package google-this
  :commands (google-this-search
             google-this-lucky-and-insert-url
             google-this-lucky-search
             google-this-string
             google-this-line
             google-this-ray
             google-this-word
             google-this-symbol
             google-this-region
             google-this
             google-this-noconfirm
             google-this-error
             google-this-cpp-reference
             google-this-forecast))

(provide 'core-docs)
;;; core-docs.el ends here
