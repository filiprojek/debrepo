echo "debrepo: signing using $KEY"
#!/bin/sh
REPODIR="$1"
. "$REPODIR/apt-repo/config"

if [ -z "$DEFAULT_GPG" ]; then
	echo "error: no gpg key provided in config file"
	exit 1
fi

KEY="$DEFAULT_GPG"

echo "debrepo: signing using $KEY"

# ensure keys dir exists and export public key (ASCII armored) so clients can import it
mkdir -p "$REPODIR/apt-repo/keys"
gpg --export --armor "$KEY" > "$REPODIR/apt-repo/keys/public.key" 2>/dev/null || {
	echo "warning: failed to export public key for $KEY"
}

cat "$REPODIR/apt-repo/dists/stable/Release" | gpg --default-key "$KEY" -abs > "$REPODIR/apt-repo/dists/stable/Release.gpg"
cat "$REPODIR/apt-repo/dists/stable/Release" | gpg --default-key "$KEY" -abs --clearsign > "$REPODIR/apt-repo/dists/stable/InRelease"

