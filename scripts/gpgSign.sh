#!/bin/sh
REPODIR="$1"
. $REPODIR/apt-repo/config

if [ ! $DEFAULT_GPG ]; then
	echo "error: no gpg key provided in config file"
	exit 1
fi

KEY=$DEFAULT_GPG


echo "debrepo: signing using $KEY"

cat $REPODIR/apt-repo/dists/stable/Release | gpg --default-key $KEY -abs > $REPODIR/apt-repo/dists/stable/Release.gpg
cat $REPODIR/apt-repo/dists/stable/Release | gpg --default-key $KEY -abs --clearsign > $REPODIR/apt-repo/dists/stable/InRelease

