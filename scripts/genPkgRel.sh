#!/bin/sh
DIR="$(cd "$(dirname "$0")" && pwd)"
LS="$(which ls)"
ARCHS="$($LS -l apt-repo/dists/stable/main/ | awk '{print $9}' | awk NF | awk -F - '{print $2}')"

# generate Packages file
for ARCH in $ARCHS; do
	echo $ARCH
	dpkg-scanpackages --multiversion --arch $ARCH "./apt-repo/pool/" > "./apt-repo/dists/stable/main/binary-$ARCH/Packages"
	# compress Packages file
	cat "./apt-repo/dists/stable/main/binary-$ARCH/Packages" | gzip -9 > "./apt-repo/dists/stable/main/binary-$ARCH/Packages.gz"
done

# generate Release file
cd "./apt-repo/dists/stable/"
$DIR/generate-release.sh > "Release"

