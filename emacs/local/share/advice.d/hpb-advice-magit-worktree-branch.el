
(require 'magit)

;(defun hpb-advice-magit-worktree-branch (orig-fun branch start-point &optional force)
;  "Create a new BRANCH and check it out in a new worktree at PATH."
;  (interactive
;   `(,@(magit-branch-read-args "Create and checkout branch")
;     ,current-prefix-arg)
;   )
;
;  (apply orig-fun (concat "/home/brano/git/branch/" branch)
;  )
;
;(advice-add 'magit-worktree-branch :after-while #'hpb-advice-magit-worktree-branch)

(provide 'hpb-advice-magit-worktree-branch)
