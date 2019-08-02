
(defun hpb-advice-indent-relative-spaces (orig-fun &rest args)
  (interactive)

  (let* ((orig-indent-tabs-mode indent-tabs-mode))
    (cond
     ((eq (char-before) ?\t) orig-indent-tabs-mode)
     ((eq (char-before) ?\n) orig-indent-tabs-mode)
     (t (setq indent-tabs-mode nil))
     )
    (apply orig-fun args)
    (setq indent-tabs-mode orig-indent-tabs-mode)
    )
  )

(advice-add 'indent-relative :around #'hpb-advice-indent-relative-spaces)

(provide 'hpb-advice-indent-relative-spaces)
