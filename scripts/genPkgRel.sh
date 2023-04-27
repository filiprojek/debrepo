#!/bin/sh
DIR="$(cd "$(dirname "$0")" && pwd)"

# generate Packages file
dpkg-scanpackages --multiversion --arch amd64 "./apt-repo/pool/" > "./apt-repo/dists/stable/main/binary-amd64/Packages"
# compress Packages file
cat "./apt-repo/dists/stable/main/binary-amd64/Packages" | gzip -9 > "./apt-repo/dists/stable/main/binary-amd64/Packages.gz"
# generate Release file
cd "./apt-repo/dists/stable/"
$DIR/generate-release.sh > "Release"

