;;; defuns-nlinum.el

;;;###autoload
(defun narf/nlinum-toggle ()
  (interactive)
  (if nlinum-mode
      (narf|nlinum-disable)
    (narf|nlinum-enable)))

(provide 'defuns-nlinum)
;;; defuns-nlinum.el ends here