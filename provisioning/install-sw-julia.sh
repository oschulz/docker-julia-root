#!/bin/bash -e

source "$(cd "$(dirname "$0")" && pwd)/install-sw-config.sh"

PACKAGE_VERSION="$1"
if [ -z "${PACKAGE_VERSION}" ] ; then
    echo "ERROR: Syntax: $0 PACKAGE_VERSION" >&2
    exit 1
fi

echo "Installing Julia v${PACKAGE_VERSION} ..." >&2

SW_DIR="${SW_DIR:-/opt}"
ENV_SCRIPT="${ENV_SCRIPT:-env.sh}"

MODULE_SUBDIR="julia/${PACKAGE_VERSION}"

curl "https://julialang.s3.amazonaws.com/bin/linux/x64/0.5/julia-${PACKAGE_VERSION}-linux-x86_64.tar.gz" \
    | tar -C "${SW_DIR}" -x -z -f - --transform 's!^julia-..........\($\|/\)!'"${MODULE_SUBDIR}"'\1!'

cat >> "${ENV_SCRIPT}" <<EOF
export PATH="${SW_DIR}/${MODULE_SUBDIR}/bin:\$PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_SUBDIR}/lib:\$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="${SW_DIR}/${MODULE_SUBDIR}/lib/julia:\$LD_LIBRARY_PATH"
EOF
