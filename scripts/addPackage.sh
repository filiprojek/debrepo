#!/bin/sh

BASEF="hello-world_$VERSION""_amd64"
echo $BASEF

# copy deb file to repo folder structure
cp "./$BASEF.deb" "./apt-repo/pool/main/"
# generate Packages file
dpkg-scanpackages --multiversion --arch amd64 "./apt-repo/pool/" > "./apt-repo/dists/stable/main/binary-amd64/Packages"
# generate Release file
./generate-release.sh > "./apt-repo/dists/stable/Release"

