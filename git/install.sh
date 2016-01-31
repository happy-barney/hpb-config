
touch ~/.gitconfig

if ! git config --get user.name >/dev/null ; then
    prompt='Your git user.name> '
    default="$( getent passwd $( id -un ) | cut -d: -f5 | cut -d, -f1 )"
    if read -e -p "$prompt" -i "$default" ; then
        git config --global --add user.name "$REPLY"
    fi
fi

if ! git config --get user.email >/dev/null ; then
    prompt='Your git user.email> '
    default=""
    if read -e -p "$prompt" -i "$default" ; then
        git config --global --add user.email "$REPLY"
    fi
fi

# Local Variables:
# mode: sh
# End:
