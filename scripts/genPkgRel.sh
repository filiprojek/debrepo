#!/bin/sh
#DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_PATH=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT_PATH")
LS="$(which ls)" # this prevents bugs when aliasing ls to tools like exa
REPODIR="$1"
ARCHS="$($LS -l $REPODIR/apt-repo/dists/stable/main/ | awk '{print $9}' | awk NF | awk -F - '{print $2}')"

# generate Packages file
cd $REPODIR/apt-repo/
for ARCH in $ARCHS; do
	dpkg-scanpackages --multiversion --arch $ARCH "pool/" > "dists/stable/main/binary-$ARCH/Packages"
	# compress Packages file
	cat "dists/stable/main/binary-$ARCH/Packages" | gzip -9 > "dists/stable/main/binary-$ARCH/Packages.gz"
done

# generate Release file
cd "dists/stable/"
$DIR/generate-release.sh > "Release"

