;;; -*- Mode: Emacs-Lisp -*-

;; unbind default bindings
(use-package emacs
	:bind (
		("<backtab>"    . nil) ; default: backward-button
		("C-x C-z"      . nil) ; default: iconify-or-deiconify-frame
		("C-x <return>" . nil) ; default: prefix (choose coding system)
		("C-x m"        . nil) ; default: compose email
	)
)

(use-package emacs
	:init
		(require 'mouse-copy)

	:bind (
		;; Mouse
		("<mouse-8>"        . #'previous-buffer)
		("<mouse-9>"        . #'next-buffer)
		("<down-mouse-3>"   . #'mouse-buffer-menu)
		("C-<down-mouse-3>" . #'mouse-buffer-menu)

		;; F-keys
		;;   Concept:
		;;   - <Fn>   - Primary action
		;;   - <C-Fn> - focused action
		;;   - <S-Fn> - Exploratory action (usually transient menu)
		;;   - <M-Fn> - Workflow action

		;; F1 - Help & documentation
		("<f1>"             . #'help-command)
		("C-<f1>"           . #'describe-command)
		("S-<f1>"           . #'hpb-transient--help-command)
		("M-<f1>"           . #'info)

		;; F2 - Write operations
		("<f2>"             . #'save-buffer)
		("C-<f2>"           . #'hpb-buffer--save)
		("S-<f2>"           . #'hpb-transient--write)

		;; F3 - Read operations
		("<f3>"             . #'find-file)
		("C-<f3>"           . #'helm-projectile-find-file)
		("S-<f3>"           . #'hpb-transient--read)

		;; F4 - File and buffer maintenance
		("<f4>"             . #'hpb-buffer--revert)
		("C-<f4>"           . #'hpb-magit--revert-buffer-file)
		("S-<f4>"           . #'hpb-transient--maintenance)

		;; F5 - Buffer selection
		("<f5>"             . #'hpb-buffer--switch)
		("C-<f5>"           . #'hpb-project--switch-buffer)
		("S-<f5>"           . #'hpb-transient--buffer)

		("<f6>"             . #'other-window)

		;; F7 / F8 - Pair navigation (previous / next)
		("<f7>"             . #'hpb-transient--previous)
		("C-<f7>"           . #'hpb-context--previous)
		("S-<f7>"           . #'hpb-transient--previous)
		("M-<f7>"           . #'previous-error)
		("<f8>"             . #'hpb-transient--next)
		("C-<f8>"           . #'hpb-context--next)
		("S-<f8>"           . #'hpb-transient--next)
		("M-<f8>"           . #'next-error)

		;; F9 - Context management
		("S-<f9>"           . #'hpb-transient--context)

		;; F10 - Execution management
		("<f10>"            . #'hpb-transient--execution)
		("C-<f10>"          . #'hpb-execution--context)
		("S-<f10>"          . #'hpb-transient--execution)

;		("<f11>"            . 'manual-entry)

		;; F12 - Destructive actions
		("<f12>"            . #'hpb-buffer--kill-current-buffer)
		("C-<f12>"          . #'delete-frame)
		("S-<f12>"          . #'hpb-transient--destructive)
		("C-S-<f12>"        . #'hpb-buffer--kill-delete-file)

		("C-<f11>"          . #'execute-extended-command)
		("C-<f9>"           . #'next-error)
	)
)

(define-key global-map (kbd "C-c i") (hpb-keymap--require 'hpb-text--keymap-insert))
(define-key global-map (kbd "C-x m") (hpb-keymap--require 'hpb-magit--keymap))
(define-key global-map (kbd "C-c t") (hpb-keymap--require 'hpb-text--keymap))

(define-key global-map (kbd "C-;"               ) #'hpb-text--self-insert)
(define-key global-map (kbd "C-."               ) 'undo)
(define-key global-map (kbd "C-_"               ) 'undo)
(define-key global-map (kbd "<backtab>"         ) 'indent-relative)
(define-key global-map (kbd "C-<tab>"           ) 'dabbrev-expand)
(define-key global-map (kbd "C-c <tab>"         ) 'indent-to-column)
(define-key global-map (kbd "C-<backtab>"  ) 'indent-to-column)
(define-key global-map (kbd "C-c <left>"        ) 'hide-subtree)
(define-key global-map (kbd "C-c <right>"       ) 'show-subtree)
(define-key global-map (kbd "C-c <up>"          ) (lambda () (interactive) (hide-subtree) (show-children)))
(define-key global-map (kbd "C-c <down>"        ) 'show-children)
(define-key global-map (kbd "C-c C-<left>"        ) (lambda () (interactive) (hide-subtree) (outline-forward-same-level 1)))
(define-key global-map (kbd "C-c C-<right>"       ) 'show-subtree)
(define-key global-map (kbd "C-c C-<up>"          ) (lambda () (interactive) (hide-subtree) (show-children)))
(define-key global-map (kbd "C-c C-<down>"        ) 'show-children)
(define-key global-map (kbd "C-c <prior>"       ) 'outline-up-heading)
(define-key global-map (kbd "C-c C-<prior>"       ) 'outline-up-heading)
(define-key global-map (kbd "C-c <home>"         ) (lambda () (interactive) (outline-up-heading 9)))
(define-key global-map (kbd "C-c C-<home>"       ) (lambda () (interactive) (outline-up-heading 9)))
(define-key global-map (kbd "<insert>"          ) 'ignore)

(define-key global-map (kbd "M-S-<up>"         ) 'outline-move-subtree-up)
(define-key global-map (kbd "M-S-<down>"       ) 'outline-move-subtree-down)

(define-key global-map (kbd "M-{"               ) 'outline-backward-same-level)
(define-key global-map (kbd "M-}"               ) 'outline-forward-same-level)

(define-key global-map (kbd "C-S-<up>") 'scroll-up-line)
(define-key global-map (kbd "C-S-<down>") 'scroll-down-line)

(define-key global-map (kbd "C-<up>"  ) #'hpb-move--backward-block-of-lines)
(define-key global-map (kbd "C-<down>") #'hpb-move--forward-block-of-lines)

(define-key global-map (kbd "C-c M-%"          ) 'swap-words)
(define-key global-map (kbd "C-c c"            ) 'compile)

(define-key global-map (kbd "C-x <left>"   ) 'previous-buffer)
(define-key global-map (kbd "C-x C-<left>" ) 'previous-buffer)
(define-key global-map (kbd "C-x <right>"  ) 'next-buffer)
(define-key global-map (kbd "C-x C-<right>") 'next-buffer)

(define-key global-map (kbd "C-c o f") 'ff-find-other-file)

(define-key global-map (kbd "C-L"	   ) (lambda () (interactive) (recenter 10)))

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
