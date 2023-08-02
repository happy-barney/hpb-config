(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(backup-by-copying-when-mismatch t)
 '(backup-directory-alist '((".*" . "~/.cache/emacs/backup.d/")))
 '(browse-url-browser-function 'browse-url-firefox)
 '(buffers-menu-max-size 30)
 '(buffers-menu-submenus-for-groups-p t)
 '(c-auto-align-backslashes t)
 '(c-backslash-column 72)
 '(c-basic-offset 4)
 '(c-label-minimum-indentation 0)
 '(c-offsets-alist
   '((brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
	 (brace-list-entry . 0)
	 (substatement-open . +)
	 (case-label . 0)
	 (arglist-intro . c-lineup-arglist-intro-after-paren)
	 (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist)
	 (arglist-close . c-lineup-arglist)))
 '(case-fold-search t)
 '(column-number-mode t)
 '(completions-format 'vertical)
 '(complex-buffers-menu-p nil)
 '(copyright-year-ranges t)
 '(cperl-auto-newline t)
 '(cperl-auto-newline-after-colon nil)
 '(cperl-close-paren-offset -4)
 '(cperl-comment-column 41)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-lbrace-space nil)
 '(cperl-electric-parens-mark t)
 '(cperl-indent-comment-at-column-0 nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-label-offset 0)
 '(cperl-lineup-step nil)
 '(cperl-pod-here-scan nil)
 '(cperl-regexp-indent-step 4)
 '(cperl-regexp-scan nil)
 '(cperl-use-syntax-table-text-property t)
 '(delete-key-deletes-forward nil)
 '(delete-old-versions t)
 '(desktop-auto-save-timeout 300)
 '(desktop-base-file-name "emacs.desktop")
 '(desktop-base-lock-name "emacs.desktop.lock")
 '(desktop-path '("~/.cache/emacs/"))
 '(eshell-hist-ignoredups t)
 '(eshell-show-lisp-completions t)
 '(file-precious-flag nil)
 '(fill-column 120)
 '(font-lock-message-threshold 256000)
 '(font-lock-use-colors t)
 '(font-lock-use-fonts nil)
 '(font-menu-ignore-scaled-fonts nil t)
 '(font-use-system-font t)
 '(fume-max-items 35)
 '(fume-perl-fully-qualified-names nil)
 '(global-undo-tree-mode nil)
 '(gutter-buffers-tab-visible-p nil)
 '(html-helper-do-write-file-hooks nil)
 '(html-helper-htmldtd-version
   "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
