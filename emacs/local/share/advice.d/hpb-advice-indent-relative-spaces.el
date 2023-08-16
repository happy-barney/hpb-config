
(defun hpb-advice-indent-relative-spaces (orig-fun &rest args)
  (interactive)

  (let* ((orig-indent-tabs-mode indent-tabs-mode))
	(cond
	 ((get-char-property (point) 'in-pod) (setq indent-tabs-mode nil))
	 ((eq (char-before) ?\t)              nil)
	 ((eq (char-before) ?\n)              nil)
	 (t                                   (setq indent-tabs-mode nil))
	 )
    (apply orig-fun args)
    (setq indent-tabs-mode orig-indent-tabs-mode)
    )
  )

(advice-remove 'indent-relative #'hpb-advice-indent-relative-spaces)
(advice-remove 'tab-to-tab-stop #'hpb-advice-indent-relative-spaces)

(advice-add 'indent-relative :around #'hpb-advice-indent-relative-spaces)
(advice-add 'tab-to-tab-stop :around #'hpb-advice-indent-relative-spaces)

(provide 'hpb-advice-indent-relative-spaces)
