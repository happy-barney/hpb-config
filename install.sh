#!/bin/bash
######################################################################

SOURCEDIR=$(readlink -f $0)
SOURCEDIR=${SOURCEDIR%/*}
DESTDIR=$(readlink -f ${DESTDIR:-$HOME})

CURRENT_APP=
CURRENT_CONFIG_DIR=

set -x

mkdir-if () {
    local dir=$1

    [[ -d $dir ]] || mkdir -p $dir
}

source-if () {
    local file=$1

    [[ -e $file ]] && source $file
}

hpb-install () {
    local type=$1

    if [[ -d $SOURCEDIR/$CURRENT_APP/$type ]] ; then
        dest=$DESTDIR/.$type/$CURRENT_APP

        mkdir-if $dest
        cp -Rsndf -t $dest $SOURCEDIR/$CURRENT_APP/$type/*
        find $dest -follow -type l -exec {} \;
    fi
}

hpb-create-cache-dir () {
    local subdir=$1

    mkdir-if $DESTDIR/.cache/$CURRENT_APP/$subdir
}

hpb-create-rc-file () {
    local src=$1
    local dest=${2:-.$1}
    local srcfull=
    local i=

    for i in $CURRENT_CONFIG_DIR/$src $SOURCEDIR/$CURRENT_APP/rc-$src ; do
        [[ -f $i ]] || continue
        srcfull=$i
        break;
    done

    if [[ -e $srcfull ]] ; then
        ln -snf $srcfull $DESTDIR/$dest
    fi
}


for dir in $SOURCEDIR/*; do
    [[ -d $dir ]] || continue
    CURRENT_APP=${dir##*/}

    CURRENT_CONFIG_DIR=$DESTDIR/.config/$CURRENT_APP

    hpb-install config
    hpb-install local/share

    hpb-create-rc-file $CURRENT_APP

    source-if $dir/install.sh
done