")
 '(html-helper-use-expert-menu t)
 '(html-helper-user-menu nil)
 '(imenu-sort-function 'imenu--sort-by-name)
 '(indent-tabs-mode t)
 '(kept-new-versions 4)
 '(kept-old-versions 4)
 '(lazy-lock-stealth-lines 1000)
 '(line-number-mode t)
 '(magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
 '(magit-repository-directories
   '(("~/git/github" . 1)
	 ("~/git/fork" . 1)
	 ("~/git/foreign" . 1)))
 '(magit-save-repository-buffers 'dontask)
 '(magit-visit-ref-behavior '(focus-on-ref create-branch checkout-any checkout-branch))
 '(make-backup-files t)
 '(mouse-buffer-menu-mode-mult 1)
 '(mouse-yank-at-point t)
 '(next-line-add-newlines t)
 '(nxml-child-indent 4)
 '(org-clock-in-switch-to-state nil)
 '(org-clock-into-drawer t)
 '(org-clock-persist 'history)
 '(org-enforce-todo-dependencies t)
 '(org-hierarchical-todo-statistics nil)
 '(org-log-done 'note)
 '(org-lowest-priority 68)
 '(org-provide-todo-statistics 'all-headlines)
 '(org-startup-folded 'showeverything)
 '(org-time-stamp-custom-formats '("<%Y-%m-%d>" . "<%Y-%m-%d %a %H:%M>"))
 '(org-todo-interpretation 'sequence)
 '(org-todo-keyword-faces '(("IN-PROGRESS" . "dark violet")))
 '(org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "DONE")))
 '(package-selected-packages
   '(lsp-treemacs typescript-mode csv-mode sokoban vue-html-mode vue-mode tide magit-filenotify magit-find-file apache-mode ibuffer-vc lsp-java lsp-ui flycheck lsp-mode evil-numbers docker docker-compose-mode dockerfile-mode magit edit-server perlcritic projectile smart-tab copy-as-format jira org-jira yasnippet yaml-mode web-mode string-inflection sqlup-mode sql-indent smart-tabs-mode puppet-mode pde org-tree-slide org-pomodoro markdown-mode magit-gh-pulls ibuffer-projectile helm-projectile helm-perldoc helm-make helm-gtags helm-ag groovy-mode git-link ggtags format-sql flymake-ruby flymake-python-pyflakes flymake-puppet flymake-perlcritic flymake-json flymake-css evil-org dired-k date-at-point clojure-mode bool-flip bind-key atom-one-dark-theme angularjs-mode airline-themes aggressive-indent))
 '(paren-mode 'sexp nil (paren))
 '(powerline-buffer-size-suffix t)
 '(powerline-default-separator 'arrow-fade)
 '(projectile-completion-system 'default)
 '(projectile-enable-caching t)
 '(ps-paper-type 'a4)
 '(ps-print-color-p nil)
 '(query-user-mail-address nil)
 '(recent-files-permanent-submenu t)
 '(safe-local-variable-values
   '((fci-rule-column . 140)
	 (c-comment-only-line-offset 0 . 0)
	 (eval progn
		   (defun my/point-in-defun-declaration-p nil
			 (let
				 ((bod
				   (save-excursion
					 (c-beginning-of-defun)
					 (point))))
			   (<= bod
				   (point)
				   (save-excursion
					 (goto-char bod)
					 (re-search-forward "{")
					 (point)))))
		   (defun my/is-string-concatenation-p nil "Returns true if the previous line is a string concatenation"
				  (save-excursion
					(let
						((start
						  (point)))
					  (forward-line -1)
					  (if
						  (re-search-forward " \\+$" start t)
						  t nil))))
		   (defun my/inside-java-lambda-p nil "Returns true if point is the first statement inside of a lambda"
				  (save-excursion
					(c-beginning-of-statement-1)
					(let
						((start
						  (point)))
					  (forward-line -1)
					  (if
						  (search-forward " -> {" start t)
						  t nil))))
		   (defun my/trailing-paren-p nil "Returns true if point is a training paren and semicolon"
				  (save-excursion
					(end-of-line)
					(let
						((endpoint
						  (point)))
					  (beginning-of-line)
					  (if
						  (re-search-forward "[ ]*);$" endpoint t)
						  t nil))))
		   (defun my/prev-line-call-with-no-args-p nil "Return true if the previous line is a function call with no arguments"
				  (save-excursion
					(let
						((start
						  (point)))
					  (forward-line -1)
					  (if
						  (re-search-forward ".($" start t)
						  t nil))))
		   (defun my/arglist-cont-nonempty-indentation
			   (arg)
			 (if
				 (my/inside-java-lambda-p)
				 '+
			   (if
				   (my/is-string-concatenation-p)
				   16
				 (unless
					 (my/point-in-defun-declaration-p)
				   '++))))
		   (defun my/statement-block-intro
			   (arg)
			 (if
				 (and
				  (c-at-statement-start-p)
				  (my/inside-java-lambda-p))
				 0 '+))
		   (defun my/block-close
			   (arg)
			 (if
				 (my/inside-java-lambda-p)
				 '- 0))
		   (defun my/arglist-close
			   (arg)
			 (if
				 (my/trailing-paren-p)
				 0 '--))
		   (defun my/arglist-intro
			   (arg)
			 (if
				 (my/prev-line-call-with-no-args-p)
				 '++ 0))
		   (c-set-offset 'inline-open 0)
		   (c-set-offset 'topmost-intro-cont '+)
		   (c-set-offset 'statement-block-intro 'my/statement-block-intro)
		   (c-set-offset 'block-close 'my/block-close)
		   (c-set-offset 'knr-argdecl-intro '+)
		   (c-set-offset 'substatement-open '+)
		   (c-set-offset 'substatement-label '+)
		   (c-set-offset 'case-label '+)
		   (c-set-offset 'label '+)
		   (c-set-offset 'statement-case-open '+)
		   (c-set-offset 'statement-cont '++)
		   (c-set-offset 'arglist-intro 'my/arglist-intro)
		   (c-set-offset 'arglist-cont-nonempty
						 '(my/arglist-cont-nonempty-indentation c-lineup-arglist))
		   (c-set-offset 'arglist-close 'my/arglist-close)
		   (c-set-offset 'inexpr-class 0)
		   (c-set-offset 'access-label 0)
		   (c-set-offset 'inher-intro '++)
		   (c-set-offset 'inher-cont '++)
		   (c-set-offset 'brace-list-intro '+)
		   (c-set-offset 'func-decl-cont '++))
	 (projectile-project-test-cmd . "test-csi-java.sh")
	 (cperl-indent-level 4)
	 (c-indentation-style . bsd)))
 '(save-abbrevs t)
 '(save-some-buffers-query-display-buffer nil)
 '(scroll-margin 3)
 '(server-raise-frame nil)
 '(sgml-auto-insert-required-elements nil)
 '(sgml-default-doctype-name "HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\"")
 '(sgml-ignore-undefined-elements t)
 '(sgml-insert-end-tag-on-new-line t)
 '(sgml-live-element-indicator t)
 '(sgml-omittag-transparent nil)
 '(sgml-set-face nil)
 '(sgml-warn-about-undefined-entities nil)
 '(show-paren-mode t)
 '(show-paren-style 'expression)
 '(show-trailing-whitespace t)
 '(speedbar-navigating-speed 2 t)
 '(speedbar-update-speed 2 t)
 '(tab-stop-list '(4 8))
 '(tab-width 4)
 '(tags-case-fold-search nil)
 '(toolbar-visible-p nil)
 '(track-eol nil)
 '(truncate-lines t)
 '(typescript-indent-level 2)
 '(user-full-name "Brano Zahradnik")
 '(user-mail-address "happy.barney@gmail.com")
 '(vc-make-backup-files t)
 '(version-control t)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-line-column nil)
 '(xsl-element-indent-step 2)
 '(yas-snippet-dirs '("~/.cache/emacs/yasnippet/snippets")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((nil (:bold nil))))
 '(bold-italic ((nil (:italic nil))))
 '(change-log-file-face ((t (:foreground "blue" :background "gray"))) t)
 '(cperl-array-face ((((class color) (background light)) (:foreground "Blue"))))
 '(cperl-hash-face ((((class color) (background light)) (:foreground "Red"))))
 '(cperl-nonoverridable-face ((((class color) (background light)) (:foreground "deep pink"))))
 '(font-lock-comment-face ((((class color) (background light)) (:foreground "dark slate gray"))))
 '(font-lock-constant-face ((((class color) (background light)) (:foreground "midnight Blue"))))
 '(font-lock-doc-string-face ((((class color) (background light)) (:foreground "green4" :italic nil :bold nil))))
 '(font-lock-function-name-face ((((class color)) (:foreground "blue2"))))
 '(font-lock-keyword-face ((((class color) (background light)) (:foreground "brown" :size "14pt" :family "Dejavu Sans Mono" :italic nil :bold nil))))
 '(font-lock-type-face ((((class color) (background light)) (:foreground "blue4"))))
 '(helm-moccur-buffer ((t (:foreground "cyan4" :underline t))))
 '(html-helper-significant-tag-face ((t (:foreground "firebrick"))))
 '(powerline-active1 ((t (:inherit mode-line))))
 '(powerline-active2 ((t (:inherit mode-line))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive))))
 '(sh-heredoc ((t (:foreground "#6060c0"))))
 '(web-mode-doctype-face ((t (:foreground "brown3"))))
 '(widget-button-pressed ((((class color)) (:foreground "red"))))
 '(widget-button-pressed-face ((((class color)) (:foreground "red"))) t)
 '(widget-inactive ((((class grayscale color) (background light)) (:foreground "dim gray"))))
 '(widget-inactive-face ((((class grayscale color) (background light)) (:foreground "dim gray"))) t)
 '(xsl-xslt-alternate-face ((((background light)) (:foreground "steelblue" :bold nil)))))
