
;(package-install 'puppet-mode)
(require 'puppet-mode)
(require 'hpb-puppet-find-other-file)
(require 'hpb-puppet-guess-manifest-name)

(add-hook 'puppet-mode-hook 'viper-change-state-to-vi)

(defun hpb-puppet-insert-manifest-name ()
  (interactive)
  (insert (hpb-puppet-guess-manifest-name))
  )

(hpb-define-key puppet-mode-map
                '(
		  ("C-c o f" . 'hpb-puppet-find-other-file)
                  ("C-c i m n" . 'hpb-puppet-insert-manifest-name)
                  ))
