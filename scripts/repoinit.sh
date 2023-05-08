#!/bin/sh

if [ -z $1 ]; then
	echo "error: --repodir is not set"
	exit 1
fi

# make folders
mkdir -p $1/apt-repo/dists/stable/main/binary-amd64/
mkdir -p $1/apt-repo/pool/main/

# make config file
echo \
"#!/bin/sh

# Repository preferences
DEFAULT_GPG=\"\"

# Repository info
ORIGIN=\"example.com\"
LABEL=\"example repository\"
SUITE=\"stable\"
CODENAME=\"stable\"
VERSION=\"1.0\"
ARCHITECTURES=\"amd64\"
COMPONENTS=\"main\"
DESCRIPTION=\"example repository\"
" > $1/apt-repo/config

