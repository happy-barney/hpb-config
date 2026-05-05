
hpb-create-rc-file init.el .emacs

# Generate autoloads for functions.d and keymap.d
emacs --batch --eval '(loaddefs-generate (list "~/.local/share/emacs/functions.d" "~/.local/share/emacs/lisp.d" "~/.config/emacs/keymap.d") "~/.local/share/emacs/functions.d/functions-autoload.el")'

# Reload loaddefs in running Emacs instance if server is running
if pgrep -f "emacs.*--daemon" > /dev/null; then
    emacsclient --eval '(load "~/.local/share/emacs/function-autoloads.el" t)' || true
fi
