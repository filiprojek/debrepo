#!/bin/sh
LS="$(which ls)" # this prevents bugs when aliasing ls to tools like exa
DIR="$(cd "$(dirname "$0")" && pwd)"
REPODIR="$1"
DISTRO="$3"
if [ !$DISTRO ]; then
	DISTRO="stable"
fi

ARCHS="$($LS -l $REPODIR/apt-repo/dists/$DISTRO/main/ | awk '{print $9}' | awk NF | awk -F - '{print $2}')"

# generate Packages file
for ARCH in $ARCHS; do
	dpkg-scanpackages --multiversion --arch $ARCH "$REPODIR/apt-repo/pool/" > "$REPODIR/apt-repo/dists/$DISTRO/main/binary-$ARCH/Packages"
	# compress Packages file
	cat "$REPODIR/apt-repo/dists/$DISTRO/main/binary-$ARCH/Packages" | gzip -9 > "$REPODIR/apt-repo/dists/$DISTRO/main/binary-$ARCH/Packages.gz"
done

# generate Release file
cd "$REPODIR/apt-repo/dists/$DISTRO/"
$DIR/generate-release.sh $DISTRO > "Release"

