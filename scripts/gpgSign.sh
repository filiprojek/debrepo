#!/bin/sh
REPODIR="$1"
DISTRO="$3"
. $REPODIR/apt-repo/config

if [ ! $DISTRO ]; then
	DISTRO="stable"
fi

if [ ! $DEFAULT_GPG ]; then
	echo "error: no gpg key provided in config file"
	exit 1
fi

KEY=$DEFAULT_GPG
echo "debrepo: signing using $KEY"

cat $REPODIR/apt-repo/dists/$DISTRO/Release | gpg --default-key $KEY -abs > $REPODIR/apt-repo/dists/$DISTRO/Release.gpg
cat $REPODIR/apt-repo/dists/$DISTRO/Release | gpg --default-key $KEY -abs --clearsign > $REPODIR/apt-repo/dists/$DISTRO/InRelease

