
(defun hpb-advice-c-backslash-region (orig-fun &rest args)
  (interactive)

  (let* ((orig-indent-tabs-mode indent-tabs-mode))
	(setq indent-tabs-mode nil)
    (apply orig-fun args)
    (setq indent-tabs-mode orig-indent-tabs-mode)
    )
  )

(advice-add 'c-backslash-region :around #'hpb-advice-c-backslash-region)

(provide 'hpb-advice-c-backslash-region)
