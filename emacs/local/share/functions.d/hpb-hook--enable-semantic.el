;;; -*- Mode: Emacs-Lisp -*-

;; TODO: this is not a real per-buffer hook.
;;
;; `semantic-mode' is a global minor mode (built into Emacs, part of CEDET).
;; It installs its hooks (`find-file-hook' ...) for every buffer, so calling
;; it from a mode hook only switches on the global mode late.  Semantic then
;; works only in buffers whose major mode has a setup function registered in
;; `semantic-new-buffer-setup-functions' (`c-mode' has one).
;;
;; Ways to limit it to chosen modes:
;; 1. (recommended) call (semantic-mode 1) once and add a predicate to
;;    `semantic-inhibit-functions' which returns non-nil unless `major-mode'
;;    is in a list of allowed modes (for example a defvar
;;    `hpb-hook--enable-semantic--modes').  Semantic skips every buffer where
;;    a predicate returns non-nil.  Then this function is not a hook anymore,
;;    it is called once (idempotent, so it may stay in a mode hook).
;; 2. remove unwanted modes from `semantic-new-buffer-setup-functions'
;;    (blunt, depends on internals).
;; 3. keep it as it is: the first buffer enables semantic globally, then the
;;    registry decides.
;;
;; Untested: how semantic treats buffers which are already open when the
;; mode is switched on.

;;;###autoload
(defun hpb-hook--enable-semantic ()
	"Enable `semantic-mode' (global minor mode, built into Emacs)."
	(semantic-mode 1)
)

(provide 'hpb-hook--enable-semantic)
