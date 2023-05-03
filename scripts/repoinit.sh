#!/bin/sh

if [ -z $1 ]; then
	echo "error: --repodir is not set"
	exit 1
fi

# make folders
mkdir -p $1/apt-repo/dists/stable/main/binary-amd64/
mkdir -p $1/apt-repo/pool/main/

