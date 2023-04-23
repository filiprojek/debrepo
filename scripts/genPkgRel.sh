#!/bin/sh
DIR="$(cd "$(dirname "$0")" && pwd)"

# generate Packages file
dpkg-scanpackages --multiversion --arch amd64 "./apt-repo/pool/" > "./apt-repo/dists/stable/main/binary-amd64/Packages"
# generate Release file
cd "./apt-repo/dists/stable/"
$DIR/generate-release.sh > "Release"

