
;(package-install 'puppet-mode)
(require 'puppet-mode)

(add-hook 'puppet-mode-hook 'viper-change-state-to-vi)
