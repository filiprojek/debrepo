#!/bin/sh

PACKAGE="debrepo"
VERSION="1.0.0"
MAINTAINER="Filip Rojek <filip@filiprojek.cz>"
DEPENDS=""
ARCHITECTURE=""
HOMEPAGE="https://git.filiprojek.cz/fr/debrepo"
DESCRIPTION=""

BASEF=$PACKAGE"_"$VERSION"_"$ACHITECTURE

# create folder structure
mkdir -p "./build/$BASEF/DEBIAN/" "./build/$BASEF/usr/bin/"

# create control file
echo "\
Package: $PACKAGE
Version: $VERSION
Maintainer: $MAINTAINER
Depends: $DEPENDS
Architecture: $ARCHITECTURE
Homepage: $HOMEPAGE
Description: $DESCRIPTION
" > "./build/$BASEF/DEBIAN/control"

# copy bin file
cp ./hello-program/hello-world "./build/$BASEF/usr/bin/"

# build deb file
dpkg --build "./build/$BASEF/"

# print info about deb file
dpkg-deb --info "./build/$BASEF.deb" && echo "Package build was successful"

