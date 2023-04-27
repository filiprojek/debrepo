#!/bin/sh
KEY="$1"

echo "debrepo: signing using $KEY"

cat ./apt-repo/dists/stable/Release | gpg --default-key $KEY -abs > ./apt-repo/dists/stable/Release.gpg
cat ./apt-repo/dists/stable/Release | gpg --default-key $KEY -abs --clearsign > ./apt-repo/dists/stable/InRelease

