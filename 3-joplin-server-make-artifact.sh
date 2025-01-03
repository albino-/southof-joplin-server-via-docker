#!/usr/bin/env bash

# image comes from:
#  - https://hub.docker.com/r/joplin/server

#set -x

source vars.sh

archive="southof-joplin-${GHCI_JOPLIN_VER}.tar.xz"
#archive="southof-joplin-${ver}.tar.gz"

orig=$(pwd)
cd "${target}"
cd ..
echo "== Building compressed tar for server version: ${GHCI_JOPLIN_VER}"
tar cfJ "${archive}" "joplin"
#tar cfz "${archive}" "joplin"
mv "${archive}" "${orig}/"
