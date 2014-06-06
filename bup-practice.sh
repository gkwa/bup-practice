#!/bin/sh

set -o errexit

srcpath="$(pwd)/src dir"
srcpath="$(pwd)/srcdir"
srcdir="$(basename "$srcpath")"

mkdir -p "$srcdir"
# wget -P "$srcdir" --timestamping http://installer-bin.streambox.com/mysql-essential-5.1.52-win32.msi
# (cd "$srcdir" && split -a10 -b1m mysql-essential-5.1.52-win32.msi)

rm -rf "$srcdir.bup"

bup -d "$srcdir.bup" init
bup -d "$srcdir.bup" index "$srcdir"
bup -d "$srcdir.bup" save -n "$srcdir" "$srcdir"
bup -d "$srcdir.bup" ls --human-readable -a -l --human-readable "$srcdir"
bup -d "$srcdir.bup" restore -C "$srcdir"2
GIT_DIR="$srcdir.bup" git log
GIT_DIR="$srcdir.bup" git log "$srcdir"
du -sh  "$srcdir.bup"
bup -d "$srcdir.bup" ls "$srcdir"
bup -d "$srcdir.bup" ls "$srcdir" -v
bup -d "$srcdir.bup" ls --human-readable "$srcdir"
bup -d "$srcdir.bup" ls --human-readable -a "$srcdir"
