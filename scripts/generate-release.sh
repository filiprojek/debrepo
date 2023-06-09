#!/bin/sh
set -e
. ../../config # this file is in /apt-repo/config

do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:"
    for f in $(find -type f); do
        f=$(echo $f | cut -c3-) # remove ./ prefix
        if [ "$f" = "Release" ]; then
            continue
        fi
        echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)"
    done
}

if [ ! -f "../../config" ]; then
	echo "error - config file does not exists"
	exit 1;
fi


cat << EOF
Origin: $ORIGIN
Label: $LABEL
Suite: $SUITE
Codename: $CODENAME
Version: $VERSION
Architectures: $ARCHITECTURES
Components: $COMPONENTS
Description: $DESCRIPTION
Date: $(date -Ru)
EOF

do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"

