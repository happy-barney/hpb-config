;;; -*- Mode: Emacs-Lisp -*-

(require 'bookmark)

;;;###autoload
(defun hpb-bookmark--buffer-positions ()
	"Return sorted positions of bookmarks in the file visited by the current buffer."
	(bookmark-maybe-load-default-file)

	(let ((file (hpb-buffer--ensure-file)))
		(sort
			(delq nil
				(mapcar
					(lambda (bookmark)
						(let ((bookmark-file (bookmark-get-filename bookmark)))
							(and bookmark-file
								(file-equal-p bookmark-file file)
								(bookmark-get-position bookmark)
							)
						)
					)
					bookmark-alist
				)
			)
			#'<
		)
	)
)

(provide 'hpb-bookmark--buffer-positions)
