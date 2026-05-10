
(defmacro hpb-keymap--define-keys (keymap &rest pairs)
	"Define multiple keys in KEYMAP without quoting each pair.
Each element of PAIRS should be a (KEY . BINDING) cons cell."

	`(progn
		,@(mapcar
			(lambda (pair)
				(let (
					(key (car pair))
					(def (cdr pair))
					)
					`(define-key
						,keymap
						,(if (stringp key) (kbd key) key)
						,def
					)
				)
			)
			pairs
		)
	)
)

(provide 'hpb-keymap--define-keys)
