#!/bin/sh
DIR="$(cd "$(dirname "$0")" && pwd)"
LS="$(which ls)" # this prevents bugs when aliasing ls to tools like exa
REPODIR="$1"
ARCHS="$($LS -l $REPODIR/apt-repo/dists/stable/main/ | awk '{print $9}' | awk NF | awk -F - '{print $2}')"

# generate Packages file
for ARCH in $ARCHS; do
	echo $ARCH
	dpkg-scanpackages --multiversion --arch $ARCH "$REPODIR/apt-repo/pool/" > "$REPODIR/apt-repo/dists/stable/main/binary-$ARCH/Packages"
	# compress Packages file
	cat "$REPODIR/apt-repo/dists/stable/main/binary-$ARCH/Packages" | gzip -9 > "$REPODIR/apt-repo/dists/stable/main/binary-$ARCH/Packages.gz"
done

# generate Release file
cd "$REPODIR/apt-repo/dists/stable/"
$DIR/generate-release.sh > "Release"

