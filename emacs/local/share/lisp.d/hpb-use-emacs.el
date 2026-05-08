
;; --- The Registry ---

(defvar hpb-use-emacs--handlers
	'(
		(:custom . hpb-use-emacs--handle-custom)
		(:hook   . hpb-use-emacs--handle-hook)
		(:enable . hpb-use-emacs--handle-enable)
		(:bind   . hpb-use-emacs--handle-bind)
		(:advice . hpb-use-emacs--handle-advice)
	)
	"Alist mapping keywords to their handler function symbols."
)

;; --- The Macro ---

;;;###autoload
(defmacro hpb-use-emacs (_label &rest args)
  "Configure FEATURE using a flat, greedy keyword syntax.
Each keyword consumes all subsequent arguments until the next keyword."
  (declare (indent 1))
  (unless (memq :disabled args)
  (let (forms)
    (while args
      (let* ((keyword (pop args))
             (handler-fn (cdr (assoc keyword hpb-use-emacs--handlers)))
             values-list)
        ;; Slurp all non-keyword arguments
        (while (and args (not (keywordp (car args))))
          (push (pop args) values-list))

        (if (and handler-fn (fboundp handler-fn))
            (setq forms (append forms (funcall handler-fn (nreverse values-list))))
          (error "No valid handler function found for keyword: %s" keyword))))
    `(progn ,@forms))))

;; --- Individual Handlers ---

(defun hpb-use-emacs--handle-custom (values)
	(mapcar
		(lambda (entry) `(customize-set-variable ',(car entry) ,(cadr entry)))
        values
	)
)

(defun hpb-use-emacs--handle-hook (values)
	(mapcar
		(lambda (entry)
		`(add-hook ',(car entry) #',(cdr entry)))
		values
	)
)

(defun hpb-use-emacs--handle-enable (values)
	(mapcar (lambda (f) `(put ',f 'disabled nil)) values)
)

(defun hpb-use-emacs--handle-bind (values)
	(let ((map (car values)))
    (mapcar (lambda (b) `(define-key ,map (kbd ,(car b)) #',(car (cdr b)))) (cdr values)))
)

(defun hpb-use-emacs--handle-advice (values)
	(mapcar (lambda (a) `(advice-add ',(car a) ,(nth 1 a) #',(nth 2 a))) values)
)

(provide 'hpb-use-emacs)
