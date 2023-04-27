#!/bin/sh
# This is INSECURE!
cat ~/tmprepo/apt-repo/dists/stable/Release | gpg --default-key example -abs > ~/tmprepo/apt-repo/dists/stable/Release.gpg
cat ~/tmprepo/apt-repo/dists/stable/Release | gpg --default-key example -abs --clearsign > ~/tmprepo/apt-repo/dists/stable/InRelease

